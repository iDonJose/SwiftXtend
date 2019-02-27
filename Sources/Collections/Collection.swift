//
//  Collection.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 14/02/2019.
//


extension Collection {

	/// Performs a binary search on collection and finds out first index where predicate is true.
	public func binarySearch(firstWhere predicate: (Element) -> Bool) -> Index? {

		var lowerBound = startIndex
		var upperBound = endIndex

		while lowerBound < upperBound {
			let midIndex = index(lowerBound,
								 offsetBy: distance(from: lowerBound, to: upperBound) / 2)
			if predicate(self[midIndex]) {
				upperBound = midIndex
			} else {
				lowerBound = index(after: midIndex)
			}
		}

		return upperBound != endIndex
			? upperBound
			: nil
	}

}


extension Collection where Element: Comparable {

	/// Performs a binary search on collection and finds out index of element.
	public func binarySearch(_ element: Element) -> Index? {

		guard let index = binarySearch(firstWhere: { $0 >= element }) else { return nil }

		return self[index] == element
			? index
			: nil
	}

}
