//
//  MyConfig.h
//  AntiquepPie
//
//  Created by 张超 on 15/5/11.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#ifndef AntiquepPie_MyConfig_h
#define AntiquepPie_MyConfig_h

//域名
#define API @"101.200.178.170/case_wwp/api/"
//#define API @"http://wwp.wiiyun.com/api"
//#define API @"http://demo.wiiyun.com/hlc/case_wwp/api/"
//融云域名
#define RONGYUNAPI @"api.cn.ronghub.com/user"

//版本号
#define VERSION @"1.0"

//来源--表示来源为苹果
#define SOURCE @"3"

#pragma mark ----------登录接口-----------
//登录
#define UserLogInAPI @"user_login.php"
//注册
#define UserResgisterAPI @"user_regnew.php"
//验证手机号是否被绑定（忘记密码第一步）
#define UserResetPasswordCheckMobileAPI @"is_regmobile.php"
//验证手机号是否被绑定（忘记密码第二步）
#define UserResetPasswordCheckByMessageAPI @"mobile_single_authentic.php"
//验证手机号是否被绑定（忘记密码第三步）
#define UserResetPasswordAPI @"set_password.php"
//用户头像修改
#define UserModifyPhotoUpAPI @"user_photoup.php"
//用户姓名修改
#define UserModifyNameAPI @"user_rename.php"
//用户手机号修改
#define UserModifyPhoneNumAPI @"user_remobile.php"
//添加用户收藏
#define UserAddCollectAPI @"user_addcollect.php"
//用户收藏列表
#define UserCollectListAPI @"user_clist.php"
//用户取消收藏
#define UserDeleteCollectAPI @"user_delcollect.php"
//用户宝贝列表
#define UserCommodityListAPI @"user_umtlist.php"
//用户添加集市宝贝(图片)
#define UserAddCommodityPicAPI @"user_mtadd.php"
//用户添加集市宝贝（视频）
#define UserAddCommodityVidioAPI @"user_mtadd2.php"
//用户修改集市宝贝(图片)
#define UserEditCommodityPicAPI @"user_mtedit.php"
//用户修改集市宝贝（视频）
#define UserEditCommodityVidioAPI @"user_mtedit2.php"
//集市宝贝列表
#define MarketCommodityListAPI @"user_mtlist.php"
//用户删除集市宝贝
#define UserDeleteCommodityAPI @"user_delmt.php"
//用户拍卖列表
#define UserAuctionListAPI @"user_uanlist.php"
//拍卖列表
#define AuctionListAPI @"user_anlist.php"
//用户添加拍卖（图片）
#define UserAddAuctionPicAPI @"user_anadd.php"
//用户添加拍卖（视频）
#define UserAddAuctionVideoAPI @"user_anadd2.php"
//用户修改拍卖（图片）
#define UserEditAuctionPicAPI @"user_anedit.php"
//用户修改拍卖（视频）
#define UserEditAuctionVideoAPI @"user_anedit2.php"
//用户删除拍卖
#define UserDeleteAuctionAPI @"user_delan.php"
//用户秀宝列表
#define UserShowListAPI @"user_uswlist.php"
//用户删除秀宝
#define UserDeleteShowAPI @"user_delsw.php"
//用户收货地址列表
#define UserAddressListAPI @"user_address.php"
//用户删除收货地址
#define UserDeleteAddressAPI @"user_deladdr.php"
//用户银行卡列表
#define UserBankCardListAPI @"user_bankcardlist.php"
//银行卡列表
#define BankListAPI @"banklist.php"
//用户添加银行卡
#define UserAddBankCardAPI @"user_addbankcard.php"
//款式列表
#define StyleList @"style_list.php"
//集市中带搜索的宝贝列表
#define MarketCommodityListWithSearchAPI @"mtgoods_list.php"
//34-秀宝列表
#define ShowListAPI @"swgoods_list.php"
//集市中拍卖带搜索的宝贝列表
#define MarketAuctionListWithSearchAPI @"angoods_list.php"
//手机验证码
#define MobileCheck @"mobilecheck.php"
//材质列表
#define CategoryList @"material_list.php"
//用户收货地址添加
#define UserAddAddressAPI @"user_addradd.php"
//用户收货地址修改
#define UserEditAddressAPI @"address_edit.php"
//宝贝详情
#define MarketCommodityDetailAPI @"mtgoods_detail.php"
//拍卖宝贝详情
#define MarketAuctionCommodityDetailAPI @"angoods_detail.php"
//拍卖出价
#define MarketAuctionBidAPI @"angoods_bid.php"
//广告列表接口
#define AdvertisementListAPI @"ad_list.php"
//用户个人信息接口
#define UserInfoAPI @"get_info.php"
//点赞和收藏接口
#define PraiseAndCollectAPI @"pra_collect.php"
//设置默认地址
#define SetDefaultAddressAPI @"user_setaddrdefault.php"
//用户身份验证
#define UserIdentityAuthentic @"identity_authentic.php"
//用户修改密码
#define UserChangePassword @"user_changepwd.php"
//用户修改手机号--验证身份
#define UserResetMobile_identity @"user_remobile.php"
//用户修改手机号--手机验证
#define UserResetMobile_Mobile @"mobile_authentic.php"
//用户财务日志列表
#define UserFinanceLogListAPI @"user_amtflowlist.php"
//日志详情
#define UserFinanceLogDetailAPI @"user_paydetail.php"
//用户充值接口
#define UserFinanceRechargeAPI @"user_recharge.php"
//提交订单
#define CommitOrderAPI @"order_submit.php"
//支付接口
#define PayOrderAPI @"order_pay.php"
//精品专场详情宝贝列表
#define BestShopListAPI @"special_showlist.php"
//用户删除银行卡
#define UserDeleteBankCardAPI @"user_delbankcard.php"
//用户绑定邮箱
#define UserSetEmailAPI @"user_setmail.php"
//用户设置支付密码
#define UserPayPasswordEditAPI @"paypassword_edit.php"
//用户提现接口
#define UserGetMoneyAPI @"user_drawcash.php"
//用户订单列表接口
#define UserOrderListAPI @"user_orderlist.php"
//用户订单详情接口
#define UserOrderDetailAPI @"user_orderdetail.php"
//用户订单操作接口
#define UserOrderManageAPI @"goods_deliver.php"
//用户订单退货操作接口
#define UserOrderRefundDoAPI @"user_refund_do.php"
//用户退货操作接口
#define UserOrderBackAPI @"user_refund.php"
//秀宝添加接口
#define UserAddShowVideoAPI @"user_swadd.php"
//秀宝修改接口
#define UserEditShowVideoAPI @"user_swedit.php"
//秀宝详情接口
#define ShowGoodsDetailAPI @"swgoods_detail.php"
//材质或款式详情
#define MaterialOrStyleInfoAPI @"meterial_info.php"
//送花接口
#define UserSendFlowerAPI @"send_flower.php"
//买花接口
#define UserBuyFlowerAPI @"user_buyflower.php"
//获取拍卖条款
#define GetAuctionRuleAPI @"get_common.php"
//已阅读拍卖条款
#define HaveLookRuleAPI @"angoods_readclause.php"
//用户批量收藏
#define UserAddCollectByArrayAPI @"user_collectvoladd.php"
//添加我接口
#define UserAddMeAPI @"found_addme.php"
//附近的古玩城、文玩店
#define NearlyAntiqueCityOrStoreAPI @"found_citystore.php"
//附近的玩友
#define NearlyFriendAPI @"found_nearuser.php"
//附近人的文玩
#define NearlyProductAPI @"found_neargoods.php"
//获取融云token
#define GetRongYunTokenAPI @"getToken.json"
//添加“玩”中的列表
#define MaterialAllListAPI @"material_listall.php"
//查看是否收藏或点赞
#define CheckPraiseAndCollectAPI @"pra_col_check.php"
//得到宝箱用户每个类别数目
#define UserCountInfoAPI @"user_getcountinfo.php"
//验证用户输入的支付密码是否正确
#define UserCheckPayPasswordAPI @"paypassword_check.php"
//用户消息列表
#define UserMessageListAPI @"user_messagelist.php"
//修改集市宝贝获取详情接口
#define UserModifyTreasureInfoAPI @"mtgoods_editinfo.php"
//修改拍卖宝贝获取详情接口
#define UserModifyAuctionInfoAPI @"angoods_editinfo.php"
//修改秀宝获取详情接口
#define UserModifyShowInfoAPI @"swgoods_editinfo.php"
//同时获取所有的材质和款式
#define GetAllMaterialAndStyle @"getmaterialandstyle.php"
//获取距离
#define GetDistanceAPI @"getdistance.php"
//坐标重定位
#define ResetLocationAPI @"found_relocation.php"
//添加古玩城
#define AddCityAPI @"found_addcity.php"
//精品秀宝获取接口
#define ShowVideoListAPI @"getvideolist.php"


