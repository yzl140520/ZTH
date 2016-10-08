//
//  ZTHCommonDefine.h
//  ZTH
//  一些常量宏定义
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#ifndef ZTHCommonDefine_h
#define ZTHCommonDefine_h
//*******************************各种第三方appkey******************************
//友盟appkey
#define UMENG_APPKEY @"54810b82fd98c58b25000d9e"
//高德appkey
#define GAODE_APPKEY @"a173dfdb3c859e5326b9641ca7ccfd21"
//环信
//开发环境
#define EASEMOB_APPKEY @"szy#ztjy"//环信appkey
#define EASEMOB_DEBUG_CER_NAME @"ztjyyd_dev"//上传给环信的开发推送证书名字
#define EASEMOB_RELEASE_CER_NAME @"ztjyyd_adhoc"//上传给环信的发布推送证书名字

#define UMENG_CHANNEL_ID_APPSTORE @"App Store"    //友盟的推广ID 空值为默认的app store
#define UMENG_CAHNNEL_ID_91 @"91"
#define UMENG_CAHNNEL_ID_TONGBUTUI @"Tong Bu"
#define UMENG_CAHNNEL_ID_GUANWANG @"GongSi WanZhan"
#define APP_UPDATE_GO2_APPSTORE @"itms-apps://itunes.apple.com/us/app/zhang-tong-jia-yuan-yuan-ding/id966806518?l=zh&ls=1&mt=8"

//网页
//#define ZTJY_WEB_ADDR @"192.168.1.11:9080"
#define ZTJY_NEW_PROPERTY_PREFIX @""
#define ZTJY_ABOUT_SCHOOL_URL_PREFIX @"%@schoolId=%@"
//#define ZTJY_MESSAGE_URL_PREFIX @"%@msgId=%ld&msgType=%d&userId=%@&schoolId=%@"
#define ZTJY_MESSAGE_URL_PREFIX @"%@msgId=%ld&userId=%@&schoolId=%@&isGroups=1&appcommunicationversion=1"
#define ZTJY_YD_USAGE_STATISTIC @"%@teacherId=%@&schoolId=%@&sendInstall=1&appcommunicationversion=1"//用量报告
#define ZTJY_SERVICE_URL @"http://fwtk.51110.com"
#define ZTJY_ABOUT_US_URL_PREFIX @"%@typeId=2&id=%@&appVersion=%@&appcommunicationversion=1"//typeId:1:家长端 2：园丁端 id:用户id
#define ZTJY_DYNAMIC_SHARE_URL @"%@msgId=%ld&appType=teacher&userid=%@&shareid=%lf"//appType:teacher:园丁端 parent:家长端
#define ZTJY_TEACHER_TASK_URL_PREFIX @"%@sessionid=%@&schoolid=%@&teacherid=%@&appcommunicationversion=1"

#define ZTJY_QQ_SHARE @"qq"
#define ZTJY_WEIXIN_SHARE @"weixin"
#define ZTJY_SHARE_TYPE @"sharetype"

/**
 *  @author LHT, 16-01-11 13:01:55
 *
 *  有关家长留言的消息处理定义
 *
 */
//*******************************消息回撤***********************************
#define WITHDRAWMESSAGE @"action_hxc_withdraw"          //消息回撤命令标示
#define WITHDRAWMESSAGETYPE @"chat_msg_mt_t"            //消息撤回类型
#define WITHDRAWMESSAGEYES  1                           //撤回消息
#define WITHDRAWCMDMESSAGE  2                           //撤回命令
#define WITHDRAWISUSED      @"cmd_used"                 //撤回消息是否被使用过
#define WITHDRAWUSED        @"yes"                      //撤回消息命令有使用
#define WITHDRAWUNUSED      @"no"                       //撤回消息命令未使用

//*******************************消息发送时间********************************
#define MESSAGESENDTIME   @"message_timestamp"          //消息发送时间

//*******************************系统消息***********************************
#define SYSTEMMESSAGEKEY    @"msgtype"              //系统消息标示
#define SYSTEMMESSAGEVALUE  @"adduser"              //系统消息内容

/**高德地图缩放级别*/
#define ZOOM_LEVEL @"zoomLevel"
/**纬度缩放比例*/
#define LATITUDE_DELTA @"latitudeDelta"
/**经度缩放比例*/
#define LONGITUDE_DELTA @"longitudeDelta"

