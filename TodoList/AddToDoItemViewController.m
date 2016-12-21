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
    
    [self.view yg_setUsesYoga: true];
    
    UIView *container = [[UIView alloc] init];
    [container yg_setUsesYoga:true];
    [container yg_setFlexDirection:YGFlexDirectionRow];
    [container yg_setPadding:80 forEdge:YGEdgeTop];
    [container yg_setPadding:20 forEdge:YGEdgeHorizontal];
    
    UILabel *label = [[UILabel alloc] init];
    [label yg_setUsesYoga:true];
    [label yg_setMargin:10 forEdge:(YGEdgeRight)];
    label.text = @"name: ";
    
    self.textField = [[UITextField alloc] init];
    [self.textField yg_setUsesYoga:true];
    [self.textField yg_setFlexGrow:1];
    [self.textField yg_setPadding:10 forEdge:YGEdgeAll];
    
    self.textField.delegate = self;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    [container addSubview:label];
    [container addSubview:self.textField];
    [self.view addSubview:container];
    [self.view yg_applyLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
