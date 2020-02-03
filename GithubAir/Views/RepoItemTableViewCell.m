//
//  RepoItemTableViewCell.m
//  GithubAir
//
//  Created by United Remote on 2/3/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import "RepoItemTableViewCell.h"
#import "URGithubRepositoryModel.h"
#import <SDWebImage/SDWebImage.h>

@implementation RepoItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(URGithubRepositoryModel *)model{
    
    _repoOwnerName.text = model.owner.name;
    [_repoOwnerAvatar sd_setImageWithURL: [NSURL URLWithString:model.owner.avatarUrl]];
    _repoName.text = model.name;
    _repoDescription.text = model.repoDescription;
    _repoStarsCount.text = [NSString stringWithFormat:@"★ %li", model.stargazersCount];
    
}

@end
