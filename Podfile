source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
inhibit_all_warnings!
use_frameworks!

def tapTalk_pods
    pod 'AFNetworking', '~> 3.1.0'
    pod 'SocketRocket'
    pod 'JSONModel', '~> 1.1'
    pod 'Realm', '3.13.1'
    pod 'ZBarSDK', '~> 1.3'
    pod 'PodAsset'
    pod 'SDWebImage', '4.4.2'
    pod 'GooglePlaces'
    pod 'GooglePlacePicker'
    pod 'GoogleMaps'
    pod 'ZSWTappableLabel', '~> 2.0'
end

target "TapTalk" do
    tapTalk_pods
end

#libwebp framework is currently doesn't support bitcode, must disable all bitcode for project, please check it gradually and remove below line to enable bitcode once libwebp have support bitcode
#post_install do |installer|
#    installer.pods_project.targets.each do |target|
#        target.build_configurations.each do |config|
#            config.build_settings['ENABLE_BITCODE'] = 'NO'
#            config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
#        end
#    end
#end

#bitcode enable
#post_install do |installer|
#  installer.pods_project.targets.each do |target|
#    target.build_configurations.each do |config|
#
#      # set valid architecture
#      config.build_settings['VALID_ARCHS'] = 'arm64 armv7 armv7s i386 x86_64'
#
#      # build active architecture only (Debug build all)
#      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
#
#      config.build_settings['ENABLE_BITCODE'] = 'YES'
#
#      if config.name == 'Release' || config.name == 'Pro'
#        config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'
#        else # Debug
#        config.build_settings['BITCODE_GENERATION_MODE'] = 'marker'
#      end
#
#      cflags = config.build_settings['OTHER_CFLAGS'] || ['$(inherited)']
#
#      if config.name == 'Release' || config.name == 'Pro'
#        cflags << '-fembed-bitcode'
#        else # Debug
#        cflags << '-fembed-bitcode-marker'
#      end
#
#      config.build_settings['OTHER_CFLAGS'] = cflags
#    end
#  end
#end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'
      config.build_settings['ENABLE_BITCODE'] = 'YES'
    end
  end
end
