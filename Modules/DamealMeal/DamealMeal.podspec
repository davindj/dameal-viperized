Pod::Spec.new do |s|
  s.name             = 'DamealMeal'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DamealMeal.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Davin DJ/DamealMeal'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Davin DJ' => 'davindx88@gmail.com' }
  s.source           = { :git => 'https://github.com/Davin DJ/DamealMeal.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'

  s.source_files = 'DamealMeal/Module/**/*.{swift}'
  s.resources = "DamealMeal/Module/**/*.{xcassets,json,storyboard,xib,xcdatamodeld}"

  s.dependency 'DamealCore' 
  s.dependency 'SDWebImageSwiftUI'
end
