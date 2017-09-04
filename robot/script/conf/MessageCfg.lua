local MessageCfg = {}

MessageCfg["Login"] = {id=[[Login]],desc=[[登陆]],req=101,rsp=201,notify=301,notifyDesc=nil}

MessageCfg["TokenLogin"] = {id=[[TokenLogin]],desc=[[token登录]],req=102,rsp=202,notify=302,notifyDesc=nil}

MessageCfg["OtherLogin"] = {id=[[OtherLogin]],desc=[[玩家在其他地方登陆]],req=103,rsp=203,notify=303,notifyDesc=nil}

MessageCfg["Chat"] = {id=[[Chat]],desc=[[聊天]],req=104,rsp=204,notify=304,notifyDesc=nil}

MessageCfg["CreateRoom"] = {id=[[CreateRoom]],desc=[[创建房间]],req=105,rsp=205,notify=305,notifyDesc=nil}

MessageCfg["EnterRoom"] = {id=[[EnterRoom]],desc=[[进入房间]],req=106,rsp=206,notify=306,notifyDesc=nil}

MessageCfg["LeaveRoom"] = {id=[[LeaveRoom]],desc=[[离开房间]],req=107,rsp=207,notify=307,notifyDesc=nil}

MessageCfg["DisbandRoomResult"] = {id=[[DisbandRoomResult]],desc=[[解散房间投票结果]],req=108,rsp=208,notify=308,notifyDesc=nil}

MessageCfg["InvalidMsg"] = {id=[[InvalidMsg]],desc=[[非法消息]],req=109,rsp=209,notify=309,notifyDesc=nil}

MessageCfg["GameStart"] = {id=[[GameStart]],desc=[[牌局开始]],req=110,rsp=210,notify=310,notifyDesc=nil}

MessageCfg["CardsInfo"] = {id=[[CardsInfo]],desc=[[玩家自己手里的牌]],req=111,rsp=211,notify=311,notifyDesc=nil}

MessageCfg["SelectLack"] = {id=[[SelectLack]],desc=[[选缺]],req=112,rsp=212,notify=312,notifyDesc=nil}

MessageCfg["FirstPlayHand"] = {id=[[FirstPlayHand]],desc=[[服务器通知玩家出第一手牌]],req=113,rsp=213,notify=313,notifyDesc=nil}

MessageCfg["PlayHand"] = {id=[[PlayHand]],desc=[[出牌]],req=114,rsp=214,notify=314,notifyDesc=nil}

MessageCfg["BroadPlayHand"] = {id=[[BroadPlayHand]],desc=[[服务器广播玩家出牌]],req=115,rsp=215,notify=315,notifyDesc=nil}

MessageCfg["NextPlayHand"] = {id=[[NextPlayHand]],desc=[[服务器通知下一个操作]],req=116,rsp=216,notify=316,notifyDesc=nil}

MessageCfg["Action"] = {id=[[Action]],desc=[[服务器通知下一轮操作]],req=117,rsp=217,notify=317,notifyDesc=[[服务器通知下一轮操作]]}

MessageCfg["Peng"] = {id=[[Peng]],desc=[[碰]],req=118,rsp=218,notify=318,notifyDesc=nil}

MessageCfg["BroadPeng"] = {id=[[BroadPeng]],desc=[[服务器广播玩家碰]],req=119,rsp=219,notify=319,notifyDesc=[[服务器广播客户端能碰]]}

MessageCfg["Gang"] = {id=[[Gang]],desc=[[杠]],req=120,rsp=220,notify=320,notifyDesc=nil}

MessageCfg["BroadGang"] = {id=[[BroadGang]],desc=[[服务器广播玩家杠]],req=121,rsp=221,notify=321,notifyDesc=[[服务器广播客户端杠]]}

MessageCfg["HuPai"] = {id=[[HuPai]],desc=[[胡牌]],req=122,rsp=222,notify=322,notifyDesc=nil}

MessageCfg["BroadHuPai"] = {id=[[BroadHuPai]],desc=[[服务器广播玩家胡牌]],req=123,rsp=223,notify=323,notifyDesc=[[服务器广播客户端胡牌]]}

MessageCfg["Pass"] = {id=[[Pass]],desc=[[过]],req=124,rsp=224,notify=324,notifyDesc=nil}

MessageCfg["BroadPass"] = {id=[[BroadPass]],desc=[[服务器广播玩家过]],req=125,rsp=225,notify=325,notifyDesc=[[服务器广播客户端过]]}

