//
//  Geohash_Spec.swift
//  SwiftXtend-Tests
//
//  Created by José Donor on 25/11/2018.
//

import Nimble
import Quick
@testable import SwiftXtend



class Geohash_Spec: QuickSpec {
	override func spec() {

		describe("Geohash") {

			describe("`encode(latitude:longitude:precision:)`") {
				it("encodes to geohash") {

					let geohash = Geohash.encode(latitude: 45.52, longitude: 2.18, precision: 10)

					expect(geohash) == "u01dcwemj"

				}
			}

			describe("`encode(latitude:longitude:length:)`") {
				it("encodes to geohash with given length") {

					let geohash = Geohash.encode(latitude: 45.52, longitude: 2.18, length: 8)

					expect(geohash) == "u01dcwem"

				}
			}

			describe("`encode(latitude:longitude:length:)`") {
				it("encodes to geohash with given length") {

					let location = Geohash.decode("gb2k223z9")!.center
					let error = 0.0001

					expect((location.latitude - 47.156).abs) <= error
					expect((location.longitude - -10.885).abs) <= error

				}
			}

			describe("`neighboor(of:at:)`") {
				it("retrieves neighboor's geohash") {

					let north = Geohash.neighboor(of: "gb2k223z9", at: .north)
					expect(north) == "gb2k223zc"

					let southEast = Geohash.neighboor(of: "gb2k223z9", at: .southEast)
					expect(southEast) == "gb2k223z6"

				}
			}

		}

	}
}
