//
//  TapTalk.h
//  TapTalk
//
//  Created by Ritchie Nathaniel on 11/09/18.
//  Copyright © 2018 Moselo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>

#import "TAPLoginViewController.h"
#import "TAPRoomListViewController.h"
#import "TAPCustomNotificationAlertViewController.h"
#import "TAPChatViewController.h"
#import "TAPChatManager.h"

#import "TAPUserModel.h"
#import "TAPMessageModel.h"
#import "TAPCustomKeyboardItemModel.h"
#import "TAPProductModel.h"

#import <AVKit/AVKit.h>
#import <Photos/Photos.h>

//! Project version number for TapTalk.
FOUNDATION_EXPORT double TapTalkVersionNumber;

//! Project version string for TapTalk.
FOUNDATION_EXPORT const unsigned char TapTalkVersionString[];

typedef NS_ENUM(NSInteger, TapTalkInstanceState) {
    TapTalkInstanceStateActive, //Active state triggered when application enter foreground
    TapTalkInstanceStateInactive //Inactive state triggered when application terminated by os, or crash, or when in background and have finished background sequence
};

typedef NS_ENUM(NSInteger, TapTalkEnvironment) {
    TapTalkEnvironmentProduction,
    TapTalkEnvironmentStaging,
    TapTalkEnvironmentDevelopment
};

@protocol TapTalkDelegate <NSObject>

- (void)tapTalkShouldResetAuthTicket;
- (void)tapTalkDidTappedNotificationWithMessage:(TAPMessageModel * _Nonnull)message fromActiveController:(UIViewController * _Nonnull)currentActiveController;

@optional
//User Profile
- (void)tapTalkProfileButtonDidTapped:(UIViewController * _Nonnull)viewController
                            otherUser:(TAPUserModel * _Nonnull)otherUser;

//Custom Keyboard
- (void)tapTalkCustomKeyboardDidTappedWithSender:(TAPUserModel * _Nonnull)sender
                                       recipient:(TAPUserModel * _Nonnull)recipient
                                            room:(TAPRoomModel * _Nonnull)room
                                    keyboardItem:(TAPCustomKeyboardItemModel * _Nonnull)keyboardItem;

- (NSArray<TAPCustomKeyboardItemModel *> * _Nonnull)tapTalkCustomKeyboardForSender:(TAPUserModel * _Nonnull)sender
                                                                recipient:(TAPUserModel * _Nonnull)recipient;

//Product List
- (void)tapTalkProductListBubbleLeftOrSingleOptionDidTappedProduct:(TAPProductModel * _Nonnull)product room:(TAPRoomModel * _Nonnull)room recipient:(TAPUserModel * _Nonnull)recipient isSingleOption:(BOOL)isSingleOption;

- (void)tapTalkProductListBubbleRightOptionDidTappedWithProduct:(TAPProductModel * _Nonnull)product room:(TAPRoomModel * _Nonnull)room recipient:(TAPUserModel * _Nonnull)recipient isSingleOption:(BOOL)isSingleOption;

//Quote
- (void)tapTalkQuoteDidTappedWithUserInfo:(NSDictionary * _Nonnull)userInfo;

//Badge
- (void)tapTalkSetBadgeWithNumberOfUnreadRooms:(NSInteger)numberOfUnreadRooms;

//Notification
- (void)tapTalkDidRequestRemoteNotification;

@end

@interface TapTalk : NSObject
NS_ASSUME_NONNULL_BEGIN
@property (weak, nonatomic) UIWindow *activeWindow;
@property (weak, nonatomic) id<TapTalkDelegate> delegate;
@property (nonatomic) TapTalkInstanceState instanceState;
@property (nonatomic) TapTalkEnvironment environment;
NS_ASSUME_NONNULL_END
//Initalization
+ (TapTalk * _Nonnull)sharedInstance;

//Authentication
- (void)setAuthTicket:(NSString * _Nonnull)authTicket
              success:(void (^ _Nonnull)(void))success
              failure:(void (^ _Nonnull)(NSError *  _Nonnull error))failure;
- (BOOL)isAuthenticated;

//Property
- (TAPRoomListViewController *  _Nonnull)roomListViewController;
- (TAPLoginViewController *  _Nonnull)loginViewController;
- (TAPCustomNotificationAlertViewController *  _Nonnull)customNotificationAlertViewController;

//AppDelegate Handling
- (void)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary * _Nonnull)launchOptions environment:(TapTalkEnvironment)environment;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (void)application:(UIApplication * _Nonnull)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData * _Nonnull)deviceToken;
- (void)application:(UIApplication * _Nonnull)application didReceiveRemoteNotification:(NSDictionary * _Nonnull)userInfo fetchCompletionHandler:(void (^ _Nonnull)(UIBackgroundFetchResult result))completionHandler;
- (void)application:(UIApplication * _Nonnull)application didReceiveLocalNotification:(UILocalNotification * _Nonnull)notification;

//Push Notification
- (void)userNotificationCenter:(UNUserNotificationCenter * _Nonnull)center willPresentNotification:(UNNotification * _Nonnull)notification withCompletionHandler:(void (^ _Nonnull)(UNNotificationPresentationOptions options))completionHandler;
- (void)userNotificationCenter:(UNUserNotificationCenter * _Nonnull)center didReceiveNotificationResponse:(UNNotificationResponse * _Nonnull)response withCompletionHandler:(void(^ _Nonnull)())completionHandler;

