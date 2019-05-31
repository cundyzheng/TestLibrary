//
//  TAPMyFileBubbleTableViewCell.m
//  TapTalk
//
//  Created by Dominic Vedericho on 04/03/19.
//  Copyright © 2019 Moselo. All rights reserved.
//

#import "TAPMyFileBubbleTableViewCell.h"

@interface TAPMyFileBubbleTableViewCell ()

@property (strong, nonatomic) IBOutlet UIView *bubbleView;
@property (strong, nonatomic) IBOutlet UIView *replyView;
@property (strong, nonatomic) IBOutlet UIView *replyInnerView;
@property (strong, nonatomic) IBOutlet UIView *quoteView;
@property (strong, nonatomic) IBOutlet UILabel *bubbleLabel;
@property (strong, nonatomic) IBOutlet UILabel *fileDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *fileDescriptionSizePlaceholderLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UILabel *replyNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *replyMessageLabel;
@property (strong, nonatomic) IBOutlet UILabel *quoteTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *quoteSubtitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *forwardTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *forwardFromLabel;
@property (strong, nonatomic) IBOutlet UIImageView *sendingIconImageView;
@property (strong, nonatomic) IBOutlet UIImageView *statusIconImageView;
@property (strong, nonatomic) IBOutlet UIImageView *retryIconImageView;
@property (strong, nonatomic) IBOutlet TAPImageView *quoteImageView;
@property (strong, nonatomic) IBOutlet UIButton *replyButton;
@property (strong, nonatomic) IBOutlet UIButton *retryButton;

@property (strong, nonatomic) IBOutlet UIView *progressContainerView;
@property (strong, nonatomic) IBOutlet UIView *innerBackgroundView;
@property (strong, nonatomic) IBOutlet UIView *progressBarView;

@property (strong, nonatomic) IBOutlet UIView *cancelView;
@property (strong, nonatomic) IBOutlet UIView *downloadView;
@property (strong, nonatomic) IBOutlet UIView *doneDownloadView;
@property (strong, nonatomic) IBOutlet UIView *retryDownloadView;
@property (strong, nonatomic) IBOutlet UIImageView *cancelImageView;
@property (strong, nonatomic) IBOutlet UIImageView *downloadImageView;
@property (strong, nonatomic) IBOutlet UIImageView *doneDownloadImageView;
@property (strong, nonatomic) IBOutlet UIImageView *retryDownloadImageView;
@property (strong, nonatomic) IBOutlet UIImageView *fileImageView;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *downloadFileButton;
@property (strong, nonatomic) IBOutlet UIButton *doneDownloadButton;
@property (strong, nonatomic) IBOutlet UIButton *retryDownloadButton;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *statusLabelTopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *statusLabelHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *chatBubbleRightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *sendingIconLeftConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *sendingIconBottomConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *statusIconRightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyButtonRightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyViewHeightContraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyViewInnerViewLeadingContraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyNameLabelLeadingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyNameLabelTrailingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyMessageLabelLeadingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyMessageLabelTrailingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyButtonLeadingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyButtonTrailingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *quoteViewLeadingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *quoteViewTrailingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *quoteViewTopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *quoteViewBottomConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyViewLeadingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyViewTrailingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyViewTopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *replyViewBottomConstraint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *forwardTitleLabelHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *forwardFromLabelHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *forwardTitleLabelLeadingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *forwardFromLabelLeadingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *forwardTitleLabelTopConstraint;

@property (strong, nonatomic) UILongPressGestureRecognizer *bubbleViewLongPressGestureRecognizer;

@property (strong, nonatomic) NSString *statusLabelTimeString;

@property (strong, nonatomic) UIView *syncProgressSubView;
@property (strong, nonatomic) CAShapeLayer *progressLayer;
@property (nonatomic) CGFloat lastProgress;

@property (nonatomic) BOOL isDownloaded;
@property (nonatomic) CGFloat maxWidth;
@property (nonatomic) CGFloat maxHeight;
@property (nonatomic) CGFloat minWidth;
@property (nonatomic) CGFloat minHeight;
@property (nonatomic) CGFloat cellWidth;
@property (nonatomic) CGFloat cellHeight;

@property (nonatomic) CGFloat startAngle;
@property (nonatomic) CGFloat endAngle;
@property (nonatomic) CGFloat borderWidth;
@property (nonatomic) CGFloat pathWidth;
@property (nonatomic) CGFloat newProgress;
@property (nonatomic) NSInteger updateInterval;

