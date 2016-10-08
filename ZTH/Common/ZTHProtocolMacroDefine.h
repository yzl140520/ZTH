//
//  ZTHProtocolMacroDefine.h
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#ifndef ZTHProtocolMacroDefine_h
#define ZTHProtocolMacroDefine_h
//协议编号
#define LOGIN_REQUEST_CODE     1058
#define LOGIN_OUT_CODE         1001
#define MODIFY_PSW_CODE        1002
#define GET_BABY_INFO_CODE     1003
#define MODIFY_BABY_INFO       1004
#define TEACHER_SHOW_CODE      1005
#define TEACHER_PIC_SAVE_CODE  1006
#define TEACHER_FILE_SAVE_CODE 1007
#define SOFTWARE_UPDATE_CODE   1008
#define GET_CAMERA_INFO_CODE   1009
#define GET_SINGLE_CAMERA_INFO_CODE 1010
#define GET_CLASS_WITH_TEACHER_CODE 1011
#define GET_STUDENT_WITH_CLASS_CODE 1012
#define GET_QNY_UPLOAD_TOKEN_CODE   1013
#define MODIFY_TEACHER_INFO_CODE    1014
#define GET_MESSAGE_DYNAMIC_CODE    1095//1021
#define ACTIVITY_EROLL_CODE         1024
#define GET_ABOUT                   1025
#define UNREAD_MSG_CODE             1026
#define ZERO_SETTIN_MSG_CODE        1027
#define UPDATE_PUSH_KEY             1028
#define CLOSE_VIDEO_CODE            1029
#define GET_SMS_VERIFYFIRSTLOGIN_BINDDEVICE 1030
#define VERIFY_SMS_BINDDEVICE 1031
#define GET_SMS_FIND_PASSWORD 1032
#define VERIFY_SMS_FINDPASSWORD 1033
#define RESET_NEW_PASSWORD 1034
#define GET_USERBABY_INFO 1035
#define CHECK_BABYLIST 1036
#define CHECK_PARENT_TYPE 1037
#define CHECK_PARENT_MEG 1038
#define FAMILYGROUP_MODIFY_PERSONALIDENTITY 1039
#define FAMILYGROUP_MODIFY_PERSONALPHONE 1040
#define FAMILYGROUP_MODIFY_PERSONALHEAD 1041
#define FAMILYGROUP_MODIFY_PERSONALNICKNAME 1042
#define INVITE_REGISTERPARENT_ENTERFAMILYGROUP 1043
#define INVITE_UNREGISTERPARENT_ENTERFAMILYGROUP 1044
#define REMOVE_PARENT_FROM_FAMILYGROUP 1045
#define CHECK_FAMILYGROUP_TOTAL_MSG 1046
#define CHECK_FAMILYGROUP_HISTORY_MSG 1047
#define MODIFY_BABY_HEAD 1048
#define MODIFY_BABY_NICKNAME 1049
#define MODIFY_BABY_BIRTHDAY 1050
#define FAMILYGROUP_MODIFY_PERSONAL_NAME 1051
#define GET_PACHAGE_INFO_LIST    1052
#define GET_PACKAGE_ORDER_INFO   1053
#define GET_BABY_SIGN_INFO       1054 //获取宝贝签到记录
#define SEND_START_UP_NUM        1055 //应用启动统计
#define INIT_SYSTEM_MODULE       1118//1056
#define GET_TEACHET_INIT_INFO    1059 //获取教师初始化信息
#define GET_SCHOOL_INFO_LIST     1060 //获取学校信息列表
#define GET_SCHOOL_DETAIL_INFO   1061
#define GET_CLASS_LIST           1062

