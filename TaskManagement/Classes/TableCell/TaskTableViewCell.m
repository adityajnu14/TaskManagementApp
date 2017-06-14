//
//  TaskTableViewCell.m
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "TaskTableViewCell.h"
#import "Define.h"

@implementation TaskTableViewCell

#pragma mark - Life cycle method
- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark - Private method
// method will set cell values
- (void) setupCellAttributes:(Task*) task
{
    self.taskTitleLabel.text = task.title;
    if([task.priority isEqualToString:kUrgent])
        self.backgroundColor = [UIColor redColor];
    else
        self.backgroundColor = [UIColor greenColor];
}
@end
