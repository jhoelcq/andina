target 'News' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for News
  
  pod 'FirebaseCore'
  # pod 'GoogleSignIn', '5.0.2'
  pod 'Alamofire'
  pod 'SDWebImage', '5.15.5'
  pod 'SideMenu', '6.5.0'
  
  target 'NewsTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NewsUITests' do
    # Pods for testing
  end

end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.5'
  end
 end
end
