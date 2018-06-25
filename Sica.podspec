#
#  Be sure to run `pod spec lint Sica.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "Sica"
  s.version      = "0.1.0"
  s.summary      = "Sica can execute various animations sequentially or parallely"
  s.homepage     = "https://github.com/cats-oss/Sica"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "funzin" => "nakazawa_fumito@abema.tv" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/cats-oss/Sica.git", :tag => "#{s.version}" }
  s.source_files = "Sica/**/*.{swift}"
  s.swift_version = '4.1'
end
