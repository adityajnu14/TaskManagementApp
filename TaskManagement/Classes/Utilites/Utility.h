//
//  Utility.h
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Task.h"

@interface Utility : NSObject

+ (NSString*) getDocumentDirectoryPathForPlist;

+ (void) setUserDefaultForTaskId;

+ (void) promptErrorMessage:(NSString*)message sender:(UIViewController*)sender;

+ (NSInteger) getMaxTaskIdFromUserDefault;


@end
