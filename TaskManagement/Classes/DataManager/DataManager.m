//
//  DataManager.m
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "DataManager.h"
#import "Utility.h"
#import "Task.h"

@implementation DataManager

// method will fetch all task and returns it
+ (NSMutableArray*) getAllModelTask
{
    NSMutableArray* taskModelArray;
    NSMutableArray* allTaskFromPlist = [DataManager getAllTaskFromPlist];
    taskModelArray = [[NSMutableArray alloc] init];
    
    for(NSDictionary* aDict in allTaskFromPlist)
    {
        Task* aTask = [[Task alloc] initTaskWithDict:aDict];
        [taskModelArray addObject:aTask];
    }
    return taskModelArray;
}

// method will save given task to plist
+ (void) saveTask:(Task*) task
{
    NSString* plistPath = [Utility getDocumentDirectoryPathForPlist];
    NSMutableArray* dataFromPlist = [DataManager getAllTaskFromPlist];
    NSDictionary* taskDict  = [task getTaskDic];
    
    [dataFromPlist addObject:taskDict];
    [dataFromPlist writeToFile:plistPath atomically:YES];
    [Utility setUserDefaultForTaskId];
}

// method will delete given task to plist
+ (void) deleteTask:(Task*) task
{
    NSString* plistPath         = [Utility getDocumentDirectoryPathForPlist];
    NSMutableArray* dataFromPlist = [DataManager getAllTaskFromPlist];
    
    int index = [DataManager searchIndexOfTask:task.taskId];
    if(index != -1)
        [dataFromPlist removeObjectAtIndex:index];
    [dataFromPlist writeToFile:plistPath atomically:YES];
}

+ (void) updateTask:(Task*) task
{
    NSMutableArray* allTaskData = [DataManager getAllTaskFromPlist];
    NSDictionary* dataDict = [task getTaskDic];
    int indexToUpdate = [DataManager searchIndexOfTask:task.taskId];
    
    if(indexToUpdate != -1)
    {
        [allTaskData replaceObjectAtIndex:indexToUpdate withObject:dataDict];
        [allTaskData writeToFile:[Utility getDocumentDirectoryPathForPlist] atomically:YES];
        [Utility setUserDefaultForTaskId];
    }
}

// method will return all pill data from plist which is in dictionary form
+ (NSMutableArray*) getAllTaskFromPlist
{
    NSString* plistPath = [Utility getDocumentDirectoryPathForPlist];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    NSMutableArray* dataFromPlist;
    if ([fileManager fileExistsAtPath:plistPath])
        dataFromPlist = [NSMutableArray arrayWithContentsOfFile:plistPath];
    else
        dataFromPlist = [NSMutableArray array];
    return dataFromPlist;
}

// mehod will give index of a task, if found otherwise -1
+ (int) searchIndexOfTask:(NSInteger) taskId
{
    int index;
    NSMutableArray<Task*>* taskArray = [DataManager getAllModelTask];
    
    for(index=0; index < taskArray.count; index++ )
    {
        if(taskArray[index].taskId == taskId)
            return index;
    }
    return -1;
}

@end
