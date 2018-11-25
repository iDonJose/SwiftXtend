//
//  Randomizable.swift
//  SwiftXtend
//
//  Created by José Donor on 22/11/2018.
//


/// Alolows to generate random values
public protocol Randomizable {

	static var random: Self { get }

}



/// Allows to get a random element
public protocol CRandomizable: Collection {

	var random: Element? { get }

	func randomSubset(ofSize size: Int) -> Self

}
