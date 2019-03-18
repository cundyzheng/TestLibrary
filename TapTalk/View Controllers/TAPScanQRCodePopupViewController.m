//
//  TAPScanQRCodePopupViewController.m
//  TapTalk
//
//  Created by Welly Kencana on 11/3/19.
//

#import "TAPScanQRCodePopupViewController.h"
#import "TAPScanQRCodePopupView.h"

@interface TAPScanQRCodePopupViewController ()

@property (strong, nonatomic) TAPScanQRCodePopupView *scanQRCodePopupView;

@property (strong, nonatomic) TAPUserModel *searchedUser;

@end

@implementation TAPScanQRCodePopupViewController

#pragma mark - Lifecycle
- (void)loadView {
    [super loadView];
    
    _scanQRCodePopupView = [[TAPScanQRCodePopupView alloc] initWithFrame:[TAPBaseView frameWithoutNavigationBar]];
    [self.scanQRCodePopupView.closePopupButton addTarget:self action:@selector(closePopupButtonDidTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.scanQRCodePopupView.addContactButton addTarget:self action:@selector(addContactButtonDidTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.scanQRCodePopupView.chatNowButton addTarget:self action:@selector(chatNowButtonDidTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.scanQRCodePopupView showPopupView:NO animated:NO];
    [self.view addSubview:self.scanQRCodePopupView];
    [self.view bringSubviewToFront:self.scanQRCodePopupView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
}

#pragma mark - Custom Method
- (void)closePopupButtonDidTapped {
    [self.scanQRCodePopupView setPopupViewToDefault];
    
    [UIView animateWithDuration:0.2f animations:^{
        [self.scanQRCodePopupView showPopupView:NO animated:NO];
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:^{
            //completion
        }];
    }];
}

- (void)addContactButtonDidTapped {
    [self.scanQRCodePopupView animateExpandingView];
    
    [TAPDataManager callAPIAddContactWithUserID:self.searchedUser.userID success:^(NSString *message) {
        //Add user to Contact Manager
        self.searchedUser.isContact = YES;
        [[TAPContactManager sharedManager] addContactWithUserModel:self.searchedUser saveToDatabase:YES];
        
        //Refresh Contact List From API
        [TAPDataManager callAPIGetContactList:^(NSArray *userArray) {
        } failure:^(NSError *error) {
        }];
        
    } failure:^(NSError *error) {
#ifdef DEBUG
        NSLog(@"%@", error);
#endif
    }];
}

- (void)chatNowButtonDidTapped {
    [self.scanQRCodePopupView setPopupViewToDefault];
    [self.scanQRCodePopupView showPopupView:NO animated:NO];
    
    [self dismissViewControllerAnimated:NO completion:^{
        [[TapTalk sharedInstance] openRoomWithOtherUser:self.searchedUser fromNavigationController:self.previousNavigationController];
        
        //CS Note - Remove this VC in Navigation Stack to skip on pop
        NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.previousNavigationController.viewControllers];
        NSInteger arrayCount = [navigationArray count];
        [navigationArray removeObjectAtIndex:arrayCount - 2]; //-1 because array index start from 0, -1 because a chat view controller has been added before removing this view controller.
        self.previousNavigationController.viewControllers = navigationArray;
    }];
}

- (void)popUpInfoTappedSingleButtonOrRightButton {
    [super popUpInfoTappedSingleButtonOrRightButton];
    
    [self dismissViewControllerAnimated:NO completion:^{
        //completion
    }];
}

- (void)animatePopupWithSuccess:(void (^)(void))success
                        failure:(void (^)(NSError *error))failure {
    [self.scanQRCodePopupView showPopupView:YES animated:YES];
    [self.scanQRCodePopupView setIsLoading:YES animated:YES];
    [TAPDataManager callAPIGetUserByUserID:self.code success:^(TAPUserModel *user) {
        
        NSString *currentUserID = [TAPDataManager getActiveUser].userID;
        currentUserID = [TAPUtil nullToEmptyString:currentUserID];
        
        if ([self.code isEqualToString:currentUserID]) {
            //Add theirselves
            [self.scanQRCodePopupView setIsLoading:NO animated:YES];
            [self.scanQRCodePopupView setPopupInfoWithUserData:user isContact:YES];
            success();
        }
        else {
            //Upsert User to Contact Manager
            [[TAPContactManager sharedManager] addContactWithUserModel:user saveToDatabase:NO];
            self.searchedUser = user;
            [TAPDataManager getDatabaseContactByUserID:user.userID success:^(BOOL isContact, TAPUserModel *obtainedUser) {
                [self.scanQRCodePopupView setIsLoading:NO animated:YES];
                [self.scanQRCodePopupView setPopupInfoWithUserData:user isContact:isContact];
                success();
            } failure:^(NSError *error) {
#ifdef DEBUG
                NSLog(@"%@", error);
#endif
                failure(error);
            }];
        }
    } failure:^(NSError *error) {
        [self.scanQRCodePopupView setIsLoading:NO animated:YES];
        [self.scanQRCodePopupView showPopupView:NO animated:YES];
        [self showPopupViewWithPopupType:TAPPopUpInfoViewControllerTypeErrorMessage title:NSLocalizedString(@"Failed", @"") detailInformation:error.domain];
        
        failure(error);
    }];
}

@end
