//
//  String_Spec.swift
//  SwiftXtend-Tests
//
//  Created by José Donor on 24/11/2018.
//

import Nimble
import Quick
@testable import SwiftXtend



class String_Spec: QuickSpec {
	override func spec() {

		describe("String") {

			describe("`init(number:base:minLength:)`") {
				it("converts a number in given base") {

					let string = String(number: 98, base: 2, minLength: 8)

					expect(string) == "01100010"

				}
			}

			describe("`urlEscaped`") {
				it("replaces not allowed characters") {

					expect("coffee".urlEscaped) == "coffee"
					expect("café".urlEscaped) == "caf%C3%A9"

				}
			}

			describe("`isFrenchPhoneNumber`") {
				it("checks if it is a valid french phone number") {

					expect("06 08 15 95 77".isFrenchPhoneNumber).to(beTrue())
					expect("+33 6 08 15 95 77".isFrenchPhoneNumber).to(beTrue())
					expect("06 08 15 95".isFrenchPhoneNumber).to(beFalse())

				}
			}

			describe("`isEmail`") {
				it("checks if it is a valid email") {

					expect("john@doe.com".isEmail).to(beTrue())
					expect("john@.com".isEmail).to(beFalse())

				}
			}

			describe("`shuffled()`") {
				it("shuffles string") {

					let string = "a cappella"
					let shuffled = string.shuffled()

					expect(shuffled) != string

				}
			}

		}

	}
}
