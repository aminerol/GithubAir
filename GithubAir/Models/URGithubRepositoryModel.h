//
//  URGithubRepositoryModel.h
//  GithubAir
//
//  Created by United Remote on 2/3/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URGithubUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface URGithubRepositoryModel : NSObject

@property(strong, nonatomic) NSString * repoID;
@property(strong, nonatomic) NSString * nodeID;
@property(strong, nonatomic) NSString * name;
@property(strong, nonatomic) NSString * fullName;
@property(strong, nonatomic) NSString * repoDescription;
@property(strong, nonatomic) NSString * language;
@property(assign, nonatomic) NSUInteger stargazersCount;
@property(strong, nonatomic) URGithubUserModel *owner;

@end

NS_ASSUME_NONNULL_END
