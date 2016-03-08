//
//  IKEHttpTool.h
//  CosyWeiBo
//
//  Created by Mac－Van on 15-6-8.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IKEHttpTool : NSObject
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
@end
