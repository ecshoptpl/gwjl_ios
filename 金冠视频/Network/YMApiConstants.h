//
//  YMApiConstants.h
//  MyOne3
//
//  Created by meilbn on 2/21/16.
//  Copyright © 2016 meilbn. All rights reserved.
//

#ifndef YMApiConstants_h
#define YMApiConstants_h

#pragma mark - Common

// 服务器地址
#define YMApiServerAddress                     @"http://www.gbblw.com/api"
//#define YMApiServerAddress                     @"http://v3.wufazhuce.com:8000/api"


// 获取文章详情
#define YMApiGetReadDetails                    @"/%@/%@"

// 获取评论列表
#define YMApiGetComments                       @"/comment/praise/%@/%@/%@"

// 获取相关列表
#define YMApiGetRelateds                       @"/related/%@/%@"

// 获取相关列表
#define YMApiGetRelateds                       @"/related/%@/%@"

#pragma mark - Home Page

// 首页图文列表
//#define YMApiHomePageMore                      @"/hp/more/0"
#define YMApiHomePageMore                      @"/index.php?c=api&_table_dede_archives&_interface=list"

// 月的首页图文列表
#define YMApiHomePageByMonth                   @"/hp/bymonth/%@"

#pragma mark - Read

// 短篇
#define YMApiEssay                             @"essay"
// 连载
#define YMApiSerial                            @"serial"
#define YMApiSerialContent                     @"serialcontent"
// 问题
#define YMApiQuestion                          @"question"

// 阅读头部轮播列表
#define YMApiReadingCarousel                   @"/reading/carousel"
// 阅读文章索引列表
#define YMApiReadingIndex                      @"/reading/index"
// 短篇文章详情
#define YMApiEssayDetailsById                  @"/essay/%@"

#pragma mark - Music

// 音乐
#define YMApiMusic                             @"music"
// 音乐Id列表
#define YMApiMusicIdList                       @"/music/idlist/0"
// 音乐详情
#define YMApiMusicDetailsById                  @"/music/detail/%@"

#pragma mark - Movie

// 电影列表
#define YMApiMovieList                         @"/movie/list/%ld"


#endif /* YMApiConstants_h */