//******************************各种URL地址**************************
#define ZTJY_YD_URL_KEY_ABOUT_SCHOOL                 @"myschoolurl" //关于我园地址
#define ZTJY_YD_URL_KEY_HELP                         @"helpurl"    //使用帮助
#define ZTJY_YD_URL_KEY_RECIPE                       @"recipesurl" //宝宝食谱
#define ZTJY_YD_URL_KEY_COURSE                       @"coursesurl" //宝宝课程
#define ZTJY_YD_URL_KEY_SONG                         @"songsurl" //儿歌学堂
#define ZTJY_YD_URL_KEY_READING                      @"readingurl"//育儿百科地址
#define ZTJY_YD_URL_KEY_STORY                        @"storyurl" //睡前故事地址
#define ZTJY_YD_URL_KEY_REPORT_REPAIL                @"reportrepail"//视频小助手展示地址
#define ZTJY_YD_URL_KEY_ACTIVE                       @"detailexerciseteacher"//教师活动详情地址
#define ZTJY_YD_URL_KEY_NOTICE                       @"detailnotfyteacher"//教师通知详情地址
#define ZTJY_YD_URL_KEY_NEWS                         @"detailnewteacher"//教师新闻详情地址
#define ZTJY_YD_URL_KEY_APP_USAGE_TEACHER            @"teacherdosagereport"//教师用量报告地址
#define ZTJY_YD_URL_KEY_APP_USAGE_LEADER             @"leaderdosagereport"//园丁用量报告地址
#define ZTJY_URL_KEY_ABOUT_US                        @"aboutus"//关于我们
#define ZTJY_YD_URL_KEY_DYNAMIC_SHARE                @"weixin_msg"
#define ZTJY_YD_URL_KEY_INTEGREL_MALL                @"luckpageurl" //积分商城
#define ZTJY_YD_URL_KEY_MY_INTEGREL                  @"myscorepageurl"//我的积分
#define ZTJY_YD_URL_KEY_INTEGREL_EXPLAIN             @"levelinfopageurl" //积分说明
#define ZTJY_YD_URL_KEY_TASK_LIST                    @"teachertasklistpageurl" //任务列表
#define ZTJY_YD_URL_KEY_TEACHER_RANK                 @"popularityteacherranking"//园丁排行
#define ZTJY_YD_URL_KEY_DYNAMIC_PREVIEW              @"previewnotifybyteacher" //发布幼儿园动态预览
#define ZTJY_YD_URL_KEY_PARENT_APP_DOWNLOADURL       @"parentdownloadurl" //家长应用下载地址
#define ZTJY_YD_URL_KEY_TEACHER_APP_DOWNLOADURL      @"teacherdownloadurl" //老师身份应用下载地址

//********************************************文案key定义*******************************
#define YD_DOC_KEY_INTEGRAL_MALL_TITLE        @"BT-0007"     // 积分端城标题
#define YD_DOC_KEY_IFNO_CENTER_TEACHE_SCHOOL  @"LB-0008"     //个人中心 任教校园列表名称
#define YD_DOC_KEY_DYNAMIC_UNREAD_STATISTIC   @"BT-0008"     //通知活动→活动→【未阅读小朋友
#define YD_DOC_KEY_DYNAMIC_EROLL_STATISTIC    @"BT-0009"     //通知活动→活动→【已报名小朋友】
#define YD_DOC_KEY_BABY_POINT_HISTORY         @"LB-0009"     //宝宝点名→历史记录→【到园】
#define YD_DOC_KEY_PICK_UP_SELECT_BABY_TITLE  @"BT-0018"     //代接确认→选择代接宝宝→【选择代接宝宝】	导航栏
#define YD_DOC_KEY_PICK_UP_SEACERH_BABY       @"SM-0010"     //代接确认→选择代接宝宝→【搜索宝宝】
#define YD_DOC_KEY_ENROLL_SEX_GIRL            @"XX-0004"     //入学报名→小公主
#define YD_DOC_KEY_ENROLL_SEX_BOY             @"XX-0003"     //入学报名→小帅哥
//********************************************文案key定义end****************************
//以下是消息模块的type
/*
 1:通知
 2:新闻
 3:活动
 4:亲子作业
 5:幼儿动态
 6:课程
 7:食谱
 8:新增成员
 9：移除成员
 10：修改个人信息
 11：修改宝宝信息
 12：宝宝活动报名
 13：取消宝宝活动报名
 14：签到提醒
 15:宝宝点名
 16：代接提醒
 17：代接确认
 */
