//
//  NumberFormatter.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 09/12/2018.
//


extension NumberFormatter {

	// MARK: - Initialize

	public convenience init(numberStyle: Style,
                            minimumIntegerDigits: Int? = nil,
                            minimumFractionDigits: Int? = nil,
                            minimumSignificantDigits: Int? = nil,
							maximumIntegerDigits: Int? = nil,
							maximumFractionDigits: Int? = nil,
							maximumSignificantDigits: Int? = nil,
							groupingSize: Int? = nil,
							groupingSeparator: String? = nil,
							roundingMode: RoundingMode? = nil,
							locale: Locale? = nil) {

		self.init()

		self.numberStyle = numberStyle


        if let minimumIntegerDigits = minimumIntegerDigits { self.minimumIntegerDigits = minimumIntegerDigits }
        if let minimumFractionDigits = minimumFractionDigits { self.minimumFractionDigits = minimumFractionDigits }
        if let minimumSignificantDigits = minimumSignificantDigits { self.minimumSignificantDigits = minimumSignificantDigits }

		if let minimumIntegerDigits = minimumIntegerDigits { self.minimumIntegerDigits = minimumIntegerDigits }
		if let minimumFractionDigits = minimumFractionDigits { self.minimumFractionDigits = minimumFractionDigits }
		if let minimumSignificantDigits = minimumSignificantDigits { self.minimumSignificantDigits = minimumSignificantDigits }

		if let groupingSize = groupingSize {
			self.groupingSize = groupingSize
			self.usesGroupingSeparator = true
		}
		if let groupingSeparator = groupingSeparator {
			self.groupingSeparator = groupingSeparator
			self.currencyGroupingSeparator = groupingSeparator
			self.usesGroupingSeparator = true
		}

		if let roundingMode = roundingMode { self.roundingMode = roundingMode }

		if let locale = locale { self.locale = locale }

	}

}
