//
//  URGithubRepositoryModel.m
//  GithubAir
//
//  Created by United Remote on 2/3/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import "URGithubRepositoryModel.h"
#import <MJExtension/MJExtension.h>

@implementation URGithubRepositoryModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"repoID":@"id",
             @"nodeID":@"node_id",
             @"fullName":@"full_name",
             @"repoDescription":@"description",
             @"stargazersCount":@"stargazers_count"
            };
}

@end