//全局字段
#define   SIZEWIDTH  [[UIScreen mainScreen] bounds].size.width  //宽
#define   SIZEHEIGHT  [[UIScreen mainScreen] bounds].size.height  //高

//每个模块cell的个数
#define market_cell_num 5


#define VIEW_BG_COLOR_BEFORE [UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0]
#define VIEW_BG_COLOR [UIColor whiteColor]
#define BUTTON_BG_COLOR [UIColor colorWithRed:242.0/255.0 green:98.0/255.0 blue:2.0/255.0 alpha:1.0]
#define EDGE_BG_COLOR [UIColor colorWithRed:105.0/255.0 green:105.0/255.0 blue:105.0/255.0 alpha:1.0]
#define BORDERCOLORREF [[UIColor colorWithRed:105.0/255.0 green:105.0/255.0 blue:105.0/255.0 alpha:1.0] CGColor]
#define COMMON_INNER_BG_COLOR [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0]
#define TITLE_FONT_COLOR [UIColor colorWithRed:30.0/255.0 green:30.0/255.0 blue:30.0/255.0 alpha:1.0]
#define DOCK_BG_COLOR [UIColor colorWithRed:26.0/255.0 green:26.0/255.0 blue:28.0/255.0 alpha:1.0]
#define DISCOVER_BG_COLOR [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0]
#define DISCOVER_EDGE_COLOR [UIColor colorWithRed:190.0/255.0 green:190.0/255.0 blue:190.0/255.0 alpha:1.0]