MessageCfg["NewCard"] = {id=[[NewCard]],desc=[[服务器广播玩家新牌]],req=126,rsp=226,notify=326,notifyDesc=[[服务器广播玩家新牌]]}

MessageCfg["NewCardAction"] = {id=[[NewCardAction]],desc=[[服务器通知玩家摸到新牌后可以进行的碰杠胡操作列表]],req=127,rsp=227,notify=327,notifyDesc=nil}

MessageCfg["AccountOne"] = {id=[[AccountOne]],desc=[[单局结算]],req=128,rsp=228,notify=328,notifyDesc=nil}

MessageCfg["AccountAll"] = {id=[[AccountAll]],desc=[[结算多局]],req=129,rsp=229,notify=329,notifyDesc=nil}

MessageCfg["Heartbeat"] = {id=[[Heartbeat]],desc=[[心跳]],req=130,rsp=230,notify=330,notifyDesc=nil}

MessageCfg["OffLine"] = {id=[[OffLine]],desc=[[下线]],req=131,rsp=231,notify=331,notifyDesc=nil}

MessageCfg["OnLine"] = {id=[[OnLine]],desc=[[上线]],req=132,rsp=232,notify=332,notifyDesc=nil}

MessageCfg["ReadyNext"] = {id=[[ReadyNext]],desc=[[准备好了可以下一局]],req=133,rsp=233,notify=333,notifyDesc=nil}

MessageCfg["Message"] = {id=[[Message]],desc=[[消息]],req=134,rsp=234,notify=334,notifyDesc=nil}

MessageCfg["MessageList"] = {id=[[MessageList]],desc=[[消息列表]],req=135,rsp=235,notify=335,notifyDesc=nil}

MessageCfg["Announcement"] = {id=[[Announcement]],desc=[[公告]],req=136,rsp=236,notify=336,notifyDesc=nil}

MessageCfg["StandingsList"] = {id=[[StandingsList]],desc=[[战绩]],req=137,rsp=237,notify=337,notifyDesc=nil}

MessageCfg["ReLogin"] = {id=[[ReLogin]],desc=[[断线重连]],req=138,rsp=238,notify=338,notifyDesc=nil}

MessageCfg["RoomChat"] = {id=[[RoomChat]],desc=[[牌局里聊天]],req=139,rsp=239,notify=339,notifyDesc=nil}

MessageCfg["DisbandRoomVote"] = {id=[[DisbandRoomVote]],desc=[[解散牌局投票]],req=140,rsp=240,notify=340,notifyDesc=nil}

MessageCfg["GuoHu"] = {id=[[GuoHu]],desc=[[过胡]],req=141,rsp=241,notify=341,notifyDesc=nil}

MessageCfg["RoomCardChged"] = {id=[[RoomCardChged]],desc=[[房卡数量变化]],req=142,rsp=242,notify=342,notifyDesc=nil}

MessageCfg["BaoPai"] = {id=[[BaoPai]],desc=[[报牌]],req=143,rsp=243,notify=343,notifyDesc=nil}

MessageCfg["LongPai"] = {id=[[LongPai]],desc=[[拢牌]],req=144,rsp=244,notify=344,notifyDesc=nil}

MessageCfg["ZhaoPai"] = {id=[[ZhaoPai]],desc=[[招牌]],req=145,rsp=245,notify=345,notifyDesc=nil}

MessageCfg["ChiPai"] = {id=[[ChiPai]],desc=[[吃牌]],req=146,rsp=246,notify=346,notifyDesc=nil}

MessageCfg["Ops"] = {id=[[Ops]],desc=[[可进行操作]],req=147,rsp=247,notify=347,notifyDesc=nil}

MessageCfg["SomeOneBao"] = {id=[[SomeOneBao]],desc=[[有人报牌]],req=148,rsp=248,notify=348,notifyDesc=nil}

MessageCfg["HeiBai"] = {id=[[HeiBai]],desc=[[黑摆]],req=149,rsp=249,notify=349,notifyDesc=nil}

MessageCfg["LongKan"] = {id=[[LongKan]],desc=[[3拢4坎]],req=150,rsp=250,notify=350,notifyDesc=nil}

MessageCfg["AllCardsInfo"] = {id=[[AllCardsInfo]],desc=[[                   ]],req=151,rsp=251,notify=351,notifyDesc=nil}

