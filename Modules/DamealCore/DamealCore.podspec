#
# Be sure to run `pod lib lint DamealCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DamealCore'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DamealCore.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Davin DJ/DamealCore'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Davin DJ' => 'davindx88@gmail.com' }
  s.source           = { :git => 'https://github.com/Davin DJ/DamealCore.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '14.0'

  s.source_files = 'DamealCore/Module/**/*.{swift}'
  s.resources = 'DamealCore/Module/**/*.{xcassets,json,storyboard,xib,xcdatamodeld}'

  
  # s.resource_bundles = {
  #   'DamealCore' => ['DamealCore/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.dependency 'Alamofire', '~> 5.6.1'
  s.dependency 'Swinject', '~> 2.8.0'
  s.dependency 'RealmSwift', '~> 10'
end