@property (nonatomic) BOOL isOnSendingAnimation;
@property (nonatomic) BOOL isShouldChangeStatusAsDelivered;
@property (nonatomic) BOOL isShouldChangeStatusAsRead;
@property (nonatomic) BOOL isShowForwardView;

- (IBAction)replyButtonDidTapped:(id)sender;
- (IBAction)retryButtonDidTapped:(id)sender;
- (IBAction)quoteButtonDidTapped:(id)sender;
- (IBAction)retryUploadDownloadButtonDidTapped:(id)sender;
- (IBAction)downloadButtonDidTapped:(id)sender;
- (IBAction)doneDownloadButtonDidTapped:(id)sender;
- (IBAction)cancelButtonDidTapped:(id)sender;
- (void)handleBubbleViewLongPress:(UILongPressGestureRecognizer *)recognizer;
- (void)showReplyView:(BOOL)show withMessage:(TAPMessageModel *)message;
- (void)showQuoteView:(BOOL)show;
- (void)showForwardView:(BOOL)show;

- (void)setForwardData:(TAPForwardFromModel *)forwardData;
- (void)setQuote:(TAPQuoteModel *)quote userID:(NSString *)userID;
- (void)setBubbleCellColor;

@end

@implementation TAPMyFileBubbleTableViewCell
#pragma mark - Lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
    
    _startAngle = M_PI * 1.5;
    _endAngle = self.startAngle + (M_PI * 2);
    _borderWidth = 0.0f;
    _pathWidth = 4.0f;
    _newProgress = 0.0f;
    _updateInterval = 1;
    _cellWidth = 0.0f;
    _cellHeight = 0.0f;
    
    self.bubbleView.clipsToBounds = YES;
    self.statusLabelTopConstraint.constant = 0.0f;
    self.statusLabelHeightConstraint.constant = 0.0f;
    self.statusLabel.alpha = 0.0f;
    self.statusIconImageView.alpha = 0.0f;
    self.sendingIconImageView.alpha = 0.0f;
    
    self.progressContainerView.layer.cornerRadius = CGRectGetHeight(self.innerBackgroundView.frame) / 2.0f;
    self.progressBarView.layer.cornerRadius = CGRectGetHeight(self.progressBarView.frame) / 2.0f;
    
    _isDownloaded = NO;
    
    self.bubbleView.clipsToBounds = YES;
    
    self.bubbleView.layer.cornerRadius = 8.0f;
    self.bubbleView.layer.maskedCorners = kCALayerMaxXMaxYCorner | kCALayerMinXMinYCorner | kCALayerMinXMaxYCorner;
    self.retryIconImageView.alpha = 0.0f;
    self.retryButton.alpha = 0.0f;
    
    self.replyView.layer. cornerRadius = 4.0f;
    
    self.quoteImageView.layer.cornerRadius = 8.0f;
    self.quoteView.layer.cornerRadius = 8.0f;
    
    _bubbleViewLongPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(handleBubbleViewLongPress:)];
    self.bubbleViewLongPressGestureRecognizer.minimumPressDuration = 0.2f;
    [self.bubbleView addGestureRecognizer:self.bubbleViewLongPressGestureRecognizer];
    
    [self showQuoteView:NO];
    [self showForwardView:NO];
    
    [self showFileBubbleStatusWithType:TAPMyFileBubbleTableViewCellStateTypeUploading];
    
    [self setBubbleCellColor];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.chatBubbleRightConstraint.constant = 16.0f;
    self.statusLabelTopConstraint.constant = 0.0f;
    self.statusLabelHeightConstraint.constant = 0.0f;
    self.statusLabel.alpha = 0.0f;
    self.sendingIconImageView.alpha = 0.0f;
    self.sendingIconLeftConstraint.constant = 4.0f;
    self.sendingIconBottomConstraint.constant = -5.0f;
    self.retryIconImageView.alpha = 0.0f;
    self.retryButton.alpha = 0.0f;
    
    [self showReplyView:NO withMessage:nil];
    [self showQuoteView:NO];
    
    self.bubbleLabel.text = @"";
    self.statusLabel.text = @"";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - Custom Method
