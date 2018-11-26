#  Validate Podspec by running 'pod spec lint <Framework>.podspec'
#  Podspec attributes : http://docs.cocoapods.org/specification.html
#  Podspecs examples : https://github.com/CocoaPods/Specs/

Pod::Spec.new do |s|

    s.name         = "SwiftXtend"
    s.version      = "1.0.0"
    s.summary      = "Swift, extended"
    s.description  = <<-DESC
                        `SwiftXtend` adds a set of handy classes and extends Swift.
                        DESC
    s.homepage     = "https://github.com/iDonJose/SwiftXtend"
    s.source       = { :git => "https://github.com/iDonJose/SwiftXtend.git", :tag => "#{s.version}" }

    s.license      = { :type => "Apache 2.0", :file => "LICENSE" }

    s.author       = { "iDonJose" => "donor.develop@gmail.com" }


    s.ios.deployment_target = "8.0"

    s.source_files  = "Sources/**/*.{h,swift}"
	s.exclude_files = [
		"Sources/Conversions/CGFloat+Conversion.swift",
		"Sources/Operators/Interpolable/CG+Interpolable.swift",
		"Sources/Operators/Interpolable/UIKit+Interpolable.swift"
	]

    s.frameworks = "Foundation"


	s.subspec 'Core' do |core|

	end

	s.subspec 'UIKit' do |uikit|

		uikit.source_files = [
			"Sources/Conversions/CGFloat+Conversion.swift",
			"Sources/Operators/Interpolable/CG+Interpolable.swift",
			"Sources/Operators/Interpolable/UIKit+Interpolable.swift"
		]
		uikit.frameworks = "UIKit"
		uikit.xcconfig = { "OTHER_SWIFT_FLAGS" => "-D USE_UIKIT" }

	end

	s.default_subspecs = 'Core', 'UIKit'

end
