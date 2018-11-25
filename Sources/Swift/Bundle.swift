//
//  Bundle.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension Bundle {

	/// Application Version
	public static var appVersion: (major: Int, minor: Int, patch: Int) {

		guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
			else { return (0, 0, 0) }

		let components = version.components(separatedBy: ".")

		switch components.count {
		case 0: return (0, 0, 0)
		case 1: return (Int(components[0]) ?? 0, 0, 0)
		case 2: return (Int(components[0]) ?? 0, Int(components[1]) ?? 0, 0)
		default: return (Int(components[0]) ?? 0, Int(components[1]) ?? 0, Int(components[2]) ?? 0)
		}

	}


	/// Application Build Number
	public static var appBuild: Int {

		if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {

			return Int(build) ?? 0
		}
		else {
			return 0
		}

	}

}