#define GET_CLASS_STUDENT        1063 //获取学生信息列表
#define GET_CAMERA_LIST_YD       1064
#define GET_GOUP_MEMBER          1146//1065 //获取群组成员
#define GET_SCHOOLID_GROUPID     1147//1066 //获取学样id
#define PROCESS_CREATE_PICK_UP_DATA 1077 //创建代接
#define PROCESS_QUERY_PICK_UP_DATA  1078 //查询代接
#define PROCESS_DELETE_PICK_UP_DATA 1079
#define PROCESS_PICK_UP_NOTIFY      1081
#define GET_BABY_SIGN_INFO27       1086 //获取宝贝签到记录
#define PROCESS_SIGN_IO_STDINFO     1087 //签到签退某班级所有学生签到签退信息
#define PROCESS_SIGN_IO_STUDENTS    1088 //宝宝签到或签退
#define GET_BABY_SIGN_RECORD        1089 //获取宝宝的签到记录
#define GET_BABY_SIGN_TIMER         1090
#define PROCESS_MODULE_SWTH_STATE   1091
#define PROCESS_SET_MODULE_SWTH_STATE 1092
#define PROCESS_BABY_SIGN_NOTIFY_INFO 1093 //宝宝签到提醒
#define GET_UNREAD_MSG                1169 //1094 首页未读数
#define PROCESS_DELETE_DYNAMIC_MSG    1098 //删除动态
#define PROCESS_TEACHER_READ_DETAIL   1099 //老师阅读详情
#define PROCESS_READ_STATISTIC        1100 //阅读统计
#define PROCESS_QUERY_READ_DETAIL     1101 //阅读详情
#define PROCESS_QUERY_EROLL_STATISTIC 1102 //报名统计
#define PROCESS_QUERY_EROLL_DETAIL    1103 //报名详情
#define PROCESS_GET_VERIFY_INFO       1105 //获取审核信息
#define PROCESS_VERIFY_BATCH_PASS     1106 //批量通过审核
#define PROCESS_USER_VERIFY_INFO      1107 //用户审核设置信息
#define PROCESS_USER_VERIFY_DETAIL_INFO 1108 //用户审核设置详情
#define PROCESS_GET_DYNAMIC_RECORD    1109 //获取动态记录信息
#define PROCESS_PICK_UP_PHONE_LIST    1110 //宝宝代接家长电话列表
#define PROCESS_ALL_SCHOOL_VERIFY_SET 1113 //全园审核开关设置
#define PROCESS_SET_VERIFY_SWITCH     1114 //设置活动或通知审核开关
#define PROCESS_VERIFY_DYNAMIC        1115 //是否通过动态
#define PROCESS_TEACHER_CLASS_LIST    1117 //获取带菜单的班级列表

#define PROCESS_PUBLISH_DYANMIC       1096 //发布动态
#define PROCESS_MODIFY_DYANMIC        1097 //更新动态
#define PROCESS_GET_DYANMIC_DETAIL    1104 //动态详情
#define PROCESS_NOTIFY_UNREAD_PEOPLE  1135 //提醒未阅读people
#define PROCESS_VIDEO_OPEN_TIME_NOTIFY 1136 //摄像头开发时间提醒
#define PROCESS_TEACHER_LEAVE_MSG_STATISTIC 1158// 1137 //家长留言统计

#define PROCESS_PUBLISH_NEW_GROW_UP_FILE 1151//发布成长档案
#define PROCESS_DELETE_GROW_UP_COMMENT  1154 //取消点赞或删除评论
#define PROCESS_COMMENT_GROW_UP_INFO 1152 //评论成长档案
#define PROCESS_PRAISE_GROW_UP_INFO  1153//点赞
//#define PROCESS_GROW_UP_NEW_MSG      1123 //成长档案新消息
#define PROCESS_QUERY_GROWUP_INFO    1148//获取班级相册列表
#define PROCESS_DELETE_GROW_UP_FILE      1155 //删除成长档案记录
#define PROCESS_GET_CUR_SHCOOL_GROUP_ID 1159
#define PROCESS_CUR_TEACHER_TEACH_CLASS_INFO 1149//获取当前老师所任教的所有班级
#define PROCESS_SCORECOST       1240    //获取积分商城相关信息