- (void)setBubbleCellColor {
    self.bubbleView.backgroundColor = [TAPUtil getColor:TAP_COLOR_ORANGE_00];
    self.quoteView.backgroundColor = [TAPUtil getColor:TAP_COLOR_ORANGE_200];
    self.replyInnerView.backgroundColor = [TAPUtil getColor:TAP_COLOR_ORANGE_200];
    self.replyView.backgroundColor = [TAPUtil getColor:TAP_COLOR_ORANGE_45];
    self.progressContainerView.backgroundColor = [TAPUtil getColor:TAP_COLOR_ORANGE_200];
    
    self.replyNameLabel.textColor = [TAPUtil getColor:TAP_COLOR_WHITE];
    self.replyMessageLabel.textColor = [TAPUtil getColor:TAP_COLOR_WHITE];
    self.quoteTitleLabel.textColor = [TAPUtil getColor:TAP_COLOR_WHITE];
    self.quoteSubtitleLabel.textColor = [TAPUtil getColor:TAP_COLOR_WHITE];
    self.forwardTitleLabel.textColor = [TAPUtil getColor:TAP_COLOR_WHITE];
    self.forwardFromLabel.textColor = [TAPUtil getColor:TAP_COLOR_WHITE];
    
    self.bubbleLabel.textColor = [TAPUtil getColor:TAP_COLOR_WHITE];
    self.fileDescriptionLabel.textColor = [TAPUtil getColor:TAP_COLOR_WHITE];
    self.fileDescriptionSizePlaceholderLabel.textColor = [TAPUtil getColor:TAP_COLOR_WHITE];
}

- (void)setMessage:(TAPMessageModel *)message {
    [super setMessage:message];
    
    if (![message.forwardFrom.localID isEqualToString:@""] && message.forwardFrom != nil) {
        [self showForwardView:YES];
        [self setForwardData:message.forwardFrom];
        _isShowForwardView = YES;
    }
    else {
        [self showForwardView:NO];
        _isShowForwardView = NO;
    }
    
    if ((![message.replyTo.messageID isEqualToString:@"0"] && ![message.replyTo.messageID isEqualToString:@""]) && ![message.quote.title isEqualToString:@""] && message.quote != nil && message.replyTo != nil) {
        //reply to exists
        //if reply exists check if image in quote exists
        //if image exists  change view to Quote View
        
        if (self.isShowForwardView) {
            self.forwardTitleLabelTopConstraint.constant = 10.0f;
        }
        else {
            self.forwardTitleLabelTopConstraint.constant = 11.0f;
        }
        
        if((message.quote.fileID && ![message.quote.fileID isEqualToString:@""]) || (message.quote.imageURL  && ![message.quote.fileID isEqualToString:@""])) {
            [self showReplyView:NO withMessage:nil];
            [self showQuoteView:YES];
            [self setQuote:message.quote userID:message.replyTo.userID];
        }
        else {
            [self showReplyView:YES withMessage:message];
            [self showQuoteView:NO];
        }
    }
    else if (![message.quote.title isEqualToString:@""] && message.quote != nil) {
        //quote exists
        
        if (self.isShowForwardView) {
            self.forwardTitleLabelTopConstraint.constant = 10.0f;
        }
        else {
            self.forwardTitleLabelTopConstraint.constant = 11.0f;
        }
        
        [self showReplyView:NO withMessage:nil];
        [self setQuote:message.quote userID:@""];
        [self showQuoteView:YES];
    }
    else {
        if (self.isShowForwardView) {
            self.forwardTitleLabelTopConstraint.constant = 10.0f;
        }
        else {
            self.forwardTitleLabelTopConstraint.constant = 0.0f;
        }
        
        [self showReplyView:NO withMessage:nil];
        [self showQuoteView:NO];
    }
    
    NSString *fileName = [message.data objectForKey:@"fileName"];
    fileName = [TAPUtil nullToEmptyString:fileName];
    
    NSString *fileExtension  = [[fileName pathExtension] uppercaseString];
    
    fileName = [fileName stringByDeletingPathExtension];
    
    if ([fileExtension isEqualToString:@""]) {
        fileExtension = [message.data objectForKey:@"mediaType"];
        fileExtension = [TAPUtil nullToEmptyString:fileExtension];
        fileExtension = [fileExtension lastPathComponent];
        fileExtension = [fileExtension uppercaseString];
    }
    
    self.bubbleLabel.text = fileName;
    
    NSString *fileSize = [NSByteCountFormatter stringFromByteCount:[[message.data objectForKey:@"size"] integerValue] countStyle:NSByteCountFormatterCountStyleBinary];
    self.fileDescriptionSizePlaceholderLabel.text = [NSString stringWithFormat:@"999.99 MB / %@", fileSize];
    self.fileDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@", fileSize, fileExtension];
    
    NSTimeInterval lastMessageTimeInterval = [message.created doubleValue] / 1000.0f; //change to second from milisecond
    
    NSDate *currentDate = [NSDate date];
    NSTimeInterval currentTimeInterval = [currentDate timeIntervalSince1970];
    
    NSTimeInterval timeGap = currentTimeInterval - lastMessageTimeInterval;
    NSDateFormatter *midnightDateFormatter = [[NSDateFormatter alloc] init];
    [midnightDateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]]; // POSIX to avoid weird issues
    midnightDateFormatter.dateFormat = @"dd-MMM-yyyy";
    NSString *midnightFormattedCreatedDate = [midnightDateFormatter stringFromDate:currentDate];
    
    NSDate *todayMidnightDate = [midnightDateFormatter dateFromString:midnightFormattedCreatedDate];
    NSTimeInterval midnightTimeInterval = [todayMidnightDate timeIntervalSince1970];
    
    NSTimeInterval midnightTimeGap = currentTimeInterval - midnightTimeInterval;
    
    NSDate *lastMessageDate = [NSDate dateWithTimeIntervalSince1970:lastMessageTimeInterval];
    NSString *lastMessageDateString = @"";
    if (timeGap <= midnightTimeGap) {
        //Today
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
        NSString *dateString = [dateFormatter stringFromDate:lastMessageDate];
        lastMessageDateString = [NSString stringWithFormat:NSLocalizedString(@"at %@", @""), dateString];
    }
    else if (timeGap <= 86400.0f + midnightTimeGap) {
        //Yesterday
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
        NSString *dateString = [dateFormatter stringFromDate:lastMessageDate];
        lastMessageDateString = [NSString stringWithFormat:NSLocalizedString(@"yesterday at %@", @""), dateString];
    }
    else {
        //Set date
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"dd/MM/yyyy HH:mm";
        
        NSString *dateString = [dateFormatter stringFromDate:lastMessageDate];
        lastMessageDateString = [NSString stringWithFormat:NSLocalizedString(@"at %@", @""), dateString];
    }
    
    NSString *statusString = [NSString stringWithFormat:NSLocalizedString(@"Sent %@", @""), lastMessageDateString];
    self.statusLabelTimeString = statusString;
    self.statusLabel.text = self.statusLabelTimeString;
}

