//
//  URGithubUserModel.m
//  GithubAir
//
//  Created by United Remote on 2/3/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import "URGithubUserModel.h"
#import <MJExtension/MJExtension.h>

@implementation URGithubUserModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
        @"avatarUrl":@"avatar_url",
        @"name":@"login",
    };
}

@end