#define ENROLLMENT_CREATE   1141        //入学报名 新增
#define ENROLLMENT_GET_BABYINFO 1142    //入学报名 获取宝宝信息
#define ENROLLMENT_EDIT_BABYINFO 1143   //入学报名 修改宝宝信息
#define ENROLLMENT_DELETE 1144          //入学报名 删除报名
#define ENROLLMENT_GET_LIST 1145
#define PROCESS_BIND_SIGN_CARD 1172 //绑定签到卡号
#define PROCESS_MODIFY_TEACHER_BIRTHDAY 1173 //修改老师生日
#define PROCESS_MODIFY_TEACHER_SEX 1174 ///修改老师性别
#define GET_CHAT_LIST   1175
#define PROCESS_GET_AUDIT_SETTING_INFOS 1178 //获取审核设置信息
#define PROCESS_SET_AUDIT_MASTER_SIWTCH 1179 //设置审核总开关
#define PROCESS_SET_USER_AUDIT_SIWTCH 1180 //设置用户审核开关
#define PROCESS_USER_AUDIT_DETAIL_IFNO 1181 //用户审核设置详情

#define PROCESS_GET_TEACHER_GROUP_INFO 1166 //获取园丁群组信息
#define PROCESS_GET_TEACHER_MEMBER      1167 //获取园丁群组成员
#define PROCESS_JOIN_GROUP      1168 //	客户端主动加群
#define PROCESS_MY_CLASS_ALBUM  1198 //我的班级相册
#define PROCESS_CLASS_ALBUM_VERIFY_INFOS 1199 //班级相册审核信息
#define PROCESS_CLEAN_CLASS_ALBUM_VERIFYED_INFOS 1200 //清空已审核列表
#define PROCESS_VERIFY_CLASS_ALBUM 1201 //审核班级列表
#define PROCESS_CLASS_ALBUM_VIEW_INFOS 1202 //班级相册浏览详情
#define PROCESS_RECORD_CLASS_ALBUM_VIEW_TIME 1203 //记录班级相册浏览次数
#define PROCESS_RECORD_CLASS_ALBUM_TRANS_TIME 1204 //转发次数记录

#define GET_CLASS_COURSE    1183    //获取班级课程
#define GET_WEEK_COURSE     1184 //获取某一周课程
#define COURSE_CHANGE_TO_IMGMODEL   1185 //切换到图片版
#define COURSE_CHANGE_TO_TEXTMODEL  1186 //切换到文字版
#define COURSE_MODIFY_IMGMODEL      1187 //编辑图片版
#define COURSE_MODIFY_TEXTMODEL     1188 //编辑文字版
#define COURSE_COPYTO_NEXTWEEK      1189 //复制到下一周

#define GET_CLASS_RECIPES    1190    //获取班级食谱
#define GET_WEEK_RECIPES     1191 //获取某一周食谱
#define RECIPES_CHANGE_TO_IMGMODEL   1192 //切换到图片版
#define RECIPES_CHANGE_TO_TEXTMODEL  1193 //切换到文字版
#define RECIPES_MODIFY_IMGMODEL      1194 //编辑图片版
#define RECIPES_MODIFY_TEXTMODEL     1195 //编辑文字版
#define RECIPES_COPYTO_NEXTWEEK      1196 //复制到下一周


#define POST_SignInOut 1247 // 签到签退提醒横条


//校车相关
#define GETSCHOOLBUSLIST     1197   //获取校车列表
#define GETGPSINTERVAL       1205   //获取gps时间间隔
#define GETBUSLOCATION       1206   //获取校车位置

#define PROCESS_MULTIPLE_ZERO_SETTING 1207//批量未读消息置零
#define PROCESS_CLASS_ALBUM_TRANMIT_INFOS 1212 //成长档案转发信息

//积分相关
#define SCROCE_GUIDE_IM_TASK    1210//留言任务

#define PROCESS_USER_LEVEL_INFO           1213 //用户等级信息
#define PROCESS_TEACHER_LEVEL_INFO        1233 //老师等级信息

