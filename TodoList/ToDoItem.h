//
//  ToDoItem.h
//  TodoList
//
//  Created by yiminghe on 16/5/10.
//  Copyright © 2016年 yiminghe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;

@property BOOL completed;

@property (readonly) NSDate *creationDate;

@end
