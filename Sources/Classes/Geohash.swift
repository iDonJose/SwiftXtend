//
//  Geohash.swift
//  SwiftXtend
//
//  Created by José Donor on 25/11/2018.
//

/// Source : https://github.com/chrisveness/latlon-geohash


/// Helper for converting from geolocation to geohash and vice-versa
public struct Geohash {

	public struct Area {

		public var latitudeMin: Double
		public var latitudeMax: Double
		public var longitudeMin: Double
		public var longitudeMax: Double

		public var center: (latitude: Double, longitude: Double) {
			return ((latitudeMax + latitudeMin) / 2, (longitudeMax + longitudeMin) / 2)
		}

		public func contains(latitude: Double,
							 longitude: Double) -> Bool {
			return latitude >= latitudeMin
				&& latitude <= latitudeMax
				&& longitude >= longitudeMin
				&& longitude <= longitudeMax
		}

	}

	public enum Direction: String {

		case north
		case west
		case south
		case east

		case northWest
		case southWest
		case southEast
		case northEast

	}


	private static let base32 = "0123456789bcdefghjkmnpqrstuvwxyz"

	private static let base32ToBits = base32
		.enumerated()
		.map { ($1, String(number: $0, base: 2, minLength: 5)) }
		.reduce([Character: String]()) {
			var dictionary = $0
			dictionary[$1.0] = $1.1
			return dictionary
		}

	private static let bitsToBase32 = base32ToBits
		.reduce([String: Character]()) {
			var dictionary = $0
			dictionary[$1.1] = $1.0
			return dictionary
		}

	private static let neighbours: [Direction: [String]] = [
		.north: ["p0r21436x8zb9dcf5h7kjnmqesgutwvy",
				 "bc01fg45238967deuvhjyznpkmstqrwx"],
		.west: ["238967debc01fg45kmstqrwxuvhjyznp",
				"14365h7k9dcfesgujnmqp0r2twvyx8zb"],
		.south: ["14365h7k9dcfesgujnmqp0r2twvyx8zb",
				 "238967debc01fg45kmstqrwxuvhjyznp"],
		.east: ["bc01fg45238967deuvhjyznpkmstqrwx",
				"p0r21436x8zb9dcf5h7kjnmqesgutwvy"]
	]

	private static let borders: [Direction: [String]] = [
		.north: ["prxz", "bcfguvyz"],
		.west: ["0145hjnp", "028b"],
		.south: ["028b", "0145hjnp"],
		.east: ["bcfguvyz", "prxz"]
	]


	/// Decodes a geohash
	public static func decode(_ geohash: String) -> Area? {

		var bits = ""

		for char in geohash {
			guard let newBits = base32ToBits[char] else { return nil }
			bits += newBits
		}

		let (latitudeBits, longitudeBits) = bits
			.enumerated()
			.reduce(("", "")) { coordinates, tuple in
				var coordinates = coordinates
				let (offset, bit) = tuple

				if offset % 2 == 0 { coordinates.1 += String(bit) }
				else { coordinates.0 += String(bit) }

				return coordinates
			}

		let (latitudeMin, latitudeMax) = latitudeBits
			.reduce((-90.0, 90.0)) { range, bit -> (Double, Double) in
				let mean = (range.0 + range.1) / 2
				return bit == "1"
					? (mean, range.1)
					: (range.0, mean)
			}

		let (longitudeMin, longitudeMax) = longitudeBits
			.reduce((-180.0, 180.0)) { range, bit -> (Double, Double) in
				let mean = (range.0 + range.1) / 2
				return bit == "1"
					? (mean, range.1)
					: (range.0, mean)
			}

		return Area(latitudeMin: latitudeMin,
					latitudeMax: latitudeMax,
					longitudeMin: longitudeMin,
					longitudeMax: longitudeMax)
	}


	/// Encodes a location with a given precision in meters
	public static func encode(latitude: Double,
							  longitude: Double,
							  precision: Double) -> String {
		var length: Int

		switch precision {
		case 2_500_000...: length = 1
		case 625_000...: length = 2
		case 78_000...: length = 3
		case 19_550...: length = 4
		case 2_445...: length = 5
		case 611...: length = 6
		case 76...: length = 7
		case 19...: length = 8
		case 2.38...: length = 9
		case 0.6...: length = 10
		case 0.07...: length = 11
		default: length = 12
		}

		return encode(latitude: latitude,
					  longitude: longitude,
					  length: length)
	}

	/// Encodes a location to a geohash with a given length
	public static func encode(latitude: Double,
							  longitude: Double,
							  length: Int) -> String {

		let latitudeBits = (0..<length * 5)
			.reduce(("", -90.0, 90.0)) { result, _ -> (String, Double, Double) in
				let (latitudeBits, min, max) = result
				let mean = (min + max) / 2

				return latitude <= mean
					? (latitudeBits + "0", min, mean)
					: (latitudeBits + "1", mean, max)
			}.0

		let longitudeBits = (0..<length * 5)
			.reduce(("", -180.0, 180.0)) { result, _ -> (String, Double, Double) in
				let (longitudeBits, min, max) = result
				let mean = (min + max) / 2

				return longitude <= mean
					? (longitudeBits + "0", min, mean)
					: (longitudeBits + "1", mean, max)
			}.0

		let bits = zip(longitudeBits.map { $0 }, latitudeBits.map { $0 })
			.flatMap { [$0, $1] }

		let characters = (0..<length)
			.map { $0 * 5 }
			.map { String(bits[$0...$0 + 4]) }
			.map { bitsToBase32[$0]! }

		return String(characters)
	}

	/// Gets adjacent geohash in a given direction
	public static func neighboor(of geohash: String,
								 at direction: Direction) -> String {

		guard !geohash.isBlank else { return "" }

		switch direction {
		case .northWest:
			let hash = neighboor(of: geohash, at: .north)
			return neighboor(of: hash, at: .west)
		case .southWest:
			let hash = neighboor(of: geohash, at: .south)
			return neighboor(of: hash, at: .west)
		case .southEast:
			let hash = neighboor(of: geohash, at: .south)
			return neighboor(of: hash, at: .east)
		case .northEast:
			let hash = neighboor(of: geohash, at: .north)
			return neighboor(of: hash, at: .east)
		default: break
		}


		let type = geohash.length % 2
		let lastCharacter = geohash.last!
		var parent = String(geohash.dropLast())

		// Checks edge cases which have not common prefix
		if !parent.isEmpty
			&& borders[direction]![type].contains(lastCharacter) {

			parent = neighboor(of: parent, at: direction)
		}

		let index = neighbours[direction]![type].firstIndex(of: lastCharacter)!

		return parent + String(base32[index])

	}

	/// All adjacent neighboor
	public static func neighboor(of geohash: String) -> [Direction: String] {

		let northHash = neighboor(of: geohash, at: .north)
		let southHash = neighboor(of: geohash, at: .south)

		return [
			.north: northHash,
			.northWest: neighboor(of: northHash, at: .west),
			.west: neighboor(of: geohash, at: .west),
			.southWest: neighboor(of: southHash, at: .west),
			.south: southHash,
			.southEast: neighboor(of: northHash, at: .east),
			.east: neighboor(of: geohash, at: .east),
			.northEast: neighboor(of: southHash, at: .east)
		]

	}

}
