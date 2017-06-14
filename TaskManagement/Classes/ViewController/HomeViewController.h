//
//  HomeViewController.h
//  TaskManagement
//
//  Created by Aditya Kumar on 17/05/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView* taskTableView;

- (IBAction)sortButtonAction:(id)sender;

@end