- (void)receiveSentEvent {
    [super receiveSentEvent];
}

- (void)receiveDeliveredEvent {
    [super receiveDeliveredEvent];
}

- (void)receiveReadEvent {
    [super receiveReadEvent];
}

- (void)showStatusLabel:(BOOL)show {
    if (show) {
        [UIView animateWithDuration:0.2f animations:^{
            self.statusLabel.alpha = 1.0f;
            self.statusLabelTopConstraint.constant = 2.0f;
            self.statusLabelHeightConstraint.constant = 13.0f;
            self.replyButton.alpha = 1.0f;
            self.replyButtonRightConstraint.constant = 2.0f;
            self.statusIconImageView.alpha = 1.0f;
            [self.contentView layoutIfNeeded];
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
        }];
    }
    else {
        [UIView animateWithDuration:0.2f animations:^{
            self.statusLabel.alpha = 0.0f;
            self.statusLabelTopConstraint.constant = 0.0f;
            self.statusLabelHeightConstraint.constant = 0.0f;
            self.replyButton.alpha = 0.0f;
            self.replyButtonRightConstraint.constant = -28.0f;
            self.statusIconImageView.alpha = 1.0f;
            [self.contentView layoutIfNeeded];
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
        }];
    }
}

- (IBAction)replyButtonDidTapped:(id)sender {
    [super replyButtonDidTapped:sender];
    
    if ([self.delegate respondsToSelector:@selector(myFileReplyDidTapped:)]) {
        [self.delegate myFileReplyDidTapped:self.message];
    }
}

- (IBAction)retryButtonDidTapped:(id)sender {
    [super retryButtonDidTapped:sender];
    if ([self.delegate respondsToSelector:@selector(myFileRetryUploadDownloadButtonDidTapped:)]) {
        [self.delegate myFileRetryUploadDownloadButtonDidTapped:self.message];
    }
}

- (IBAction)retryUploadDownloadButtonDidTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(myFileRetryUploadDownloadButtonDidTapped:)]) {
        [self.delegate myFileRetryUploadDownloadButtonDidTapped:self.message];
    }
}

- (IBAction)downloadButtonDidTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(myFileDownloadButtonDidTapped:)]) {
        [self.delegate myFileDownloadButtonDidTapped:self.message];
    }
}

- (IBAction)doneDownloadButtonDidTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(myFileOpenFileButtonDidTapped:)]) {
        [self.delegate myFileOpenFileButtonDidTapped:self.message];
    }
}

- (IBAction)cancelButtonDidTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(myFileCancelButtonDidTapped:)]) {
        [self.delegate myFileCancelButtonDidTapped:self.message];
    }
}

