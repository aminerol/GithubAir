//
//  ReposViewController.h
//  GithubAir
//
//  Created by United Remote on 1/29/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReposViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *reposTableView;

@end

