//
//  Environment.h
//  GithubAir
//
//  Created by United Remote on 2/3/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Environment : NSObject

+ (NSURL *)rootURL;
+ (NSString *)apiKey;

@end

NS_ASSUME_NONNULL_END