- (void)handleBubbleViewTap:(UITapGestureRecognizer *)recognizer {
    [super handleBubbleViewTap:recognizer];
    
}

- (void)handleBubbleViewLongPress:(UILongPressGestureRecognizer *)recognizer {
    if(recognizer.state = UIGestureRecognizerStateEnded) {
        if ([self.delegate respondsToSelector:@selector(myFileBubbleLongPressedWithMessage:)]) {
            [self.delegate myFileBubbleLongPressedWithMessage:self.message];
        }
    }
}

- (IBAction)quoteButtonDidTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(myFileQuoteViewDidTapped:)]) {
        [self.delegate myFileQuoteViewDidTapped:self.message];
    }
}

- (void)showReplyView:(BOOL)show withMessage:(TAPMessageModel *)message {
    if (show) {
        //check id message sender is equal to active user id, if yes change the title to "You"
        if ([message.replyTo.userID isEqualToString:[TAPDataManager getActiveUser].userID]) {
            self.replyNameLabel.text = NSLocalizedString(@"You", @"");
        }
        else {
            self.replyNameLabel.text = message.quote.title;
        }

        self.replyMessageLabel.text = message.quote.content;
        self.replyViewHeightContraint.constant = 60.0f;
        self.replyViewBottomConstraint.active = YES;
        self.replyViewBottomConstraint.constant = 8.0f;
        self.replyViewTopConstraint.active = YES;
        self.replyViewTopConstraint.constant = 0.0f;
        self.replyViewInnerViewLeadingContraint.constant = 4.0f;
        self.replyNameLabelLeadingConstraint.constant = 4.0f;
        self.replyNameLabelTrailingConstraint.constant = 8.0f;
        self.replyMessageLabelLeadingConstraint.constant = 4.0f;
        self.replyMessageLabelTrailingConstraint.constant = 8.0f;
        self.replyButtonLeadingConstraint.active = YES;
        self.replyButtonTrailingConstraint.active = YES;
    }
    else {
        self.replyNameLabel.text = @"";
        self.replyMessageLabel.text = @"";
        self.replyViewHeightContraint.constant = 0.0f;
        self.replyViewBottomConstraint.active = YES;
        self.replyViewBottomConstraint.constant = 0.0f;
        self.replyViewTopConstraint.active = YES;

        if (self.isShowForwardView) {
            self.replyViewTopConstraint.constant = 8.0f;
        }
        else {
            self.replyViewTopConstraint.constant = 10.0f;
        }
        
        self.replyViewInnerViewLeadingContraint.constant = 0.0f;
        self.replyNameLabelLeadingConstraint.constant = 0.0f;
        self.replyNameLabelTrailingConstraint.constant = 0.0f;
        self.replyMessageLabelLeadingConstraint.constant = 0.0f;
        self.replyMessageLabelTrailingConstraint.constant = 0.0f;
        self.replyButtonLeadingConstraint.active = NO;
        self.replyButtonTrailingConstraint.active = NO;
    }
}

- (void)showQuoteView:(BOOL)show {
    if (show) {
        self.quoteViewLeadingConstraint.active = YES;
        self.quoteViewTrailingConstraint.active = YES;
        self.quoteViewTopConstraint.active = YES;
        self.quoteViewTopConstraint.constant = 0.0f;
        self.quoteViewBottomConstraint.active = YES;
        self.quoteView.alpha = 1.0f;
        self.replyViewBottomConstraint.active = NO;
        self.replyViewTopConstraint.active = NO;
    }
    else {
        self.quoteViewLeadingConstraint.active = NO;
        self.quoteViewTrailingConstraint.active = NO;
        self.quoteViewTopConstraint.active = NO;
        self.quoteViewBottomConstraint.active = NO;
        self.quoteView.alpha = 0.0f;
        self.replyViewBottomConstraint.active = YES;
        self.replyViewTopConstraint.active = YES;
    }
}

- (void)showForwardView:(BOOL)show {
    if (show) {
        self.forwardFromLabelHeightConstraint.constant = 16.0f;
        self.forwardTitleLabelHeightConstraint.constant = 16.0f;
        self.forwardFromLabelLeadingConstraint.active = YES;
        self.forwardTitleLabelLeadingConstraint.active = YES;
    }
    else {
        self.forwardFromLabelHeightConstraint.constant = 0.0f;
        self.forwardTitleLabelHeightConstraint.constant = 0.0f;
        self.forwardFromLabelLeadingConstraint.active = NO;
        self.forwardTitleLabelLeadingConstraint.active = NO;
    }
}

