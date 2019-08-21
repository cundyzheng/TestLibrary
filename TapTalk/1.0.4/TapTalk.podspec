Pod::Spec.new do |s|
s.name         = "TapTalk"
s.version      = "1.0.4"
s.summary      = "Powerful Chat Engine"
s.homepage = "https://github.com/crisbarril/LogsFramework"
s.description  = "A powerful chat engine."

s.homepage     = "https://www.moselo.com"

s.license = { :type => 'MIT', :text => <<-LICENSE
Copyright 2012
Permission is granted to...
LICENSE
}

s.platform     = :ios, "10.0"

s.author             = { "Ritchie Nathaniel" => "ritchie@moselo.com" }
#s.swift_version = '4.0'

s.source = { :http => "https://www.dropbox.com/s/0ado7l6f4a3gl2i/Binaries.zip?dl=0" }

#s.vendored_frameworks = "TapTalk.framework"

s.static_framework = true

# ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  If your library depends on compiler flags you can set them in the xcconfig hash
#  where they will only apply to your library. If you depend on other Podspecs
#  you can include multiple dependencies to ensure it works.

# s.requires_arc = true

# s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
# s.xcconfig = { 'USER_HEADER_SEARCH_PATHS' => '"${PROJECT_DIR}/.."/**' }

s.dependency "AFNetworking", "~> 3.1.0"
s.dependency "SocketRocket"
s.dependency "JSONModel", "~> 1.1"
s.dependency "Realm", "3.13.1"
s.dependency "SDWebImage", "4.4.2"
s.dependency "ZBarSDK", "~> 1.3"
s.dependency "PodAsset"
s.dependency "GooglePlaces"
s.dependency "GooglePlacePicker"
s.dependency "GoogleMaps"
s.dependency "ZSWTappableLabel", "~> 2.0"

# ――― Prefix Header ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.prefix_header_contents ='#import "Configs.h"', '#import "TAPStyle.h"', '#import "AFNetworkActivityIndicatorManager.h"', '#import "NSUserDefaults+MPSecureUserDefaults.h"', '#import "PodAsset.h"', '#import "TapTalk.h"', '#import "TAPUtil.h"', '#import "TAPChatManager.h"', '#import "TAPConnectionManager.h"', '#import "TAPContactManager.h"', '#import "TAPContactCacheManager.h"', '#import "TAPCustomBubbleManager.h"', '#import "TAPCustomKeyboardManager.h"', '#import "TAPDataManager.h"', '#import "TAPDatabaseManager.h"', '#import "TAPEncryptorManager.h"', '#import "TAPFetchMediaManager.h"', '#import "TAPFileDownloadManager.h"', '#import "TAPFileUploadManager.h"', '#import "TAPGroupManager.h"', '#import "TAPLocationManager.h"', '#import "TAPMessageStatusManager.h"', '#import "TAPNetworkManager.h"', '#import "TAPNotificationManager.h"', '#import "TAPOldDataManager.h"', '#import "TAPStyleManager.h"', '#import "TAPGrowingTextView.h"', '#import "TAPImageView.h"', '#import "TAPSearchBarView.h"', '#import "UIImage+Color.h"'

end
