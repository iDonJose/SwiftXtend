//
//  Swift+Identifiable.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 19/12/2018.
//


extension Bool: Identifiable {

	public typealias Identifier = Bool

	public var id: Identifier {
        get { return self }
        set { self = id }
    }

    public init(id: Identifier) {
        self = id
    }

}

extension UInt: Identifiable {

	public typealias Identifier = UInt

    public var id: Identifier {
        get { return self }
        set { self = id }
    }

    public init(id: Identifier) {
        self = id
    }

}

extension Int: Identifiable {

    public typealias Identifier = Int

    public var id: Identifier {
        get { return self }
        set { self = id }
    }

    public init(id: Identifier) {
        self = id
    }

}

extension Float: Identifiable {

	public typealias Identifier = Float

    public var id: Identifier {
        get { return self }
        set { self = id }
    }

    public init(id: Identifier) {
        self = id
    }

}
extension Double: Identifiable {

    public typealias Identifier = Double

    public var id: Identifier {
        get { return self }
        set { self = id }
    }

    public init(id: Identifier) {
        self = id
    }

}
extension Decimal: Identifiable {

    public typealias Identifier = Decimal

    public var id: Identifier {
        get { return self }
        set { self = id }
    }

    public init(id: Identifier) {
        self = id
    }

}

extension String: Identifiable {

    public typealias Identifier = String

    public var id: Identifier {
        get { return self }
        set { self = id }
    }

    public init(id: Identifier) {
        self = id
    }

}

extension Date: Identifiable {

    public typealias Identifier = Date

    public var id: Identifier {
        get { return self }
        set { self = id }
    }

    public init(id: Identifier) {
        self = id
    }

}

extension IndexPath: Identifiable {

    public typealias Identifier = IndexPath

    public var id: Identifier {
        get { return self }
        set { self = id }
    }

    public init(id: Identifier) {
        self = id
    }

}
