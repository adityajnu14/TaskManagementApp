//
//  AddTaskViewController.m
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "AddTaskViewController.h"
#import "DatePicker.h"
#import "DataManager.h"
#import "Utility.h"
#import "Define.h"

#import "Task.h"

#import "NSString+TaskManagement.h"


#define kEmptyString @""

@interface AddTaskViewController ()
{
    BOOL      _isNewTask;
}
@end

@implementation AddTaskViewController

#pragma mark - Life cycle method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setInputViewForDate];
    [self setInitialValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Private method
// method will set all values on view controller in case of update
- (void) setInitialValues
{

    if(self.task != nil)
    {
        self.titleTextField.text        = self.task.title;
        self.descriptionTextField.text  = self.task.taskDescription;
        self.endDateTextField.text      = self.task.endDate;
        _isNewTask  = NO;
        if([self.task.priority isEqualToString:kUrgent])
           [self.prioritySegmentController setSelectedSegmentIndex:0];
        else
            [self.prioritySegmentController setSelectedSegmentIndex:1];
    }
    else
    {
        self.task   = [[Task alloc] init];
        self.task.priority   = kUrgent;
        _isNewTask  = YES;
    }
}

// method will return true if user has input every field
- (BOOL) validateTaskFields
{
    if([[self.titleTextField.text trim] isEqualToString:kEmptyString] || [[self.descriptionTextField.text trim] isEqualToString:kEmptyString]|| [[self.endDateTextField.text trim] isEqualToString:kEmptyString])
    {
        [Utility promptErrorMessage:@"You can not have empty field" sender:self];
        return NO;
    }
    return YES;
}

#pragma mark - Date Picker Methods
// create date picker and set it as input view of text field
- (void) setInputViewForDate
{
    __weak typeof (self) weakSelf = self;
    
    DatePicker *date = [[DatePicker alloc]initWithDatePicker:self.endDateTextField];
    self.endDateTextField.inputView = date;
    date.getDate = ^ (NSString* date)
    {
        weakSelf.endDateTextField.text = date;
        weakSelf.task.endDate    = date;
    };
}

#pragma mark - IBAction
// method will execute when usre press on priority segment
- (IBAction)prioritySegmentAction:(id)sender
{
    if(self.prioritySegmentController.selectedSegmentIndex==0)
    {
        self.task.priority = kUrgent;
    }
    else if(self.prioritySegmentController.selectedSegmentIndex==1)
    {
        self.task.priority = kNormal;
    }
}

// mehthod will execute when user will press save button
- (IBAction)saveButtonAction:(id)sender
{
    if(![self validateTaskFields])
        return;
    self.task.title              = self.titleTextField.text;
    self.task.taskDescription    = self.descriptionTextField.text;
    if(_isNewTask) // this add new task
    {
        self.task.taskId = [Utility getMaxTaskIdFromUserDefault] + 1;
        [DataManager saveTask:self.task];
    }
        else
        [DataManager updateTask:self.task];
    [self.navigationController popViewControllerAnimated:YES];
}

// method will execute when user tap on view
- (IBAction)tapgestureAction:(id)sender
{
    [self.view endEditing:YES];
}

- (IBAction)cancelButtonAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
