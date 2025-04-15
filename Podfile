# Uncomment the next line to define a global platform for your project
platform :ios, '17.0'

target 'SwiftUIMail' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SwiftUIMail
  # 支付宝 SDK
  # https://opendocs.alipay.com/open/00dn76
  pod  'AlipaySDK-iOS'

  target 'SwiftUIMailTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SwiftUIMailUITests' do
    # Pods for testing
  end

end

# 解决不用 IOS 版本的兼容性问题
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.0'
    end
  end
end
