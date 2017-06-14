//
//  DatePicker.m
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "DatePicker.h"

#define kDateFormat     @"MM-dd-yy"

@implementation DatePicker
{
    UITextField* _textField;
}
// method gets instance of Date picker
- (DatePicker*) initWithDatePicker:(UITextField* )textFieldToEdit
{
    self = [super init];
    if(self)
    {
        _textField = textFieldToEdit;
        self.datePickerMode     = UIDatePickerModeDate;
        self.date               = [NSDate date];
        self.backgroundColor    = [UIColor darkGrayColor];
        [self addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

-(void) datePickerValueChanged:(UIDatePicker*) selectedPicker
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:kDateFormat];
    NSString* dateString = [outputFormatter stringFromDate:self.date];
    if(self.getDate)
        self.getDate(dateString);
}

@end
