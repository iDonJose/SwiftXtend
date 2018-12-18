//
//  IndexPath.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension IndexPath {

	/// IndexPath (row: 0, section: 0)
	public static var zero: IndexPath {
		return IndexPath(row: 0, section: 0)
	}


	/// Increments row and section.
	///
	/// - Parameters:
	///   - rows: Number of rows to add.
	///   - sections: Number of sections to add.
	/// - Returns: New index path.
	public func adding(rows: Int = 0,
					   sections: Int = 0) -> IndexPath {

		return IndexPath(row: (row + rows).min(0),
						 section: (section + sections).min(0))
	}

	/// Decrements row and section.
	///
	/// - Parameters:
	///   - rows: Number of rows to remove.
	///   - sections: Number of sections to remove.
	/// - Returns: New index path.
	public func removing(rows: Int = 0,
						 sections: Int = 0) -> IndexPath {

		return IndexPath(row: (row - rows).min(0),
						 section: (section - sections).min(0))
	}

}
