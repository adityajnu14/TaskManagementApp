//
//  Task.m
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "Task.h"
#import "Define.h"

@implementation Task

- (instancetype) initTaskWithDict:(NSDictionary*)dict
{
    self = [super init];
    if(self)
    {
        self.taskId             = [[dict valueForKey:kTaskIdKey] integerValue];
        self.title              = [dict valueForKey:kTitleKey];
        self.taskDescription    = [dict valueForKey:kDescriptionKey];
        self.endDate            = [dict valueForKey:kEndDateKey];
        self.priority           = [dict valueForKey:kPriorityKey];
    }
    return self;
}

- (NSDictionary*) getTaskDic
{
    NSMutableDictionary* taskDict = [[NSMutableDictionary alloc] init];
    [taskDict setValue:self.title forKey:kTitleKey];
    [taskDict setValue:self.taskDescription forKey:kDescriptionKey];
    [taskDict setValue:self.endDate forKey:kEndDateKey];
    [taskDict setValue:self.priority forKey:kPriorityKey];
    [taskDict setValue:[NSNumber numberWithInteger:self.taskId] forKey:kTaskIdKey];
    return taskDict;
}

@end
