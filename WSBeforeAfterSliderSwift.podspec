#
# Be sure to run `pod lib lint WSBeforeAfterSliderSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WSBeforeAfterSliderSwift'
  s.version          = '1.0.0'
  s.summary          = 'Before After slider comparison view. Auto play comparison mode.'
  s.swift_version = '5.0'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Before After slider comparison view. Easy to integrate and use as mentioned by example project. Now added auto play comparison mode.'

  s.homepage         = 'https://github.com/WebsoftProfession/WSBeforeAfterSliderSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WebsoftProfession' => 'websoftprofession@gmail.com' }
  s.source           = { :git => 'https://github.com/WebsoftProfession/WSBeforeAfterSliderSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'WSBeforeAfterSliderSwift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WSBeforeAfterSliderSwift' => ['WSBeforeAfterSliderSwift/Assets/*.png']
  # }

  s.frameworks = 'UIKit'
  s.swift_versions = '5.0'
end
