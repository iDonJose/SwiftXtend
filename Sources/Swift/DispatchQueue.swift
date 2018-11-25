//
//  DispatchQueue.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension DispatchQueue {

	/// Executes blocks if it is already main thread or runs block synchronously on main
	public class func syncOnMain(_ block: @escaping () -> Void) {
		if Thread.isMainThread { block() }
		else { main.sync(execute: block) }
	}

	/// Executes blocks if it is already main thread or runs block asynchronously on main
	public class func asyncOnMain(_ block: @escaping () -> Void) {
		if Thread.isMainThread { block() }
		else { main.async(execute: block) }
	}

}
