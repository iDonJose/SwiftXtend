#  Validate Podspec by running 'pod spec lint SwigftXtend.podspec'
#  Podspec attributes : http://docs.cocoapods.org/specification.html
#  Podspecs examples : https://github.com/CocoaPods/Specs/

Pod::Spec.new do |s|

    s.name         = "SwiftXtend"
    s.version      = "1.4.0"
    s.summary      = "A collection of classes, protocols and Swift extensions"
    s.description  = <<-DESC
                        `SwiftXtend` offers some new fancy classes, new handy protocols and extends Swift types.
						It allows you to boost your productivity while using Swift.
                        DESC
    s.homepage     = "https://github.com/iDonJose/SwiftXtend"
    s.source       = { :git => "https://github.com/iDonJose/SwiftXtend.git", :tag => "#{s.version}" }

    s.license      = { :type => "Apache 2.0", :file => "LICENSE" }

    s.author       = { "iDonJose" => "donor.develop@gmail.com" }


    s.ios.deployment_target = "8.0"


	s.subspec 'Core' do |core|
		core.frameworks = "Foundation"
		core.source_files  = "Sources/**/*.{h,swift}"
	end

	s.subspec 'UIKit' do |uikit|

		uikit.frameworks = "UIKit"
		uikit.dependency 'SwiftXtend/Core'
		uikit.xcconfig = { "OTHER_SWIFT_FLAGS" => "-D USE_UIKIT" }

	end

	s.default_subspecs = 'Core', 'UIKit'

end
