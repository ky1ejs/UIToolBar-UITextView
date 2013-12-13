//
//  KJMViewController.m
//  KeyboardAccessoryView
//
//  Created by Kyle McAlpine on 10/12/2013.
//  Copyright (c) 2013 Kyle McAlpine. All rights reserved.
//

#import "KJMViewController.h"

@interface KJMViewController ()

@property (strong, nonatomic) UITextField *textField1;
@property (strong, nonatomic) UITextField *textField2;

@end

@implementation KJMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textField1 = [[UITextField alloc]initWithFrame:CGRectMake(30, 7, 260, 30)];
    self.textField1.borderStyle = UITextBorderStyleRoundedRect;
    self.textField1.delegate = self;
    UIToolbar *navToolbar = self.navigationController.toolbar;
    [navToolbar addSubview:self.textField1];
    
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.textField2 = [[UITextField alloc]initWithFrame:CGRectMake(30, 7, 260, 30)];
    self.textField2.borderStyle = UITextBorderStyleRoundedRect;
    self.textField2.delegate = self;
    [toolbar addSubview:self.textField2];
    self.textField1.inputAccessoryView = toolbar;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(firstRes:) name:UIKeyboardDidShowNotification object:nil];
}

- (void)firstRes:(id)sender
{
    [self.textField2 becomeFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.textField2) {
        self.textField1.text = self.textField2.text;
    }
    [textField resignFirstResponder];
    [self.textField1 resignFirstResponder];
    return YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self forKeyPath:UIKeyboardDidShowNotification];
    [super viewDidDisappear:animated];
}

@end
