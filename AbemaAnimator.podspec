#
#  Be sure to run `pod spec lint AbemaAnimator.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "AbemaAnimator"
  s.version      = "0.1.0"
  s.summary      = "AbemaAnimator can execute various animations sequentially or parallely"
  s.homepage     = "https://github.com/abema/AbemaAnimator"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "funzin" => "nakazawa_fumito@abema.tv" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "git@github.com:abema/AbemaAnimator.git", :tag => "#{s.version}" }
  s.source_files = "AbemaAnimator/**/*.{swift}"
  s.swift_version = '4.0'
end