#define PROCESS_GET_GUIDE_LIST  1232            //引导模块
#define PROCESS_SEND_GUIDE_LIST 1162            //引导修改

#define PROCESS_LOGIN_EVERYDAY_ONETTIMES 1236 //	每日用户打开应用

#define PROCESS_SHARE_MESSAGE   1229    //分享消息
#define PROCESS_BABY_LIST_OF_CLASS 1238 //代接确认获取宝宝列表

#define SCORE_JUMP_TO_ACTION    1243    //任务积分前往跳转协议
#define VIDEO_WATERMARK 1246//视频水印
#define POST_SYSTEM 12300      // 掌通家园公告消息
#define POST_SYSTEM_TWO 12301  // 掌通家园公告消息列表
#define POST_SYSTEM_WEB 12302 // 掌通家园公告消息Web
#define PROCESS_JOIN_IN_GROUP 1254

#define GET_CUSTOMERSERVICE_TOKEN_CODE          12400 //获取客服token
#define GET_CUSTOMERSERVICE_GROUPID_CODE        12401 //获取客服GroupID
#define GET_CUSTOMERSERVICE_RESETTOKEN_CODE     12402 //重新获取客服token

#pragma mark - 服务器返回码
//服务器返回码
#define ACCOUNT_KICK_OUT             100005 //账号被踢
#define SESSION_EXPIRE               104 //session 过期
#define SESSION_NULL                 102 //session id 为空
#define REQUEST_PROCESS_SUCCESS      10000
#define MOBILE_PAY_MODULE_CLOSE_CODE 940000
#define THE_MODULE_HAS_CLOSE         100008
#define CLASS_NOT_EXIST              100012
#define ERRO_CODE_FAULT_EMERGENCEY    100012
#define YD_BABY_ENROLLED              114101    //以报名
#define GROW_UP_FILE_DELETE             0   //成长档案被删除
#define REPRAISE_CLASS_ALBUM            11221   //重复点赞
#define NO_RIGHT_PERATE_GROW_UP_FILE   114811   //没权限进行相关操作

#pragma mark - 推送协议编码
//*******************************推送协议编码***********************************
#define PUSH_ACCOUNT_KICK_OUT     @"m101" //账号在其它地方登陆
#define PUSH_KINDERGARTEN_DYNAMIC @"m102" //幼儿园动态
#define PUSH_NEW_VIDEO_OPEN_TIME   @"m103"//新视频开放时间
//#define PUSH_ACTIVITY_CANCEL       @"m104" //活动取消
//#define PUSH_NEW_MEMBER_JOIN_IN    @"m105" //添加家人推送
//#define PUSH_SERVER_DELAY          @"m106"//通过添加家人服务有效期延长
#define PUSH_PEOPLE_SIGN           @"m107"//签到推送
#define PUSH_TEACHER_SIGN          @"m121"//老师签到
//#define PUSH_PUBLIC_NOTIFY         @"" //公告
#define PUSH_NEW_PICK_UP           @"m109" //园丁创建新代接
#define PUSH_PICK_UP_COMFIR        @"m110" //家长确认代接
#define PUSH_NEW_DYNAMIC_VERIFY    @"m113" //有新的幼儿园动态审核
#define PUSH_DYNAMIC_UNREAD        @"m114"//未读幼儿园动态
#define PUSH_NEW_CLASS_ALBUM       @"m117" //有新的班级相册
#define PUSH_NEW_CLASS_ALBUM_VERIFY @"m118" //推送给园长，有新的班级相册审核信息
#define PUSH_CLASS_ALBUM_HAVE_VERIFYED @"m119" //推送给老师，班级相册已经审核
#define PUSH_COURSE_OR_RECIPES_MODIFY @"m120" //教师修改课程食谱推送

#define PUSH_SYSTEM_NEW_MESSAGE @"m108" // 公告消息推送

#endif /* ZTHProtocolMacroDefine_h */
