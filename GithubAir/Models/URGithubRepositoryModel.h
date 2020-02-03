//
//  URGithubRepositoryModel.h
//  GithubAir
//
//  Created by United Remote on 2/3/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface URGithubRepositoryModel : NSObject

@property(strong, nonatomic) NSString * repoID;
@property(strong, nonatomic) NSString * nodeID;
@property(strong, nonatomic) NSString * HtmlURL;
@property(strong, nonatomic) NSString * url;
@property(strong, nonatomic) NSString * name;
@property(strong, nonatomic) NSString * fullName;
@property(strong, nonatomic) NSString * repoDescription;
@property(strong, nonatomic) NSDate * updatedAt;
@property(strong, nonatomic) NSDate * createdAt;
@property(strong, nonatomic) NSString * language;
@property(assign, nonatomic) NSUInteger stargazersCount;
@property(assign, nonatomic) NSUInteger forksCount;
@property(assign, nonatomic) NSUInteger watchersCount;

@end

NS_ASSUME_NONNULL_END
