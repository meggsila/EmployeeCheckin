//
//  InitVC.m
//  EmployeeCheckin
//
//  Created by Megi on 6.2.24.
//

#import <UIKit/UIKit.h>
#import "EmployeeCheckin-Bridging-Header.h"
#import "EmployeeCheckin-Swift.h"
#import "InitVC.h"

@interface InitVC ()

@property (nonatomic, strong) CheckinViewModel *actionViewModel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *messageTextView;
@property (nonatomic, strong) UIButton *startButton;

@end

@implementation InitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:true];
    [self fetchData];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor systemGray6Color];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.text = @"Employee Check-in";
    self.titleLabel.font = [UIFont systemFontOfSize:30 weight:UIFontWeightMedium];
    self.titleLabel.textColor = [UIColor labelColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.titleLabel];
    
    self.messageTextView = [[UITextView alloc] init];
    self.messageTextView.translatesAutoresizingMaskIntoConstraints = NO;
    self.messageTextView.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
    self.messageTextView.textColor = [UIColor labelColor];
    self.messageTextView.textAlignment = NSTextAlignmentCenter;
    self.messageTextView.backgroundColor = [UIColor systemGray6Color];
    [self.view addSubview:self.messageTextView];
    
    self.startButton = [[UIButton alloc] init];
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    [self.startButton.titleLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightMedium]];
    [self.startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.startButton setBackgroundColor:[UIColor linkColor]];
    self.startButton.layer.cornerRadius = 10;
    [self.startButton addTarget:self action:@selector(startButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startButton];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:50],
        [self.titleLabel.widthAnchor constraintEqualToConstant:self.view.frame.size.width - 40],
        [self.titleLabel.heightAnchor constraintEqualToConstant:50],
        
        [self.messageTextView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.messageTextView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.messageTextView.widthAnchor constraintEqualToConstant:self.view.frame.size.width - 40],
        [self.messageTextView.heightAnchor constraintEqualToConstant:60],
        
        [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.startButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant: -50],
        [self.startButton.widthAnchor constraintEqualToConstant:self.view.frame.size.width - 40],
        [self.startButton.heightAnchor constraintEqualToConstant:50],
    ]];
}

- (void)fetchData {
    self.actionViewModel = [CheckinViewModel shared];
    
    NSDate *fetchedDate = [self.actionViewModel fetchCheckinDateTime];
    if (fetchedDate != nil) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        NSString *formattedDate = [dateFormatter stringFromDate:fetchedDate];
        self.messageTextView.text = [NSString stringWithFormat:@"Hi Megi welcome back, your last check in date is : %@", formattedDate];
    } else {
        self.messageTextView.text = @"Please check in";
    }
}

- (void)startButtonAction {
    CheckinViewWrapper *wrapper = [[CheckinViewWrapper alloc] init];
    wrapper.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:wrapper animated:YES completion:nil];
}

@end
