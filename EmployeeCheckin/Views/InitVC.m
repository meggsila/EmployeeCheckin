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

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *startButton;

@end

@implementation InitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
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
        
        [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.startButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.startButton.widthAnchor constraintEqualToConstant:self.view.frame.size.width - 40],
        [self.startButton.heightAnchor constraintEqualToConstant:50],
    ]];
}

- (void)startButtonAction {
    CheckinViewWrapper *wrapper = [[CheckinViewWrapper alloc] init];
    [self presentViewController:wrapper animated:YES completion:nil];
}

@end