MessageCfg["StandingBrief"] = {id=[[StandingBrief]],desc=[[单个房间总结算]],req=152,rsp=252,notify=352,notifyDesc=nil}

MessageCfg["StandingDetail"] = {id=[[StandingDetail]],desc=[[单个房间中每局的结算]],req=153,rsp=253,notify=353,notifyDesc=nil}

MessageCfg["Record"] = {id=[[Record]],desc=[[单局回放]],req=154,rsp=254,notify=354,notifyDesc=nil}

MessageCfg["NewMail"] = {id=[[NewMail]],desc=[[新邮件]],req=155,rsp=255,notify=355,notifyDesc=nil}

MessageCfg["Mail"] = {id=[[Mail]],desc=[[邮件]],req=156,rsp=256,notify=356,notifyDesc=nil}

MessageCfg["MailList"] = {id=[[MailList]],desc=[[邮件列表]],req=157,rsp=257,notify=357,notifyDesc=nil}

MessageCfg["DelMail"] = {id=[[DelMail]],desc=[[删除邮件]],req=158,rsp=258,notify=358,notifyDesc=nil}

MessageCfg["Distribut21"] = {id=[[Distribut21]],desc=[[发第21张牌]],req=159,rsp=259,notify=359,notifyDesc=nil}

MessageCfg["AuthCode"] = {id=[[AuthCode]],desc=[[获取验证码]],req=160,rsp=260,notify=360,notifyDesc=nil}

MessageCfg["Register"] = {id=[[Register]],desc=[[游客注册]],req=161,rsp=261,notify=361,notifyDesc=nil}

MessageCfg["SetUserInfo"] = {id=[[SetUserInfo]],desc=[[设置玩家信息]],req=162,rsp=262,notify=362,notifyDesc=nil}

MessageCfg["PhoneLogin"] = {id=[[PhoneLogin]],desc=[[手机号登录]],req=163,rsp=263,notify=363,notifyDesc=nil}

MessageCfg["TiPai"] = {id=[[TiPai]],desc=[[提牌]],req=164,rsp=264,notify=364,notifyDesc=nil}

MessageCfg["SelectBao"] = {id=[[SelectBao]],desc=[[玩家报牌情况广播]],req=165,rsp=265,notify=365,notifyDesc=nil}

MessageCfg["WeChatInfo"] = {id=[[WeChatInfo]],desc=[[微信信息]],req=166,rsp=266,notify=366,notifyDesc=nil}

MessageCfg["Certification"] = {id=[[Certification]],desc=[[实名认证]],req=167,rsp=267,notify=367,notifyDesc=nil}

MessageCfg["WxPay"] = {id=[[WxPay]],desc=[[生成微信支付订单]],req=180,rsp=280,notify=380,notifyDesc=nil}

MessageCfg["AliPay"] = {id=[[AliPay]],desc=[[生成阿里支付订单]],req=181,rsp=281,notify=381,notifyDesc=nil}

MessageCfg["ApPay"] = {id=[[ApPay]],desc=[[苹果支付]],req=182,rsp=282,notify=382,notifyDesc=nil}

MessageCfg["WxShare"] = {id=[[WxShare]],desc=[[微信分享]],req=183,rsp=283,notify=383,notifyDesc=nil}

MessageCfg["SanGongCreateRoom"] = {id=[[SanGongCreateRoom]],desc=[[三公创建房间]],req=401,rsp=501,notify=601,notifyDesc=nil}

MessageCfg["SanGongStartGame"] = {id=[[SanGongStartGame]],desc=[[三公开始请求]],req=402,rsp=502,notify=602,notifyDesc=nil}

MessageCfg["SanGongYaZhu"] = {id=[[SanGongYaZhu]],desc=[[三公开始压注]],req=403,rsp=503,notify=603,notifyDesc=nil}

MessageCfg["SanGongSomeOneYaZhu"] = {id=[[SanGongSomeOneYaZhu]],desc=[[三公有人压注]],req=404,rsp=504,notify=604,notifyDesc=nil}

MessageCfg["SanGongShowCard"] = {id=[[SanGongShowCard]],desc=[[三公翻出第3张牌]],req=405,rsp=505,notify=605,notifyDesc=nil}

MessageCfg["SanGongQZhuang"] = {id=[[SanGongQZhuang]],desc=[[三公抢庄]],req=406,rsp=506,notify=606,notifyDesc=nil}

return MessageCfg
