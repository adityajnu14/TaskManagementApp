//
//  TaskTableViewCell.h
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface TaskTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel* taskTitleLabel;

- (void) setupCellAttributes:(Task*) task;
@end
