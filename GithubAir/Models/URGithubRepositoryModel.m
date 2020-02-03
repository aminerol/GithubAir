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
             @"HtmlURL":@"html_url",     
             @"fullName":@"full_name",
             @"repoDescription":@"description",
             @"updatedAt":@"updated_at",
             @"createdAt":@"created_at",
             @"stargazersCount":@"stargazers_count",
             @"forksCount":@"forks_count",
             @"watchersCount":@"watchers_count"
            };
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
   if(([property.name isEqualToString:@"updatedAt"]||
            [property.name isEqualToString:@"createdAt"])&&
            property.type.typeClass == [NSDate class])
    {
        // String 转为 Date
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        
        return [dateFormatter dateFromString:oldValue];
    }
    
    return oldValue;
    
}

@end
