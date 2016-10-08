//
//  ZTHNotificationMacroDefine.h
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#ifndef ZTHNotificationMacroDefine_h
#define ZTHNotificationMacroDefine_h
//协议通知
#define PROTOCL_NOTIFICATION_NAME @"yangzhiling_notification%d"
//动态推送消息
#define PUSH_NOTIFICATION_DYNAMIC_MSG @"PUSH_NOTIFICATION_DYNAMIC_MSG"
//签到推送消息
#define PUSH_NOTIFICATION_SIGNINOUT_MSG @"PUSH_NOTIFICATION_SIGNINOUT_MSG"
#define PUSH_TEACHER_NOTIFICATION_SIGNINOUT_MSG @"PUSH_TEACHER_NOTIFICATION_SIGNINOUT_MSG"
//显示版本更新界面
#define SHOW_UPDATE_VERSION_UI @"SHOW_UPDATE_VERSION_UI"

//首次登录或更换设备重新认证
#define REVERIFY_FIRSTLOGIN_OR_CHANGEDEVICE @"REVERIFY_FIRSTLOGIN_OR_CHANGEDEVICE"
//班级相册分享成功
#define SHARE_RESULT_CALLBACK @"SHARE_RESULT_CALLBACK"
////宝宝关系已过期
//#define BABY_RELATION_EXPIRE @"BABY_RELATION_EXPIRE"
////宝宝关系已解除
//#define BABY_RELATION_UNVAIL @"BABY_RELATION_UNVAIL"

//未选择幼儿园进行登陆
#define NO_LOGIN_SCHOOL @"NO_LOGIN_SCHOOL"
//您已经被移出该幼儿园
#define BE_KICK_SCHOOL @"BE_KICK_SCHOOL"
//您已离职不可防问该幼儿园
#define QUIT_SCHOOL @"QUIT_SCHOOL"

//应该第一次使用
#define APP_FIRST_USE @"APP_FIRST_USE"

#define MODULE_EXPIRE_CONTENT @"MODULE_EXPIRE_CONTENT"

//其它宝宝有消息
#define ANOTHER_BABY_MSG @"ANOTHER_BABY_MSG"
#define ANOTHER_BABY_MSG_DIABBLE @"ANOTHER_BABY_MSG_DIABBLE"
#define ANOTHER_SCHOOL_PUSH_INFO_DIC @"ANOTHER_SCHOOL_PUSH_INFO_DIC"

//App 进入后台
#define APP_ENTER_BACKGROUND @"APP_ENTER_BACKGROUND"
#define APP_WILL_ENTER_FOREGROUND @"APP_WILL_ENTER_FOREGROUND"

//聊天群组成员更新
#define NOTIFICATION_CHAT_GROUP_MEMBER_REFRESH @"NOTIFICATION_CHAT_GROUP_MEMBER_REFRESH"
//首次登录或更换设备重新认证 认证完成或直接返回,密码找回等等确认返回
//参数的type有以下值
//1.身份验证页面，直接点返回
//2.身份验证页面，验证通过后返回
//3.密码找回，放弃找回密码的返回
//4.密码找回，设置了新密码后返回
#define BACK_TO_LOGINUI  @"BACK_TO_LOGINUI"

//#define  SESSION_EXPIRE_NOTIFICATION @"session_expire_notification%d"
#define ACTIVITY_ENROLL_SUCCESS @"activity_enroll_success"
//收到公告推送通知
#define THERE_IS_A_PUBLIC_NOTIFY @"THERE_IS_A_PUBLIC_NOTIFY"

//登陆用户名
#define LAST_LOGIN_USER_ACCOUNT @"LAST_LOGIN_USER_ACCOUNT"

