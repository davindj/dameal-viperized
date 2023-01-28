Pod::Spec.new do |s|
  s.name             = 'DamealAbout'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DamealAbout.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Davin DJ/DamealAbout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Davin DJ' => 'davindx88@gmail.com' }
  s.source           = { :git => 'https://github.com/Davin DJ/DamealAbout.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'

  s.source_files = 'DamealAbout/Module/**/*.{swift}'
  s.resources = "DamealAbout/Module/**/*.{xcassets,json,storyboard,xib,xcdatamodeld}"

  s.dependency 'DamealCore'
end
