//
//  Environment.m
//  GithubAir
//
//  Created by United Remote on 2/3/20.
//  Copyright © 2020 United Remote. All rights reserved.
//

#import "Environment.h"

@implementation Environment

+(NSDictionary *)infoDictionary{
    return NSBundle.mainBundle.infoDictionary;
}

+(NSURL *)rootURL {
    NSString *rootURLstring = [Environment infoDictionary][@"API_URL"];
    return [NSURL URLWithString:rootURLstring];
}

+(NSString *)apiKey{
    return [Environment infoDictionary][@"API_KEY"];
}
@end
