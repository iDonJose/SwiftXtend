//
//  Array_Spec.swift
//  SwiftXtend-Tests
//
//  Created by José Donor on 24/11/2018.
//

import Nimble
import Quick
@testable import SwiftXtend



class Array_Spec: QuickSpec {
	override func spec() {

		var array: [Int]!

		beforeEach {

			array = (0..<10).map { $0 }

		}


		describe("Array") {

			describe("`isIndexed(with:)`") {

				context("index is valid") {
					it("returns true") {
						expect(array.isIndexed(with: array.count - 1)).to(beTrue())
					}
				}

				context("index is invalid") {
					it("returns false") {
						expect(array.isIndexed(with: -1)).to(beFalse())
						expect(array.isIndexed(with: array.count)).to(beFalse())
					}
				}

			}

			describe("`get(_:)`") {

				context("index is valid") {
					it("returns element") {
						expect(array.get(array.count - 1)) == array.count - 1
					}
				}

				context("index is invalid") {
					it("returns nil") {
						expect(array.get(-1)).to(beNil())
						expect(array.get(array.count)).to(beNil())
					}
				}

			}

			describe("`get(_:do:)`") {

				context("index is valid") {
					it("executes block") {

						var didExecuteBlock = false

						array.get(array.count - 1, do: { element in
							didExecuteBlock = element == array.count - 1
						})

						expect(didExecuteBlock).to(beTrue())

					}
				}

				context("index is invalid") {
					it("doesn't execute block") {

						var didExecuteBlock = false

						let block: (Int) -> Void = { element in
							didExecuteBlock = element == array.count - 1
						}

						array.get(-1, do: block)
						expect(didExecuteBlock).to(beFalse())

						array.get(array.count, do: block)
						expect(didExecuteBlock).to(beFalse())

					}
				}

			}

			describe("`empteenth(_:matching:)`") {

				it("returns empteenth element") {

					let matching: (Int) -> Bool = { $0 % 4 == 0 }

					expect(array.empteenth(1, matching: matching)) == 0
					expect(array.empteenth(2, matching: matching)) == 4
					expect(array.empteenth(3, matching: matching)) == 8

				}

				context("index is invalid") {
					it("returns nil") {

						let matching: (Int) -> Bool = { $0 % 4 == 0 }

						expect(array.empteenth(0, matching: matching)).to(beNil())

					}
				}

				context("index is out of bounds") {
					it("returns nil") {

						let matching: (Int) -> Bool = { $0 % 4 == 0 }

						expect(array.empteenth(4, matching: matching)).to(beNil())

					}
				}

			}

			describe("`removeFirst(where:)`") {

				it("removes first element matching") {

					let matching: (Int) -> Bool = { $0 / 3 == 1 }

					array.removeFirst(where: matching)
					expect(array) == [0, 1, 2, 4, 5, 6, 7, 8, 9]

				}

				context("there is no matching element") {
					it("doesn't remove any element") {

						let matching: (Int) -> Bool = { $0 / 25 == 1 }

						array.removeFirst(where: matching)
						expect(array.count) == 10

					}
				}

			}

			describe("`uniquing(_:)`") {
				it("removes all duplicates") {

					let areEqual: (Int, Int) -> Bool = { ($1 - $0).abs == 2 }

					array = array.uniquing(areEqual)
					expect(array) == [0, 1, 4, 5, 8, 9]

				}
			}

			describe("`split(chunkSize:)`") {
				it("splits in chunks of given size") {

					let splittedArray = array.split(chunkSize: 4)
					expect(splittedArray) == [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9]]

				}
			}

			describe("`shuffle()`") {
				it("shuffles array") {

					let shuffledArray = array.shuffled()
					expect(shuffledArray) != array

				}
			}

		}

	}
}
