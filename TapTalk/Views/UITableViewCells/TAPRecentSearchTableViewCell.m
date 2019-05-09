//
//  TAPRecentSearchTableViewCell.m
//  TapTalk
//
//  Created by Welly Kencana on 15/10/18.
//  Copyright © 2018 Moselo. All rights reserved.
//

#import "TAPRecentSearchTableViewCell.h"

@interface TAPRecentSearchTableViewCell ()

@property (strong, nonatomic) TAPImageView *profileImageView;
@property (strong, nonatomic) UIImageView *expertIconImageView;
@property (strong, nonatomic) UIImageView *muteImageView;
@property (strong, nonatomic) UIView *bubbleUnreadView;
@property (strong, nonatomic) UIView *separatorView;
@property (strong, nonatomic) UILabel *roomNameLabel;
@property (strong, nonatomic) UILabel *numberOfUnreadMessageLabel;

@end

@implementation TAPRecentSearchTableViewCell
#pragma mark - Lifecycle
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat leftPadding = 16.0f;
        CGFloat rightPadding = 16.0f;
        _profileImageView = [[TAPImageView alloc] initWithFrame:CGRectMake(leftPadding, 9.0f, 52.0f, 52.0f)];
        self.profileImageView.backgroundColor = [UIColor clearColor];
        self.profileImageView.layer.cornerRadius = CGRectGetHeight(self.profileImageView.frame) / 2.0f;
        self.profileImageView.clipsToBounds = YES;
        self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.profileImageView];
        
        _expertIconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame) - 22.0f, CGRectGetMaxY(self.profileImageView.frame) - 22.0f, 22.0f, 22.0f)];
        self.expertIconImageView.image = [UIImage imageNamed:@"TAPIconExpert" inBundle:[TAPUtil currentBundle] compatibleWithTraitCollection:nil];
        self.expertIconImageView.alpha = 0.0f;
        [self addSubview:self.expertIconImageView];
        
        _bubbleUnreadView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 16.0f, 25.0f, 0.0f, 20.0f)];
        self.bubbleUnreadView.layer.cornerRadius = CGRectGetHeight(self.bubbleUnreadView.frame) / 2.0f;
        [self addSubview:self.bubbleUnreadView];
        
        _muteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.bubbleUnreadView.frame) - 4.0f, 0.0f, 0.0f, 13.0f)];
        self.muteImageView.alpha = 0.0f;
        self.muteImageView.image = [UIImage imageNamed:@"TAPIconMute" inBundle:[TAPUtil currentBundle] compatibleWithTraitCollection:nil];
        [self addSubview:self.muteImageView];
        
        _roomNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame) + 8.0f, 15.0f, CGRectGetMinX(self.muteImageView.frame) - CGRectGetMaxX(self.profileImageView.frame) - 4.0f - 8.0f, 20.0f)];
        self.roomNameLabel.textColor = [TAPUtil getColor:TAP_COLOR_BLACK_44];
        self.roomNameLabel.font = [UIFont fontWithName:TAP_FONT_NAME_BOLD size:14.0f];
        [self addSubview:self.roomNameLabel];
        self.muteImageView.center = CGPointMake(self.muteImageView.center.x, self.roomNameLabel.center.y);
        
        _numberOfUnreadMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake(7.0f, 3.0f, 0.0f, 13.0f)];
        self.numberOfUnreadMessageLabel.textColor = [UIColor whiteColor];
        self.numberOfUnreadMessageLabel.font = [UIFont fontWithName:TAP_FONT_NAME_BOLD size:11.0f];
        [self.bubbleUnreadView addSubview:self.numberOfUnreadMessageLabel];
        
        _separatorView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.roomNameLabel.frame), 70.0f - 1.0f, CGRectGetWidth([UIScreen mainScreen].bounds) - CGRectGetMinX(self.roomNameLabel.frame), 1.0f)];
        self.separatorView.backgroundColor = [TAPUtil getColor:@"E4E4E4"];
        [self addSubview:self.separatorView];
    }
    
    return self;
}

#pragma mark - Custom Method
//- (void)deleteButtonDidTapped {
//    if ([self.delegate respondsToSelector:@selector(recentSearchTableViewCellDeleteButtonDidTappedAtIndexPath:)]) {
//        [self.delegate recentSearchTableViewCellDeleteButtonDidTappedAtIndexPath:self.cellIndexPath];
//    }
//}

//- (void)setRecentSearchTableViewCellWithString:(NSString *)recentSearchString {
//    self.recentSearchLabel.text = recentSearchString;
//}

@end
