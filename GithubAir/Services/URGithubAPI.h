//
//  URGithubAPI.h
//  GithubAir
//
//  Created by United Remote on 2/2/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface URGithubAPI : NSObject

typedef void(^GithubResponse)(BOOL,id _Nullable);

- (void)getTrendingRepos:(NSString *)date forPage:(NSUInteger)page callback:(GithubResponse)callback;

@end

NS_ASSUME_NONNULL_END
