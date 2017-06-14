//
//  HomeViewController.m
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "HomeViewController.h"
#import "TaskTableViewCell.h"
#import "AddTaskViewController.h"

#import "DataManager.h"
#import "Define.h"
#import "Task.h"

#define kTaskTableCellIdentifiers           @"tableCell"
#define kHomeToDetailsVCSegueIdentifiers    @"HomeVCToTaskDetailsVC"

@interface HomeViewController ()
{
    NSArray<Task*>* _taskTableDataSource;
}
@end

@implementation HomeViewController

#pragma mark - Life cycle method
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self fetchTaskData];
}

#pragma mark - Private method

//method will fetch all task from plist
- (void) fetchTaskData
{
    _taskTableDataSource = [DataManager getAllModelTask];
    [self.taskTableView reloadData];
}

#pragma mark - IBAction

// method will execute when user will press on sort button
- (IBAction)sortButtonAction:(id)sender
{
    NSArray* sortedArray = [_taskTableDataSource sortedArrayUsingComparator:^NSComparisonResult(Task* t1, Task* t2){
        return [t1.priority compare:t2.priority];
    }];
    _taskTableDataSource = sortedArray;
    [self.taskTableView reloadData];
}
#pragma mark - TableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _taskTableDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kTaskTableCellIdentifiers];
    if(cell == nil)
        cell = [[TaskTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTaskTableCellIdentifiers];
    [cell setupCellAttributes:_taskTableDataSource[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kHomeToDetailsVCSegueIdentifiers sender:indexPath];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [DataManager deleteTask:_taskTableDataSource[indexPath.row]];
        [self fetchTaskData];
    }
}

#pragma mark Navigation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:kHomeToDetailsVCSegueIdentifiers])
    {
        AddTaskViewController* destVC = [segue destinationViewController];
        if(_taskTableDataSource.count > 0)
            destVC.task = _taskTableDataSource[[(NSIndexPath*)sender row] ];
    }
}

@end
