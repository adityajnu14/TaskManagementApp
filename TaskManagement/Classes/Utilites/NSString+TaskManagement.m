//
//  NSString+TaskManagement.m
//  TaskManagement
//
//  Created by Aditya Kumar on 23/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "NSString+TaskManagement.h"

@implementation NSString (TaskManagement)

//method trims white spaces from the end of the string and also checks if the string is empty
-(NSString* ) trim
{
    return [self stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
}

@end
