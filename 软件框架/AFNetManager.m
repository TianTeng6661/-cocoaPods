//
//  AFNetManager.m
//  软件框架
//
//  Created by lzsc on 16/7/19.
//  Copyright © 2016年 lzsc. All rights reserved.
//

#import "AFNetManager.h"
#include <netinet/in.h>
#import "MacroHeader.h"
#import "MBProgressHUD+HM.h"

static  AFHTTPSessionManager *mManager;
static NSString * mHost = @"";
@implementation AFNetManager

singleton_implementation(AFNetManager);

+(void)initHost{
    //[self setHost:HOST];
}

+(id)getUserData:(NSString *)name{

    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:name];
}

+(void)setUserData:(id)value name:(NSString *)name{

    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:name];
    [defaults synchronize];

}

+(NSString *)stringDate:(NSString *)formatString data:(NSDate *)date{
    NSDateFormatter * format = [[NSDateFormatter alloc]init];
    [format setDateFormat:formatString];
    if(!date)date = [NSDate date];
    return [format stringFromDate:date];

}

+(NSDictionary *)toJSON4File:(NSString *)file{

    NSInputStream * input =[NSInputStream inputStreamWithFileAtPath:file];
    [input open];
    NSError * err = nil;
    return [NSJSONSerialization JSONObjectWithStream:input options:NSJSONReadingMutableContainers error:&err];

}

+(void)setHost:(NSString *)host{

    mManager = [AFHTTPSessionManager manager];
    mManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    mManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [mManager.requestSerializer setValue:@"13345" forHTTPHeaderField:@"token"];
    mHost = host;

}

+(void)AFNetMmangerSetHeaderToken:(NSString *)token{

    [mManager.requestSerializer setValue:token forHTTPHeaderField:@"x-sid"];
}

+ (NSString *)cookieValueWithKey:(NSString *)key
{
    NSHTTPCookieStorage *sharedHTTPCookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];

    if ([sharedHTTPCookieStorage cookieAcceptPolicy] != NSHTTPCookieAcceptPolicyAlways) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    }

    NSArray         *cookies = [sharedHTTPCookieStorage cookiesForURL:[NSURL URLWithString:@"http://192...."]];
    NSEnumerator    *enumerator = [cookies objectEnumerator];
    NSHTTPCookie    *cookie;
    while (cookie = [enumerator nextObject]) {
        if ([[cookie name] isEqualToString:key]) {
            return [NSString stringWithString:[[cookie value] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }
    }

    return nil;
}

+ (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary*))success failure:(void (^)(NSError *))failure {
    [[self class] checkNetWorkStatus];

    DLog(@"%@",[mHost stringByAppendingString:url]);
    //显示hub

    [MBProgressHUD showloadHUB];

    [mManager GET:[mHost stringByAppendingString:url] parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {

        //可以获取进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSDictionary* data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        [MBProgressHUD hideloadHUB];


        if (success) {
            success(data);
        }


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }

        [MBProgressHUD hideloadHUB];

    }];


}

+ (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary*))success failure:(void (^)(NSError *))failure {
    [[self class] checkNetWorkStatus];
    //DLog(@"%@",[mHost stringByAppendingString:url]);
    //显示hub
    [MBProgressHUD showloadHUB];
    [mManager.requestSerializer setHTTPShouldHandleCookies:NO];
    [mManager POST:[mHost stringByAppendingString:url] parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        id data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        DLog(@"%@===%@  %@  %@",data,responseObject,str,task);

        if ([task.response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSLog(@"The return class is subclass %@  ",task.response);
        }else{
            NSLog(@"The return class is not subclass %@",NSStringFromClass([NSHTTPURLResponse class]));
        }
        //
        if (success) {
            success(data);
        }
        [MBProgressHUD hideloadHUB];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        //     if ([task.response isKindOfClass:[NSHTTPURLResponse class]]) {
        //         NSLog(@"The return class is subclass %@  ",task.response);
        //     }else{
        //         NSLog(@"The return class is not subclass %@",NSStringFromClass([NSHTTPURLResponse class]));
        //     }
        //

        if (failure) {
            failure(error);
        }
        [MBProgressHUD hideloadHUB];

    }];


}

+ (void)checkpost:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary*))success failure:(void (^)(NSError *))failure {


    [[self class] checkNetWorkStatus];
    DLog(@"%@",[mHost stringByAppendingString:url]);

    [mManager POST:[mHost stringByAppendingString:url] parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        if (success) {
            success(data);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)upload:(NSString *)url parameters:(NSDictionary *)parameters file:(NSURL *)file name:(NSString *)name success:(void (^)(NSDictionary*))success failure:(void (^)(NSError *))failure{
    [[self class] checkNetWorkStatus];
    DLog(@"%@",[mHost stringByAppendingString:url]);

    [mManager POST:[mHost stringByAppendingString:url] parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        if (success) {
            success(data);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}


+(void)checkNetWorkStatus  //
{

    [mManager.reachabilityManager startMonitoring];

    [mManager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"当前网络状态为 %@",@[@"不可达",@"使用GPRS",@"使用WiFi"][status]);


        if (status==2) {
            [self setUserData:@"1" name:@"wifi"];

        }else {
            [self setUserData:@"0" name:@"wifi"];

        }


        if(status == AFNetworkReachabilityStatusNotReachable)
        {
            //            [MBProgressHUD toastText:@"网络连接已断开，请检查您的网络！"];
            return ;
        }
    }];

}


+(BOOL) connectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;

    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;

    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);

    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flags\n");
        return NO;
    }

    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}

+ (AFNetworkReachabilityStatus)networkStatus{
    AFNetworkReachabilityManager *reachability = [AFNetworkReachabilityManager managerForDomain:@"http://www.baidu.com"];
    return [reachability networkReachabilityStatus];
    
}

@end