- (void)setForwardData:(TAPForwardFromModel *)forwardData {
    
    NSString *appendedFullnameString = [NSString stringWithFormat:@"From: %@", forwardData.fullname];
    
    //check id message sender is equal to active user id, if yes change the title to "You"
    if ([forwardData.userID isEqualToString:[TAPDataManager getActiveUser].userID]) {
        appendedFullnameString = NSLocalizedString(@"From: You", @"");
    }
    
    self.forwardFromLabel.text = appendedFullnameString;
    
    NSMutableAttributedString *attributedText =
    [[NSMutableAttributedString alloc]
     initWithAttributedString:[[NSAttributedString alloc] initWithString:self.forwardFromLabel.text]];
    
    [attributedText addAttribute:NSFontAttributeName
                           value:[UIFont fontWithName:TAP_FONT_NAME_BOLD size:12.0f]
                           range:NSMakeRange(6, [self.forwardFromLabel.text length] - 6)];
    
    self.forwardFromLabel.attributedText = attributedText;
}

- (void)setQuote:(TAPQuoteModel *)quote userID:(NSString *)userID {
    if ([quote.fileType isEqualToString:[NSString stringWithFormat:@"%ld", TAPChatMessageTypeFile]]) {
        //TYPE FILE
        self.fileImageView.alpha = 1.0f;
        self.quoteImageView.alpha = 0.0f;
    }
    else {
        if (quote.imageURL != nil && ![quote.imageURL isEqualToString:@""]) {
            [self.quoteImageView setImageWithURLString:quote.imageURL];
        }
        else if (quote.fileID != nil && ![quote.fileID isEqualToString:@""]) {
            [self.quoteImageView setImageWithURLString:quote.fileID];
        }
        self.fileImageView.alpha = 0.0f;
        self.quoteImageView.alpha = 1.0f;
    }
    
    //check id message sender is equal to active user id, if yes change the title to "You"
    if ([userID isEqualToString:[TAPDataManager getActiveUser].userID]) {
        self.quoteTitleLabel.text = NSLocalizedString(@"You", @"");
    }
    else {
        self.quoteTitleLabel.text = [TAPUtil nullToEmptyString:quote.title];
    }
    
    self.quoteSubtitleLabel.text = [TAPUtil nullToEmptyString:quote.content];
}

- (void)showDownloadedState:(BOOL)isShow {
    self.lastProgress = 0.0f;
    self.progressLayer.strokeEnd = 0.0f;
    self.progressLayer.strokeStart = 0.0f;
    [self.progressLayer removeAllAnimations];
    [self.syncProgressSubView removeFromSuperview];
    _progressLayer = nil;
    _syncProgressSubView = nil;
    
    if (isShow) {
        [self showFileBubbleStatusWithType:TAPMyFileBubbleTableViewCellStateTypeDoneDownloadedUploaded];
    }
    else {
        [self showFileBubbleStatusWithType:TAPMyFileBubbleTableViewCellStateTypeNotDownloaded];
    }
}

- (void)animateFinishedUploadFile {
    self.lastProgress = 0.0f;
    self.progressLayer.strokeEnd = 0.0f;
    self.progressLayer.strokeStart = 0.0f;
    [self.progressLayer removeAllAnimations];
    [self.syncProgressSubView removeFromSuperview];
    _progressLayer = nil;
    _syncProgressSubView = nil;
    
    [self showFileBubbleStatusWithType:TAPMyFileBubbleTableViewCellStateTypeDoneDownloadedUploaded];
}

- (void)animateFinishedDownloadFile {
    self.lastProgress = 0.0f;
    self.progressLayer.strokeEnd = 0.0f;
    self.progressLayer.strokeStart = 0.0f;
    [self.progressLayer removeAllAnimations];
    [self.syncProgressSubView removeFromSuperview];
    _progressLayer = nil;
    _syncProgressSubView = nil;
    
    [self showFileBubbleStatusWithType:TAPMyFileBubbleTableViewCellStateTypeDoneDownloadedUploaded];
}

- (void)animateCancelDownloadFile {
    self.lastProgress = 0.0f;
    self.progressLayer.strokeEnd = 0.0f;
    self.progressLayer.strokeStart = 0.0f;
    [self.progressLayer removeAllAnimations];
    [self.syncProgressSubView removeFromSuperview];
    _progressLayer = nil;
    _syncProgressSubView = nil;
    
    [self showFileBubbleStatusWithType:TAPMyFileBubbleTableViewCellStateTypeNotDownloaded];
}

