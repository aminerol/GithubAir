//
//  URGithubAPI.m
//  GithubAir
//
//  Created by United Remote on 2/2/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import "URGithubAPI.h"
#import "URGithubRepositoryModel.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "Environment.h"

@interface URGithubAPI ()

@property (nonatomic, strong) AFHTTPSessionManager * sessionManager;

@end

@implementation URGithubAPI

- (instancetype)init
{
    if(self = [super init]){
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[Environment rootURL]];
        [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    }
    return self;
}

- (void)getTrendingRepos:(NSString *)date forPage:(NSUInteger)page callback:(GithubResponse)callback
{
    NSMutableDictionary * params = [@{
        @"q": [NSString stringWithFormat:@"created:>%@", date],
        @"page": [NSNumber numberWithUnsignedInteger:page],
        @"per_page": @100,
        @"sort" : @"stars",
        @"order" : @"desc"
    } mutableCopy];
    
    void(^successBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) =
    ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        callback(YES,[URGithubRepositoryModel mj_objectArrayWithKeyValuesArray:[responseObject objectForKey:@"items"]]);
    };
    
    void(^failBlock)(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nonnull task, NSError *  _Nonnull error){
        callback(NO,error);
    };
    
    [_sessionManager GET:@"/search/repositories" parameters:params progress:nil success:successBlock failure:failBlock];
}

@end
