//
//  Define.h
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#ifndef Define_h
#define Define_h

// constant for task
#define kTitleKey           @"title"
#define kDescriptionKey     @"description"
#define kEndDateKey         @"endDate"
#define kPriorityKey        @"priority"
#define kTaskIdKey          @"TaskIdKey"


// constant for priority
#define kUrgent       @"Urgent"
#define kNormal       @"Normal"

typedef enum priorityType
{
    Urgent = 1,
    Normal
}Priority;


#endif /* Define_h */