- (void)animateFailedUploadFile {
    self.lastProgress = 0.0f;
    self.progressLayer.strokeEnd = 0.0f;
    self.progressLayer.strokeStart = 0.0f;
    [self.progressLayer removeAllAnimations];
    [self.syncProgressSubView removeFromSuperview];
    _progressLayer = nil;
    _syncProgressSubView = nil;
    
    [self showFileBubbleStatusWithType:TAPMyFileBubbleTableViewCellStateTypeRetryUpload];
    
    self.chatBubbleRightConstraint.constant = 16.0f;
    self.statusIconRightConstraint.constant = 2.0f;
    
    self.sendingIconLeftConstraint.constant = 4.0f;
    self.sendingIconImageView.alpha = 0.0f;
    self.sendingIconBottomConstraint.constant = -5.0f;
    
    self.statusIconImageView.alpha = 0.0f;
}

- (void)animateFailedDownloadFile {
    self.lastProgress = 0.0f;
    self.progressLayer.strokeEnd = 0.0f;
    self.progressLayer.strokeStart = 0.0f;
    [self.progressLayer removeAllAnimations];
    [self.syncProgressSubView removeFromSuperview];
    _progressLayer = nil;
    _syncProgressSubView = nil;
    
    [self showFileBubbleStatusWithType:TAPMyFileBubbleTableViewCellStateTypeRetryDownload];
}

- (void)animateProgressUploadingFileWithProgress:(CGFloat)progress total:(CGFloat)total {
    CGFloat lastProgress = self.lastProgress;
    _newProgress = progress/total;
    
    NSInteger lastPercentage = (NSInteger)floorf((100.0f * lastProgress));
    NSLog(@"PERCENT %@",[NSString stringWithFormat:@"%ld%%", (long)lastPercentage]);
    
    //Circular Progress Bar using CAShapeLayer and UIBezierPath
    _progressLayer = [CAShapeLayer layer];
    [self.progressLayer setFrame:self.progressBarView.bounds];
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.progressBarView.bounds), CGRectGetMidY(self.progressBarView.bounds)) radius:(self.progressBarView.bounds.size.height - self.borderWidth - self.pathWidth) / 2 startAngle:self.startAngle endAngle:self.endAngle clockwise:YES];
    
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.progressLayer.lineWidth = 3.0f;
    self.progressLayer.path = progressPath.CGPath;
    self.progressLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.position = CGPointMake(self.progressBarView.layer.frame.size.width / 2 - self.borderWidth / 2, self.progressBarView.layer.frame.size.height / 2 - self.borderWidth / 2);
    [self.progressLayer setStrokeEnd:0.0f];
    [self.syncProgressSubView.layer addSublayer:self.progressLayer];
    
    [self.progressLayer setStrokeEnd:self.newProgress];
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = self.updateInterval;
    [strokeEndAnimation setFillMode:kCAFillModeForwards];
    strokeEndAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    strokeEndAnimation.removedOnCompletion = NO;
    strokeEndAnimation.fromValue = [NSNumber numberWithFloat:self.lastProgress];
    strokeEndAnimation.toValue = [NSNumber numberWithFloat:self.newProgress];
    _lastProgress = self.newProgress;
    [self.progressLayer addAnimation:strokeEndAnimation forKey:@"progressStatus"];
}

- (void)animateProgressDownloadingFileWithProgress:(CGFloat)progress total:(CGFloat)total {
    CGFloat lastProgress = self.lastProgress;
    _newProgress = progress/total;
    
    NSInteger lastPercentage = (NSInteger)floorf((100.0f * lastProgress));
//    NSLog(@"PERCENT %@",[NSString stringWithFormat:@"%ld%%", (long)lastPercentage]);
    
    //Circular Progress Bar using CAShapeLayer and UIBezierPath
    _progressLayer = [CAShapeLayer layer];
    [self.progressLayer setFrame:self.progressBarView.bounds];
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.progressBarView.bounds), CGRectGetMidY(self.progressBarView.bounds)) radius:(self.progressBarView.bounds.size.height - self.borderWidth - self.pathWidth) / 2 startAngle:self.startAngle endAngle:self.endAngle clockwise:YES];
    
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.progressLayer.lineWidth = 3.0f;
    self.progressLayer.path = progressPath.CGPath;
    self.progressLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.position = CGPointMake(self.progressBarView.layer.frame.size.width / 2 - self.borderWidth / 2, self.progressBarView.layer.frame.size.height / 2 - self.borderWidth / 2);
    [self.progressLayer setStrokeEnd:0.0f];
    [self.syncProgressSubView.layer addSublayer:self.progressLayer];
    
    [self.progressLayer setStrokeEnd:self.newProgress];
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = self.updateInterval;
    [strokeEndAnimation setFillMode:kCAFillModeForwards];
    strokeEndAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    strokeEndAnimation.removedOnCompletion = NO;
    strokeEndAnimation.fromValue = [NSNumber numberWithFloat:self.lastProgress];
    strokeEndAnimation.toValue = [NSNumber numberWithFloat:self.newProgress];
    _lastProgress = self.newProgress;
    [self.progressLayer addAnimation:strokeEndAnimation forKey:@"progressStatus"];
}