#define LEFTEDGE SIZEWIDTH/15
#define TOPEDGE SIZEHEIGHT/26.6


#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RONGYUNAPPSECRET @"ov42blhnUu"
#define RONGYUNAPPKEY @"p5tvi9dst07j4"

/*============================================================================*/
/*=======================需要填写商户app申请的===================================*/
/*============================================================================*/
#define PARTNER @"2088911998438408"
#define SELLER @"huanyikeji0206@sina.com"
#define PRIVATEKEY @"MIICeQIBADANBgkqhkiG9w0BAQEFAASCAmMwggJfAgEAAoGBAOB2u2R7GDKeYvxtkXO16M+ZXhRqQ2hO/AoqqJzP0tQyaDapezkdCGFqC3v4iR/pDh9iO3QtdJli8EuezxpBTL58n4Yl50f7by8yTXsXnOnLdLy1D9rFg90P/MdvBz89D7+nYoPkONLjjIEv5LdLAEyTV2LtvlBDU3/31HNL2bZXAgMBAAECgYEAy5CCNAc6k7V2me0YSzL/Vz6Exsj0JuXyx5mWXthPIGgygNhFSy+cSRQuJBjq6wil6SpiNuN+ahkDSeFVez8bQ7aQaLEhuMJTdiMrHc0SmeCDPMFDL9+i7a8QEGhZ98y7CThueluGm/PLMAniIcD0Blvmb4KGQyMSNhaFA+U4E1kCQQD49DPmnYsZ8w3NTrODQ5j68HqsqZjAi+deGrJ0EbtsWipYf8OUhn5PgYZOkHTcSb0iSNqQYULQbNXPPNvLpGv7AkEA5tEV/+1NB9F4yiu/R1V9t4RZ/v4iaNC05IY3JLhlC7XdCMzDhBBinjzMUICRyvHZEvDBSyHJW9fLoq8xkKLUVQJBANHuG1X8w6++JYVbOEUYW4hAATJYUVcMoq3YFWOLEGDuJ4c5NdOpFho1PuxBJEoeZD7k8GmPmqfnHuUCjNXMcMECQQDkL5SGPP1IW2gExpcFWJk+klO+aVNvN9V9jsp5POp4V0S7bGNl7iTwtr5uX4zCi7HErcsKEc7VQ1OH85cWnEM5AkEA2J1OwRdhluL4hfcAKgQ0SAv8DuLWCPCwx2kc4FyTGqLD5lyEHehHURuqLP3CzuNCwv3E6zYgOxdCddLtTz1csg=="
/*============================================================================*/
/*============================================================================*/
/*============================================================================*/
//适配
#define IPHONE5 ([[UIScreen mainScreen] bounds].size.height>520&&[UIScreen mainScreen] bounds].size.height<650)?YES:NO
#define IPHONE6 ([[UIScreen mainScreen] bounds].size.height>650&&[UIScreen mainScreen] bounds].size.height<730)?YES:NO
#define IPHONE6P [[UIScreen mainScreen] bounds].size.height>730?YES:NO
#define IPHONE4 [[UIScreen mainScreen] bounds].size.height<520?YES:NO

#endif
