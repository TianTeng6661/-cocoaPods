//
//  AFNetManager.h
//  软件框架
//
//  Created by lzsc on 16/7/19.
//  Copyright © 2016年 lzsc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

#import "AFNetworking.h"

@interface AFNetManager : NSObject

singleton_interface(AFNetManager);

+(void)initHost;

+(void) setHost:(NSString *)host;

+(id)getUserData:(NSString *)name;

+(void)setUserData:(id)value name:(NSString *)name;

+(NSString *)stringDate:(NSString *)formatString data:(NSDate *)date;

+(NSDictionary *)toJSON4File:(NSString *)file;

+ (void)AFNetMmangerSetHeaderToken:(NSString *)token;


//get请求
+(void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary * Diction))success failure:(void (^)(NSError * error)) failure;

/***
 *post请求
 *
 ***/
+ (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *Diction))success  failure:(void (^)(NSError *error))failure;

+ (void)checkpost:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *Diction))success  failure:(void (^)(NSError *error))failure;;

+ (void)upload:(NSString *)url parameters:(NSDictionary *)parameters file:(NSURL *)file name:(NSString *)name success:(void (^)(NSDictionary *Diction))success  failure:(void (^)(NSError *error))failure;



//+ (void)incrementActivityCount;
//+ (void)decrementActivityCount;
+ (BOOL)connectedToNetwork;
+ (void)checkNetWorkStatus;
+ (AFNetworkReachabilityStatus)networkStatus;

@end




