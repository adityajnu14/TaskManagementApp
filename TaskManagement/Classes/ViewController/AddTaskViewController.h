//
//  AddTaskViewController.h
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface AddTaskViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField* titleTextField;
@property (weak, nonatomic) IBOutlet UITextField* descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField* endDateTextField;

@property (weak, nonatomic) IBOutlet UISegmentedControl* prioritySegmentController;

@property (strong, nonatomic) Task* task;

- (IBAction)prioritySegmentAction:(id)sender;
- (IBAction)saveButtonAction:(id)sender;
- (IBAction)tapgestureAction:(id)sender;
- (IBAction)cancelButtonAction:(id)sender;

@end