#define UNREAD_MSG_NOTICE                      @"1"    //通知
#define UNREAD_MSG_NEWS                        @"2"    //新闻
#define UNREAD_MSG_ACTIVE                      @"3"    //活动
#define UNREAD_MSG_HOMEWORK                    @"4"  //亲子作业
#define UNREAD_MSG_DYNAMIC                     @"5"   //幼儿动态
#define UNREAD_MSG_SCHEDULE                    @"6" //课程
#define UNREAD_MSG_RECIPE                      @"7"   //食谱
#define UNREAD_MSG_ADDMEMBER                   @"8"//新增成员
#define UNREAD_MSG_DELETEMEMBER                @"9"//移除成员
#define UNREAD_MSG_MODIFY_PESONINFO            @"10"//修改个人信息
#define UNREAD_MSG_MODIFY_BABYINFO             @"11"//修改宝宝信息
#define UNREAD_MSG_ADD_ACTIVE                  @"12"         //宝宝活动报名
#define UNREAD_MSG_DELETE_ACTIVE               @"13"//取消宝宝活动报名
#define UNREAD_MSG_SIGN                        @"14"         //签到提醒
#define UNREAD_MSG_BABYPOINT                   @"15"         //宝宝点名
#define UNREAD_MSG_PICKUP_CREATE               @"16"
#define UNREAD_MSG_PICKUP_FINISH               @"17"
#define UNREAD_MSG_WAIT_VERIFY                 @"18"
#define UNREAD_MSG_CLASS_ALBUM                 @"20"
#define UNREAD_MSG_SYSTEM_ANNOUNCEMENT         @"21" //系统公告
#define UNREAD_MSG_ALL                         @"23"
/*!
 *  @author yzl, 16-03-21 17:03:45
 *
 *  @brief 班级相册审核列表未读数
 *
 *  @return return value description
 */
#define UNREAD_MSG_CLASS_ALBUM_VERIFY @"22"

//*********************************引导************************
#define GUIDE_INTEGREL_MALL_HOT @"6007"
#define GUIDE_SCHOOL_SHARE      @"6008"



#define BQMM_TEXT_SUFFIX @"（来自表情商城，可升级新版本掌通家园查看）"
#define BQMM_FACE_TYPE @"facetype"
#define BQMM_EMOJI_TYPE @"emojitype"

#define kTeacherType @"teacher" //老师
#define kLeaderType  @"leader"//园长
#define kParentType  @"parent"//家长

#define WEIXIN_APPKEY @"wxd880e536a5560a2d"
#define QQ_APPKEY @"1104252821"

#define UPLOAD_VIDEO_PATH(filename)  [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@.mp4", filename]
#define OUTBOX_QN_THUMB_IMGE_URL(url) [NSString stringWithFormat:@"%@?vframe/jpg/offset/0/w/80/h/60", url]
#define VIDEO_SAVE_FILEPATH(__FILENAME) [NSHomeDirectory() stringByAppendingFormat:@"/Documents/messageData/movie/%@", __FILENAME]
#define VIDEO_TEMP_SAVE_FILEPATH(__FILENAME) [NSHomeDirectory() stringByAppendingFormat:@"/Documents/messageData/tempMovie/%@", __FILENAME]

//Tabbar高度
#define kUITabbarHeight          49.0
//导航栏高度
#define kUINavigationBarHeight   64.0

#define kBGColor                UIColorFromRGBV(0xf8f8f8)//常用背景色
#define kBlackTextColor         UIColorFromRGBV(0x292929)//黑色文字
#define kGrayTextColor          UIColorFromRGBV(0x7c7c7c)//灰色文字
#define kRedColor               UIColorFromRGBV(0xff1a1a)//红色文字或者图
#define kLightGrayTextColor     UIColorFromRGBV(0xb7b7b7)//浅灰色文字
#define kLineViewColor          UIColorFromRGBV(0xdedede)//灰色线颜色
#define kAppDefaultColor        UIColorFromRGBV(0x159ff3)//整个APP蓝色 跟蓝色字体
#define kLeaderNameColor        UIColorFromRGBV(0xf74c31)//园长名字颜色

//发布时注释以下宏就不再打印log
#define ZTJY_YD_DEBUG 1
#ifdef ZTJY_YD_DEBUG
#define ZTJY_YD_NSLOG(...) NSLog(@"%s(%p) %@", __PRETTY_FUNCTION__, self, [NSString stringWithFormat:__VA_ARGS__])
#else
#define ZTJY_YD_NSLOG(...) ((void)0)
#endif
#endif /* ZTHConstMacroDefine_h */