#define ZTJY_TIP_SOUND_SWICTH @"ztjy_tip_sound_switch%@"
#define ZTJY_KINDERGARTEN_DYNAMIC_NOTICE @"ztjy_notice_jz000000"       //未读幼儿动态数通知
//#define ZTJY_KINDERGARTEN_DYNAMIC_DISMISS_NOTICE @"ztjy_dismiss_notice_jz000000"   //幼儿动态数隐藏通知
#define ZTJY_VIDEO_MONITOR_NOTICE @"ztjy_notice_jz009000"   //视频未读通知
#define ZTJY_VIDEO_MONITOR_DISMISS_NOTICE @"ztjy_dismiss_notice_jz009000"  //视频未读隐藏通知
#define ZTJY_MSG_NOTICE @"ZTJY_MSG_NOTICE"      //未读数通知
#define ZTJY_MSG_DISMISS_NOTICE @"ZTJY_MSG_DISMISS_NOTICE"             //未读数隐藏
#define ZTJY_UPDATE_UI_WHEN_GETBABYINFO @"ZTJY_UPDATE_UI_WHEN_GETBABYINFO"        //当获取宝宝信息后，更新界面
#define ZTJY_PUSH_MESSAGE_NOTIFIY @"ZTJY_PUSH_MESSAGE_NOTIFIY"
//从通知栏的推送启动程序
#define ZTJY_CLICK_PUSH_MESSAGE_ENTER @"ZTJY_CLICK_PUSH_MESSAGE_ENTER"
#define ZTJY_PUSH_SERVER_DELAY @"ZTJY_PUSH_SERVER_DELAY"
#define ZTJY_REMOVE_NOTIFICATION @"ZTJY_REMOVE_NOTIFICATION"
#define ZTJY_PUSH_PEOPLE_SIGN   @"ZTJY_PUSH_PEOPLE_SIGN" //签到推送
#define ZTJY_HIDE_PUSH_PEOPLE_SIGN @"ZTJY_HIDE_PUSH_PEOPLE_SIGN"
#define ZTJY_YD_NOTIFY_PICK_UP @"ZTJY_YD_NOTIFY_PICK_UP"
#define ZTJY_YD_NEW_PICK_UP_INFO @"ZTJY_YD_NEW_PICK_UP_INFO"
#define ZTJY_YD_PICK_UP_COMFIR @"ZTJY_YD_PICK_UP_COMFIR"
#define ZTJY_YD_BABY_SIGN_NOTIFY @"ZTJY_YD_BABY_SIGN_NOTIFY"
#define ZTJY_YD_BABY_POINT_UNREAD @"ZTJY_YD_BABY_POINT_UNREAD"
#define ZTJY_YD_REFRESH_VERIFY_SET_UI @"ZTJY_YD_REFRESH_VERIFY_SET_UI"
//切换学校成功通知
#define ZTJY_YD_SWITCH_SCHOOL_SUCESS @"ZTJY_YD_SWITCH_SCHOOL_SUCESS"
//注销账号
#define ZTJY_YD_SIGN_OUT_ACCOUNT @"ZTJY_YD_SIGN_OUT_ACCOUNT"
//用户从园丁变成园长
#define ZTJY_YD_USER_CHNAGE_TO_BE_TEACHER @"ZTJY_YD_USER_CHNAGE_TO_BE_TEACHER"
//*******************************监听消息***********************************
#define NOTIFICATION_MOBILE_PAY_CALLBACK @"NOTIFICATION_MOBILE_PAY_CALLBACK"
#define MOBILE_PAY_MODULE_CLOSE @"MOBILE_PAY_MODULE_CLOSE"
#define NOTIFICATION_LEAVE_MSG_UNREADE_MSG @"NOTIFICATION_LEAVE_MSG_UNREADE_MSG"//收到未读消息
#define NOTIFICATION_LEAVE_MSG_SEND_MSG @"NOTIFICATION_LEAVE_MSG_SEND_MSG"//发送留言消息

//*************************h5积分任务前往跳转原生VC************************
#define HTP_POINT2VC_NOTIFY_GrowClassPhoto @"HTP_POINT2VC_NOTIFY_GrowClassPhoto"  //前往班级相册
#define HTP_POINT2VC_NOTIFY_PublishPhotoVideo @"HTP_POINT2VC_NOTIFY_PublishPhotoVideo"  //前往发图片/视频
#define HTP_POINT2VC_NOTIFY_Message @"HTP_POINT2VC_NOTIFY_Message"  //前往给老师留言
#define HTP_POINT2VC_NOTIFY_PersonInfo @"HTP_POINT2VC_NOTIFY_PersonInfo"  //前往完善个人资料


#define RECEVE_OFFLINE_MEG_POST @"receve_offline_msg_post"  //应用开启后接收到离线推送
#define NOTIFY_TABLEVIEW_SCROLL @"NOTIFY_TABLEVIEW_SCROLL"

//********************************幼儿园动态*******************
#define ZTJY_YD_NOTIFY_MAIN_UI_REFRESH_DINAMIC @"ZTJY_YD_NOTIFY_MAIN_UI_REFRESH_DINAMIC"

//****************************主界面状态变化通知****************
#define ZTJY_YD_MAIN_STATUS_NOTIFICATION @"ZTJY_YD_MAIN_STATUS_NOTIFICATION" //0:数据刷新失败 1：成功 2：正在刷新数据


#define ZTJY_URL_KEY_AFFICHEDETAI @"affichedetai" // 掌通家园 系统通知详情页

#define ZTJY_URL_KEY_AFFICHEDETAISHARE  @"afficheweixinshare"  // 掌通家园 系统通知详情页分享
#endif /* ZTHNotificationMacroDefine_h */
