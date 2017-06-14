//
//  Utility.m
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "Utility.h"
#import "DataManager.h"
#import "Define.h"

#define kPlistFileName  @"Task.plist"

static NSInteger sTaskId;

@implementation Utility


// method will return doucment directory address path
+ (NSString*) getDocumentDirectoryPathForPlist
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsPath = [paths objectAtIndex:0];
    NSString* plistPath = [documentsPath stringByAppendingPathComponent:kPlistFileName];
    return plistPath;
}


+ (NSInteger) getMaxTaskIdFromUserDefault
{
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    
    if(sTaskId == 0) // for first time login
    {   sTaskId = [userDefault integerForKey:kTaskIdKey];
        if(sTaskId == 0)
            [userDefault setInteger:99 forKey:kTaskIdKey]; // for the first time in app
    }
    return [userDefault integerForKey:kTaskIdKey];
}

// method will pop up on  view showing eror
+ (void) promptErrorMessage:(NSString*)message sender:(UIViewController*)sender
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error" message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [sender presentViewController:alert animated:YES completion:nil];
}
+ (void) setUserDefaultForTaskId
{
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setInteger:([Utility getMaxTaskIdFromUserDefault] + 1) forKey:kTaskIdKey];
    [userDefault synchronize];
}

@end
