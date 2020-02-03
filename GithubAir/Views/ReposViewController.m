//
//  ViewController.m
//  GithubAir
//
//  Created by United Remote on 1/29/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import "ReposViewController.h"
#import "RepoItemTableViewCell.h"
#import "URGithubAPI.h"
#import <MJRefresh/MJRefresh.h>
#import <DGActivityIndicatorView/DGActivityIndicatorView.h>

@interface ReposViewController ()
@property(nonatomic, strong) URGithubAPI *githubAPI;
@property (nonatomic, strong) NSMutableArray *repos;
@property (nonatomic) NSUInteger pageNumber;
@property (nonatomic) DGActivityIndicatorView *tableViewLoadingIndicator;
@end

@implementation ReposViewController

NSString *const CellIdentifier = @"RepoTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _githubAPI = [URGithubAPI new];
    _repos = [NSMutableArray new];
    _pageNumber = 1;
    
    _reposTableView.dataSource = self;
    [_reposTableView registerNib:[UINib nibWithNibName:@"RepoItemTableViewCell" bundle:nil]
    forCellReuseIdentifier:CellIdentifier];
    
    [self setUpLoadingIndicator];
    [self setUpPulldownRefresh];
    [self fetchRepos:self.pageNumber];
}

- (void)setUpLoadingIndicator {
    _tableViewLoadingIndicator = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallClipRotate tintColor:UIColor.grayColor];
    CGFloat width = _reposTableView.bounds.size.width/6;
    CGFloat height = _reposTableView.bounds.size.height/6;
    CGFloat xAxis = _reposTableView.center.x - width/2;
    CGFloat yAxis = _reposTableView.center.y - height/2;
    _tableViewLoadingIndicator.frame = CGRectMake(xAxis, yAxis, width, height);
    _reposTableView.hidden = YES;
    [self.view addSubview:_tableViewLoadingIndicator];
    [_tableViewLoadingIndicator startAnimating];
}

- (void)setUpPulldownRefresh {
    __weak typeof(self) weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.pageNumber = 1;
       [weakSelf fetchRepos:weakSelf.pageNumber];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    _reposTableView.mj_header = header;
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.pageNumber += 1;
        [weakSelf fetchRepos:weakSelf.pageNumber];
    }];
    _reposTableView.mj_footer = footer;
}

- (void)fetchRepos:(NSUInteger)page {
    NSDate *date = [NSCalendar.currentCalendar dateByAddingUnit:NSCalendarUnitDay value:-30 toDate:[NSDate date] options:0];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *lastThirtyDays = [dateFormatter stringFromDate:date];
    
    __weak typeof(self) weakSelf = self;
    [_githubAPI getTrendingRepos:lastThirtyDays forPage:page callback:^(BOOL isSucces, id _Nullable response) {
        if(weakSelf.reposTableView.mj_header.isRefreshing){
            [weakSelf.reposTableView.mj_header endRefreshing];
        }
        if(weakSelf.reposTableView.mj_footer.isRefreshing){
            [weakSelf.reposTableView.mj_footer endRefreshing];
        }
        if(weakSelf.tableViewLoadingIndicator.animating){
            weakSelf.reposTableView.hidden = NO;
            [weakSelf.tableViewLoadingIndicator stopAnimating];
        }
        
        if(isSucces){
            [weakSelf.repos addObjectsFromArray:response];
            [weakSelf.reposTableView reloadData];
        }else{
            NSLog(@"%@", response);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Failed to get repos from api" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    RepoItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
         cell = [[RepoItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault                                                 reuseIdentifier:CellIdentifier];
    }
    [cell setModel:_repos[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repos.count;
}

@end
