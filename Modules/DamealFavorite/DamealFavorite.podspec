Pod::Spec.new do |s|
  s.name             = 'DamealFavorite'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DamealFavorite.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Davin DJ/DamealFavorite'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Davin DJ' => 'davindx88@gmail.com' }
  s.source           = { :git => 'https://github.com/Davin DJ/DamealFavorite.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'

  s.source_files = 'DamealFavorite/Module/**/*.{swift}'
  s.resources = "DamealFavorite/Module/**/*.{xcassets,json,storyboard,xib,xcdatamodeld}"

  s.dependency 'DamealCore' 
  s.dependency 'DamealMeal' 
end
