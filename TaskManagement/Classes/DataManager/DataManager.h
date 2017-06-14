//
//  DataManager.h
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface DataManager : NSObject

+ (NSMutableArray*) getAllModelTask;

+ (void) saveTask:(Task*) task;
+ (void) deleteTask:(Task*) task;
+ (void) updateTask:(Task*) task;

@end
