# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Chaser' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Chaser

  pod "HyperioniOS/Core", :configurations => ['Debug']

  # Pods for amplify-learn
  pod 'AWSMobileClient'
  pod 'AWSAuthUI'
  pod 'AWSUserPoolsSignIn'

#"Configurations => Debug" ensures it is only included in debug builds. Add any configurations you would like Hyperion to be included in.
pod 'HyperioniOS/AttributesInspector', :configurations => ['Debug'] # Optional plugin
pod 'HyperioniOS/Measurements', :configurations => ['Debug'] # Optional plugin
pod 'HyperioniOS/SlowAnimations', :configurations => ['Debug'] # Optional plugin

  target 'ChaserTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ChaserUITests' do
    # Pods for testing
  end

end
