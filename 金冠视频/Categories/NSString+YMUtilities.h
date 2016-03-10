//
//  NSString+YMUtilities.h
//  meilbn
//
//  Created by meilbn on 12/1/15.
//  Copyright © 2015 meilbn. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@interface NSString (YMUtilities)

- (NSURL *)YM_encodedURL;

- (NSString *)trimWhitespace;

- (BOOL)isEmpty;

- (NSString *)transformToPinyin;

- (BOOL)hasListenChar;

- (NSURL *)ma_iTunesURL;

- (NSString *)YM_base64String;

- (NSString *)YM_base64DecodeString;

// 文字高度
- (CGFloat)YM_heightWithFont:(UIFont *)font width:(CGFloat)width;

- (NSAttributedString *)htmlAttributedStringForMusicDetails;

@end
