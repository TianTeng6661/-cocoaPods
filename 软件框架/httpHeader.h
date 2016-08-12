//
//  httpHeader.h
//  Investment
//
//  Created by lzsc on 16/3/30.
//  Copyright © 2016年 zhangteng. All rights reserved.
//

#ifndef httpHeader_h
#define httpHeader_h

#define HOST @"http://www.lzsc.com/api/json/"

/**
 *  登录
 *
 */
#define LOGIN @"Login"


/**
 *  注册
 *
 */
#define REGISTER @"Register"


/**
 *  重置登录密码
 *
 */
#define RESET_LOGIN_PWD  @"resetLoginPwd"

/**
 *  短信认证
 *
 */
#define GET_SMS @"GetSms"

/**
 *  请求重设支付密码
 *
 */
#define GET_REST_PAY_SMS @"getResetPaySms"

/**
 *  重置支付密码
 *
 */
#define RESET_PAY_PWD  @"resetPayPwd"

/**
 *  充值
 *  @return
 */
#define CHONG_ZHI @"ChongZhi"

/**
 *  提现
 *  @return
 */
#define TI_XIAN @"TiXian"

/**
 *  获取我的理财产品列表
 */
#define GET_MY_PRODUCT_LIST  @"getMyProductList"

/**
 *  获取账户信息
 */
#define GET_ACCOUNT_INFO  @"getAccountInfo"


/**
 *  获取新手标
 */
#define GET_FIRST_PRODUCT @"getFirstProduct"


/**
 *  获取我的银行卡列表
 */
#define GET_MY_BANK_CARD_LIST  @"getMyBankCardList"


/**
 *  添加银行卡
 */
#define ADD_BANK_CARD  @"addBankCard"

/**
 *  获取银行列表
 */
#define GET_BANK_LIST  @"getBankList"


/**
 *  验证身份信息
 */
#define VERIFY_PERSON_INFO  @"verifyPersonInfo"


/**
 *  获取理财产品列表
 */
#define GET_PRODUCT_LIST @"getProductList"


/**
 *  获取理财产品详情
 */
#define GET_PRODUCT_DETAIL  @"getProductDetail"


/**
 *  状态返回码
 
 40000  系统错误
 40001  登陆超时
 40002  验证码超时(待定?)
 40003  无用户数据返回
 40004  用户不存在
 40005  用户密码错误
 40006
 
 50001  无理财信息数据
 50002
 50003
 
 */



#endif /* httpHeader_h */
