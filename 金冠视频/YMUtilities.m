
//
//  YMUtilities.m
//  金冠视频
//
//  Created by jin on 16/3/10.
//  Copyright © 2016年 jin. All rights reserved.
//

#import "YMUtilities.h"

@implementation YMUtilities
+ (NSString *)appCurrentBuild {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];

}
+ (NSString *)appCurrentVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];

}
@end
