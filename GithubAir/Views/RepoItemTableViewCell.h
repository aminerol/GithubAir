//
//  RepoItemTableViewCell.h
//  GithubAir
//
//  Created by United Remote on 2/3/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URGithubRepositoryModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RepoItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *repoName;
@property (weak, nonatomic) IBOutlet UILabel *repoDescription;
@property (weak, nonatomic) IBOutlet UILabel *repoOwnerName;
@property (weak, nonatomic) IBOutlet UILabel *repoStarsCount;
@property (weak, nonatomic) IBOutlet UIImageView *repoOwnerAvatar;

- (void)setModel:(URGithubRepositoryModel *)model;
@end

NS_ASSUME_NONNULL_END