- (void)showFileBubbleStatusWithType:(TAPMyFileBubbleTableViewCellStateType)type {
    
    // borderWidth is a float representing a value used as a margin (outer border).
    // pathwidth is the width of the progress path (inner).
    _startAngle = M_PI * 1.5;
    _endAngle = self.startAngle + (M_PI * 2);
    _borderWidth = 0.0f;
    _pathWidth = 4.0f;
    
    // progress is a float storing current progress
    // newProgress is a float storing updated progress
    // updateInterval is a float specifying the duration of the animation.
    _newProgress = 0.0f;
    _updateInterval = 1;
    
    // set initial
    _syncProgressSubView = [[UIView alloc] initWithFrame:self.progressBarView.bounds];
    [self.progressBarView addSubview:self.syncProgressSubView];
    _progressLayer = [CAShapeLayer layer];
    _lastProgress = 0.0f;
    
    if (type == TAPMyFileBubbleTableViewCellStateTypeDoneDownloadedUploaded) {
        self.cancelView.alpha = 0.0f;
        self.downloadView.alpha = 0.0f;
        self.doneDownloadView.alpha = 1.0f;
        self.retryDownloadView.alpha = 0.0f;
        self.retryIconImageView.alpha = 0.0f;
        self.retryButton.alpha = 0.0f;
        self.statusLabel.text = self.statusLabelTimeString;
        [self showStatusLabel:YES];
    }
    else if (type == TAPMyFileBubbleTableViewCellStateTypeNotDownloaded) {
        self.cancelView.alpha = 0.0f;
        self.downloadView.alpha = 1.0f;
        self.doneDownloadView.alpha = 0.0f;
        self.retryDownloadView.alpha = 0.0f;
        self.retryIconImageView.alpha = 0.0f;
        self.retryButton.alpha = 0.0f;
        self.statusLabel.text = self.statusLabelTimeString;
        [self showStatusLabel:YES];
    }
    else if (type == TAPMyFileBubbleTableViewCellStateTypeUploading) {
        self.cancelView.alpha = 1.0f;
        self.downloadView.alpha = 0.0f;
        self.doneDownloadView.alpha = 0.0f;
        self.retryDownloadView.alpha = 0.0f;
        self.retryIconImageView.alpha = 0.0f;
        self.retryButton.alpha = 0.0f;
        self.statusLabel.text = self.statusLabelTimeString;
        [self showStatusLabel:NO];
    }
    else if (type == TAPMyFileBubbleTableViewCellStateTypeDownloading) {
        self.cancelView.alpha = 1.0f;
        self.downloadView.alpha = 0.0f;
        self.doneDownloadView.alpha = 0.0f;
        self.retryDownloadView.alpha = 0.0f;
        self.retryIconImageView.alpha = 0.0f;
        self.retryButton.alpha = 0.0f;
        self.statusLabel.text = self.statusLabelTimeString;
        [self showStatusLabel:YES];
    }
    else if (type == TAPMyFileBubbleTableViewCellStateTypeRetryUpload) {
        self.cancelView.alpha = 0.0f;
        self.downloadView.alpha = 0.0f;
        self.doneDownloadView.alpha = 0.0f;
        self.retryDownloadView.alpha = 1.0f;
        self.retryIconImageView.alpha = 0.0f;
        self.retryButton.alpha = 0.0f;
        NSString *statusString = NSLocalizedString(@"Failed to send, tap to retry", @"");
        self.statusLabel.text = statusString;
        [self showStatusLabel:YES];
        self.replyButton.alpha = 0.0f;
        self.replyButtonRightConstraint.constant = -28.0f;
    }
    else if (type == TAPMyFileBubbleTableViewCellStateTypeRetryDownload) {
        self.cancelView.alpha = 0.0f;
        self.downloadView.alpha = 1.0f;
        self.doneDownloadView.alpha = 0.0f;
        self.retryDownloadView.alpha = 0.0f;
        self.retryIconImageView.alpha = 0.0f;
        self.retryButton.alpha = 0.0f;
        self.statusLabel.text = self.statusLabelTimeString;
        [self showStatusLabel:YES];
    }
}

@end
