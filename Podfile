# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

workspace 'dameal.xcworkspace'
project 'dameal.xcodeproj'

def damealcore_pod
  pod 'DamealCore', :path => 'Modules/DamealCore'
end

def damealmeal_pod
  pod 'DamealMeal', :path => 'Modules/DamealMeal'
end

def damealfavorite_pod
  pod 'DamealFavorite', :path => 'Modules/DamealFavorite'
end

def damealabout_pod
  pod 'DamealAbout', :path => 'Modules/DamealAbout'
end

def development_pods
  damealcore_pod
  damealmeal_pod
  damealfavorite_pod
  damealabout_pod
end

target 'dameal' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for dameal
  development_pods
end

target 'damealTests' do
  inherit! :search_paths
  # Pods for testing
end

# For Custom Module
target 'DamealCore_Example' do
  use_frameworks!
  project 'Modules/DamealCore/Example/DamealCore.xcodeproj'
  
  damealcore_pod
end 

target 'DamealMeal_Example' do
  use_frameworks!
  project 'Modules/DamealMeal/Example/DamealMeal.xcodeproj'
  
  damealmeal_pod
end 

target 'DamealFavorite_Example' do
  use_frameworks!
  project 'Modules/DamealFavorite/Example/DamealFavorite.xcodeproj'
  
  damealfavorite_pod
end 

target 'DamealAbout_Example' do
  use_frameworks!
  project 'Modules/DamealAbout/Example/DamealAbout.xcodeproj'
  
  damealabout_pod
end 

