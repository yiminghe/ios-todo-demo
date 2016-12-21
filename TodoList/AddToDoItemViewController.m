//
//  ViewController.m
//  TodoList
//
//  Created by yiminghe on 16/5/6.
//  Copyright © 2016年 yiminghe. All rights reserved.
//

#import "AddToDoItemViewController.h"
#import <YogaKit/UIView+Yoga.h>

@interface AddToDoItemViewController () <UITextFieldDelegate>
@property UITextField *textField;
@end

@implementation AddToDoItemViewController

-(instancetype)init {
    self = [super init];
    return self;
}

- (void)addNewItem {
    if(self.textField.text.length > 0) {
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cancelAddNewItem {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // NSLog(@"%@", textField.text);
    // [textField resignFirstResponder];
    [self addNewItem];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // inside init or here?
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Add ToDo";
    UIBarButtonItem *done = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                             target:self
                             action:@selector(addNewItem)];
    self.navigationItem.rightBarButtonItem = done;
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                               target:self
                               action:@selector(cancelAddNewItem)];
    self.navigationItem.leftBarButtonItem = cancel;
    self.textField = [[UITextField alloc] init];
    self.textField.delegate = self;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *nameMap = @{@"textField" : self.textField};
    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[textField]-20-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[textField(==30)]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalConstraints];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
