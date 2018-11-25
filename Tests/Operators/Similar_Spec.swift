//
//  Similar_Spec.swift
//  SwiftXtend-Tests
//
//  Created by José Donor on 22/11/2018.
//

import Nimble
import Quick
@testable import SwiftXtend



struct Object: Similar, Hashable {

	var id: String
	var value: Int

	init(id: String = UUID().uuidString,
		 value: Int) {
		self.id = id
		self.value = value
	}

	var hashValue: Int {
		return id.hashValue
	}

	static func == (lhs: Object, rhs: Object) -> Bool {
		return lhs.id == rhs.id && lhs.value == rhs.value
	}

	static func ~~ (lhs: Object, rhs: Object) -> Bool {
		return lhs.id == rhs.id
	}

}


class Similar_Spec: QuickSpec {
	override func spec() {

		describe("Objects") {

			describe("`~~ (similar)`") {
				it("should be similar") {

					let A = Object(id: "1", value: 1)
					let B = Object(id: "1", value: 2)

					expect(A ~~ B).to(beTrue())

				}
			}

			describe("`!~ (not similar)`") {
				it("should be not similar") {

					let A = Object(id: "1", value: 1)
					let B = Object(id: "2", value: 2)

					expect(A ~~ B).to(beFalse())

				}
			}

		}

		describe("Optional objects") {

			describe("`~~ (similar)`") {

				context("non-nil objects") {
					it("should be similar") {

						let A: Object? = Object(id: "1", value: 1)
						let B: Object? = Object(id: "1", value: 2)

						expect(A ~~ B).to(beTrue())

					}
				}

				context("nil objects") {
					it("should be similar") {

						let A: Object? = nil
						let B: Object? = nil

						expect(A ~~ B).to(beTrue())

					}
				}

			}

			describe("`!~ (not similar)`") {

				context("non-nil objects") {
					it("should be not similar") {

						let A: Object? = Object(id: "1", value: 1)
						let B: Object? = Object(id: "2", value: 2)

						expect(A ~~ B).to(beFalse())

					}
				}

				context("a nil & a non-nil objects") {
					it("should be not similar") {

						let A: Object? = Object(id: "1", value: 1)
						let B: Object? = nil

						expect(A ~~ B).to(beFalse())

					}
				}

			}

		}

		describe("Arrays") {

			describe("`~~ (similar)`") {
				it("should be similar") {

					let A = Object(id: "1", value: 1)
					let B = Object(id: "2", value: 2)
					let C = Object(id: "3", value: 3)

					let a = Object(id: "1", value: 10)
					let b = Object(id: "2", value: 20)
					let c = Object(id: "3", value: 30)

					expect([A, B, C] ~~ [a, b, c]).to(beTrue())

				}
			}

			describe("`!~ (not similar)`") {

				context("when arrays are different size") {
					it("should be not similar") {

						let A = Object(id: "1", value: 1)
						let B = Object(id: "2", value: 2)
						let C = Object(id: "3", value: 3)

						let a = Object(id: "1", value: 10)
						let b = Object(id: "2", value: 20)

						expect([A, B, C] ~~ [a, b]).to(beFalse())

					}
				}

				context("when two elements are not similar") {
					it("should be not similar") {

						let A = Object(id: "1", value: 1)
						let B = Object(id: "2", value: 2)
						let C = Object(id: "3", value: 3)

						let a = Object(id: "1", value: 10)
						let b = Object(id: "2", value: 20)
						let c = Object(id: "4", value: 3)

						expect([A, B, C] ~~ [a, b, c]).to(beFalse())

					}
				}

			}

		}

		describe("Sets") {

			describe("`~~ (similar)`") {
				it("should be similar") {

					let A = Object(id: "1", value: 1)
					let B = Object(id: "2", value: 2)
					let C = Object(id: "3", value: 3)

					let a = Object(id: "1", value: 10)
					let b = Object(id: "2", value: 20)
					let c = Object(id: "3", value: 30)

					expect(Set([A, B, C]) ~~ Set([c, a, b])).to(beTrue())

				}
			}

			describe("`!~ (not similar)`") {

				context("when arrays are different size") {
					it("should be not similar") {

						let A = Object(id: "1", value: 1)
						let B = Object(id: "2", value: 2)
						let C = Object(id: "3", value: 3)

						let a = Object(id: "1", value: 10)
						let b = Object(id: "2", value: 20)

						expect(Set([A, B, C]) ~~ Set([b, a])).to(beFalse())

					}
				}

				context("when two elements are not similar") {
					it("should be not similar") {

						let A = Object(id: "1", value: 1)
						let B = Object(id: "2", value: 2)
						let C = Object(id: "3", value: 3)

						let a = Object(id: "1", value: 10)
						let b = Object(id: "2", value: 20)
						let c = Object(id: "4", value: 3)

						expect(Set([A, B, C]) ~~ Set([c, b, a])).to(beFalse())

					}
				}

			}

		}

		describe("Dictionaries") {

			describe("`~~ (similar)`") {
				it("should be similar") {

					let A = Object(id: "1", value: 1)
					let B = Object(id: "2", value: 2)
					let C = Object(id: "3", value: 3)

					let a = Object(id: "1", value: 10)
					let b = Object(id: "2", value: 20)
					let c = Object(id: "3", value: 30)

					expect([1: A, 2: B, 3: C] ~~ [1: a, 2: b, 3: c]).to(beTrue())

				}
			}

			describe("`!~ (not similar)`") {

				context("when arrays are different size") {
					it("should be not similar") {

						let A = Object(id: "1", value: 1)
						let B = Object(id: "2", value: 2)
						let C = Object(id: "3", value: 3)

						let a = Object(id: "1", value: 10)
						let b = Object(id: "2", value: 20)

						expect([1: A, 2: B, 3: C] ~~ [1: a, 2: b]).to(beFalse())

					}
				}

				context("when two values are not similar") {
					it("should be not similar") {

						let A = Object(id: "1", value: 1)
						let B = Object(id: "2", value: 2)
						let C = Object(id: "3", value: 3)

						let a = Object(id: "1", value: 10)
						let b = Object(id: "2", value: 20)
						let c = Object(id: "4", value: 3)

						expect([1: A, 2: B, 3: C] ~~ [1: a, 2: b, 3: c]).to(beFalse())

					}
				}

			}

		}

	}
}
