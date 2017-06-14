//
//  Task.h
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (assign, nonatomic) NSInteger taskId;
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* taskDescription;
@property (strong, nonatomic) NSString* endDate;
@property (strong, nonatomic) NSString* priority;

- (instancetype) initTaskWithDict:(NSDictionary*)dict;

- (NSDictionary*) getTaskDic;

@end
