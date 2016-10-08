//
//  NSURL+QDAdditions.m
//  LMQD
//
//  Created by min zhang on 15/10/12.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "NSURL+QDAdditions.h"

@interface NSString (QDURLOperate)

- (NSString *)stringByDecodingURLFormat;
- (NSString *)stringByEncodingURLFormat;

@end

@implementation NSString (QDURLOperate)

- (NSString *)stringByDecodingURLFormat
{
    NSString *result = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

- (NSString *)stringByEncodingURLFormat
{
    NSString *result = [self stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    result = [result stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

@end

@implementation NSURL (QDAdditions)

- (NSURL *)qd_appendRound
{
    return [self qd_appendQueryParams:@{@"round": @"true"}];
}

- (NSURL *)qd_appendRoundBorder
{
    return [self qd_appendQueryParams:@{@"round_border": @"true"}];
}

- (NSURL *)qd_appendWithRadius:(CGFloat)radius inSize:(CGSize)inSize contentMode:(UIViewContentMode)contentMode
{
    NSAssert(!CGSizeEqualToSize(inSize, CGSizeZero), @"inSize can not be zero");

    return [self qd_appendQueryParams:@{@"radius": @(radius),
                                        @"w": @(inSize.width),
                                        @"h": @(inSize.height),
                                        @"contentMode": @(contentMode)}];
}

- (NSURL *)qd_appendQueryParams:(NSDictionary *)queryParams
{
    if (self.host.length == 0) {
        return self;
    }
    
    NSMutableArray *mutablePairs = [NSMutableArray array];
    for (NSString *key in queryParams) {
        NSString *queryStringPair = [NSString stringWithFormat:@"%@=%@", key, queryParams[key]];
        [mutablePairs addObject:queryStringPair];
    }
    NSString *queryParamString = [mutablePairs componentsJoinedByString:@"&"];
    
    NSString *urlString;
    if (self.query.length > 0) {
        urlString = [self.absoluteString stringByAppendingFormat:@"&%@", queryParamString];
    } else {
        urlString = [self.absoluteString stringByAppendingFormat:@"?%@", queryParamString];
    }
    NSURL *url = [NSURL URLWithString:urlString];
    return url;
}

- (NSMutableDictionary *)qd_queryItems
{
    NSString *query = self.query;
    NSMutableDictionary *queryComponents = [NSMutableDictionary dictionary];
    for(NSString *keyValuePairString in [query componentsSeparatedByString:@"&"])
    {
        NSArray *keyValuePairArray = [keyValuePairString componentsSeparatedByString:@"="];
        if ([keyValuePairArray count] < 2) continue; // Verify that there is at least one key, and at least one value.  Ignore extra = signs
        NSString *key = [[keyValuePairArray objectAtIndex:0] stringByDecodingURLFormat];
        NSString *value = [[keyValuePairArray objectAtIndex:1] stringByDecodingURLFormat];
        NSMutableArray *results = [queryComponents objectForKey:key]; // URL spec says that multiple values are allowed per key
        if(!results) // First object
        {
            results = [NSMutableArray arrayWithCapacity:1];
            [queryComponents setObject:results forKey:key];
        }
        [results addObject:value];
    }
    return queryComponents;
}

@end