//Exception Handling
- (void)handleException:(NSException * _Nonnull)exception;

//Custom Method
//General Set Up
- (void)activateInAppNotificationInWindow:(UIWindow * _Nonnull)activeWindow;
- (void)setEnvironment:(TapTalkEnvironment)environment;
- (UINavigationController * _Nonnull)getCurrentTapTalkActiveNavigationController;
- (UIViewController * _Nonnull)getCurrentTapTalkActiveViewController;
- (void)setUserAgent:(NSString * _Nonnull)userAgent;
- (void)setAppKeySecret:(NSString * _Nonnull)appKeySecret;
- (void)setAppKeyID:(NSString * _Nonnull)appKeyID;
- (void)refreshActiveUser;
- (void)updateUnreadBadgeCount;
- (TAPUserModel * _Nonnull)getTapTalkActiveUser;

//Chat
- (void)openRoomWithXCUserID:(NSString * _Nonnull)XCUserID
               prefilledText:(NSString * _Nonnull)prefilledText
                  quoteTitle:(nullable NSString *)quoteTitle
                quoteContent:(nullable NSString *)quoteContent
         quoteImageURLString:(nullable NSString *)quoteImageURL
                    userInfo:(nullable NSDictionary *)userInfo
    fromNavigationController:(UINavigationController * _Nonnull)navigationController
                     success:(void (^ _Nonnull)(void))success
                     failure:(void (^ _Nonnull)(NSError * _Nonnull error))failure;
- (void)openRoomWithRoom:(TAPRoomModel * _Nonnull)room
              quoteTitle:(nullable NSString *)quoteTitle
            quoteContent:(nullable NSString *)quoteContent
     quoteImageURLString:(nullable NSString *)quoteImageURL
                userInfo:(nullable NSDictionary *)userInfo
fromNavigationController:(UINavigationController * _Nonnull)navigationController
                animated:(BOOL)isAnimated;
- (void)openRoomWithOtherUser:(TAPUserModel * _Nonnull)otherUser
     fromNavigationController:(UINavigationController * _Nonnull)navigationController;
- (void)openRoomWithRoom:(TAPRoomModel * _Nonnull)room
fromNavigationController:(UINavigationController * _Nonnull)navigationController
                animated:(BOOL)isAnimated;
- (void)openRoomWithRoom:(TAPRoomModel * _Nonnull)room
scrollToMessageWithLocalID:(NSString * _Nonnull)messageLocalID
fromNavigationController:(UINavigationController * _Nonnull)navigationController
                animated:(BOOL)isAnimated;
- (void)shouldRefreshAuthTicket;
- (void)sendTextMessage:(NSString * _Nonnull)message recipientUser:(TAPUserModel * _Nonnull)recipient success:(void (^ _Nonnull)(void))success failure:(void (^ _Nonnull)(NSError * _Nonnull error))failure;
- (void)sendProductMessage:(NSArray<TAPProductModel *> * _Nonnull)productArray recipientUser:(TAPUserModel * _Nonnull)recipient success:(void (^ _Nonnull)(void))success failure:(void (^ _Nonnull)(NSError *error))failure;
- (void)sendImageMessage:(UIImage * _Nonnull)image caption:(nullable NSString *)caption recipientUser:(TAPUserModel * _Nonnull)recipient success:(void (^ _Nonnull)(void))success failure:(void (^ _Nonnull)(NSError *error))failure;
- (void)sendImageMessageWithAsset:(PHAsset * _Nonnull)asset caption:(nullable NSString *)caption recipientUser:(TAPUserModel * _Nonnull)recipient success:(void (^ _Nonnull)(void))success failure:(void (^ _Nonnull)(NSError * _Nonnull error))failure;
- (void)getTapTalkUserWithClientUserID:(NSString * _Nonnull)clientUserID success:(void (^ _Nonnull)(TAPUserModel *  _Nonnull tapTalkUser))success failure:(void (^ _Nonnull)(NSError *  _Nonnull error))failure;


//Custom Keyboard
- (NSArray * _Nonnull)getCustomKeyboardWithSender:(TAPUserModel * _Nonnull)sender
                              recipient:(TAPUserModel * _Nonnull)recipient;
- (void)customKeyboardDidTappedWithSender:(TAPUserModel * _Nonnull)sender
                                recipient:(TAPUserModel * _Nonnull)recipient
                             keyboardItem:(TAPCustomKeyboardItemModel * _Nonnull)keyboardItem;

//Custom Bubble
- (void)addCustomBubbleDataWithClassName:(NSString * _Nonnull)className type:(NSInteger)type delegate:(id _Nonnull)delegate;

//Custom Quote
- (void)quoteDidTappedWithUserInfo:(NSDictionary * _Nonnull)userInfo;

//Other
- (void)disconnect;
- (void)logoutAndClearAllDataWithSuccess:(void (^ _Nonnull)(void))success
                                 failure:(void (^ _Nonnull)(NSError * _Nonnull error))failure;
- (void)clearAllData;

//TapTalk Internal Usage Method
- (void)processingProductListLeftOrSingleOptionButtonTappedWithData:(NSArray * _Nonnull)dataArray isSingleOption:(BOOL)isSingleOption;
- (void)processingProductListRightOptionButtonTappedWithData:(NSArray * _Nonnull)dataArray isSingleOption:(BOOL)isSingleOption;
- (void)setBadgeWithNumberOfUnreadRooms:(NSInteger)numberOfUnreadRooms;

@end

