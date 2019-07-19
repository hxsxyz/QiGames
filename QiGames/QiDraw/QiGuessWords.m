//
//  QiGuessWords.m
//  QiGames
//
//  Created by huangxianshuai on 2018/10/24.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import "QiGuessWords.h"

@interface QiGuessWords ()

@property (nonatomic, copy) NSMutableArray<NSString *> *primaryWords;//!< 简单难度词条
@property (nonatomic, copy) NSMutableArray<NSString *> *middleWords;//!< 中等难度词条
@property (nonatomic, copy) NSMutableArray<NSString *> *seniorWords;//!< 高等难度词条
@property (nonatomic, copy) NSMutableArray<NSString *> *complexWords;//!< 复杂难度词条
@property (nonatomic, copy) NSMutableArray<NSString *> *customWords;//!< 自定义词条

@property (nonatomic, copy) NSArray<NSMutableArray<NSString *>*> *allWords;//!< 所以词条

@end

@implementation QiGuessWords

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        NSString *primaryWords = @"螃蟹,口红,台灯,菜鸟,空调,拖鞋,足球,沙发,翠花,香水,篮球,前端,唐僧,雨伞,排球,豆浆,热点,油条,眼镜,啤酒,香蕉,手机,蜡烛,鸡蛋,钻戒,滑雪,饺子,电脑,恐龙,风水,榴莲,台湾,大象,插座,乌龟,蜡烛,老虎,花瓶,吐槽,卖萌,蝴蝶,手套,围巾,耳机,沙漏,尔康,键盘,眼罩,钓鱼,冰雹,山楂,套路,Wi-Fi,麦霸,扫帚,西瓜,学校,龙虾,快递,纱窗,项链,马桶,腊肠,躺枪,团购,葡萄,蜂蜜,辣椒,羊肉,烤鱼,玉米,贝壳,洋葱,油条,凤梨,长城,下雪,水杯,剁手,口罩,菜刀,聚餐,微笑,瞪眼,宅男,鸟巢,钓鱼,高铁,手机,白领,蝴蝶,举重,跳绳,蓝牙,皮球,跳水,喘气,蚊子,斑马,头发,大象,豆芽,水杯,花盆,老鼠,剪刀,东风,飞机,中国,莲藕,蜗牛,葡萄,点头,草莓,太阳,核桃,地图,月亮,牛肉,酸奶,拥抱,火腿,面包,摇头,大蒜,蜗居,微信,明星,白蛇,钓鱼,眼镜,吐槽,洋葱,雾霾,土豪,雪花,宝宝,公主,蛋糕,插排,医生,跑步,国旗,沙漏,耳机,奶牛,春风,厕所,奇葩,皇帝,鸡蛋,火锅,手套,跳跃,油条,蜡烛,镜子,算盘,日历,开心";
        NSString *middleWords = @"班主任,放风筝,苹果汁,孙悟空,自行车,猪八戒,电视机,餐巾纸,乒乓球,太极拳,温度计,微波炉,饮水机,办公桌,打麻将,年终奖,方便面,牛肉干,葛优躺,老司机,西红柿,独角兽,云计算,老男孩,客户端,守财奴,尿不湿,丘比特,三明治,剃须刀,轮滑鞋,秋刀鱼,结婚证,挤牙膏,富二代,红楼梦,犀利哥,大数据,拿破仑,采花贼,蜘蛛网,跑步机,单身狗,臭豆腐,剪指甲,互联网,玫瑰花,小鲜肉,拉肚子,马后炮,炒鱿鱼,耳旁风,老奶奶,替罪羊,乒乓球,看门狗,恶作剧,三国杀,口头禅,马后炮,自行车,摩托车,碰碰车,丑八怪,空城计,背黑锅,二百五,血淋淋,羽毛球,摇钱树,紧箍咒,无底洞,猫头鹰,蜘蛛侠,落汤鸡,狮子座,富二代,北极熊,吃苹果,打游戏,下象棋,啃骨头,寄生虫,啄木鸟,跟屁虫,机器猫,白羊座,小星星,灰姑娘,桃花运,自拍杆,金牛座,讲故事,笔记本,双鱼座,青花瓷,充电器,人民币,女朋友,大猩猩,摄像机,监控器,体温计,猕猴桃,法国人,剪头发,姐妹花,天黑黑,回娘家,健身房,么么哒,姑奶奶,孙悟空,蛋炒饭,婴儿肥,黑天鹅,太阳花,唐人街,软骨头,医药费,海景房,金耳环,金箍棒,麻辣烫,冰淇淋,秀恩爱,听音乐,平板撑";
        NSString *seniorWords = @"落井下石,七上八下,垂头丧气,左顾右盼,狼吞虎咽,小鸟依人,万紫千红,走马观花,马马虎虎,抓耳挠腮,闻鸡起舞,见钱眼开,鸡飞狗跳,口是心非,笑里藏刀,一石二鸟,粗茶淡饭,妙笔生花,目不识丁,鸟语花香,汗马功劳,如虎添翼,自言自语,圣诞老人,心如刀割,顶天立地,骑虎难下,千军万马,螳螂捕蝉,三心二意,心花怒放,大呼小叫,心直口快,蓝瘦香菇,匠人精神,小李飞刀,骨肉相连,如鱼得水,对牛弹琴,吃瓜群众,趁热打铁,盗墓笔记,一心一意,龙飞凤舞,车水马龙,青梅竹马,奶茶妹妹,倚老卖老,一目十行,不屈不挠,撕心裂肺,冰天雪地,上下一心,一毛不拔,呕心沥血,哭笑不得,一唱一和,三十而立,多事之秋,信口开河,匍匐前进,心急如焚,一字一句,春暖花开,喜上眉梢,三长两短,七嘴八舌,一泻千里,心花怒放,怒气冲天,汗流浃背,大公无私,一了百了,心乱如麻,铺天盖地,汗如雨下,出口成章,一五一十,歪歪扭扭,忐忑不安,儿女情长,万里长城,哭哭啼啼,心事重重,月黑风高,如雷贯耳,出生入死,五花八门,三头六臂,排山倒海,心如刀割,一笑千金,归心似箭,力挽狂澜,顺手牵羊,同归于尽,五体投地,唠唠叨叨,刻骨铭心,一手遮天,左邻右舍,大街小巷,水滴石穿,守株待兔,悬梁刺股,名垂青史,放虎归山,呼风唤雨,鹅毛大雪,对牛弹琴,水落石出,势不两立,朝三暮四,刀光剑影,不明不白,口是心非,一诺千金,千丝万缕,一举一动,东倒西歪,丢三落四,青梅竹马,五湖四海,伶牙俐齿,千军万马,东张西望,受宠若惊,两面三刀,万水千山,健步如飞,争分夺秒,名垂青史,单刀直入,兴风作浪,花红柳绿,万里无云,众目睽睽,大红大绿,一路顺风";
        NSString *complexWords = @"大头儿子小头爸爸,十万个为什么,聪明的一休,复仇者联盟,梁山伯与朱丽叶,罗密欧与祝英台,摔跤吧爸爸,唐人街探案,湄公河行动,唐伯虎点秋香,西虹市首富,速度与激情,了不起的盖茨比,智取威虎山,侏罗纪世界,肖申克的救赎,名侦探柯南,樱桃小丸子,美少女战士,中国好声音,快乐大本营,中国新说唱,相声有新人,王牌对王牌,我就是演员,欢乐喜剧人,爸爸去哪儿,跨界喜剧王,蒙面唱将猜猜猜,奔跑吧兄弟,低头思故乡,处处闻啼鸟,报得三春晖,孤帆远影碧空尽,当春乃发生,两情若是久长时,疑是银河落九天,千山鸟飞绝,直挂云帆济沧海,把酒问青天,但愿人长久,千树万树梨花开,木兰当户织,柳暗花明又一村,天涯若比邻,天涯共此时,古道西风瘦马,会当凌绝顶,一片冰心在玉壶,一行白鹭上青天,春色满园关不住,天下谁人不识君,只是当时已惘然,一行白鹭上青天,一枝红杏出墙来,一览众山小,最是一年春好处,碧玉妆成一树高,朝辞白帝彩云间,红掌拨清波,二月春风似剪刀,白日依山尽,更上一层楼,春眠不觉晓,但使龙城飞将在,秦时明月汉时关,劝君更尽一杯酒,每逢佳节倍思亲,床前明月光,日照香炉生紫烟,飞流直下三千尺,烟花三月下扬州,两个黄鹂鸣翠柳,春风又绿江南岸,竹外桃花三两枝,不识庐山真面目,小河才露尖尖角,万紫千红总是春,等闲识得东风面,白毛浮绿水,解落三秋叶,黄河远上白云间,春风不度玉门关,黄河入海流,处处闻啼鸟,葡萄美酒夜光杯,醉卧沙场君莫笑,西出阳关无故人,客舍青青柳色新,不及汪伦送我情,两岸猿声啼不住,锄禾日当午,粒粒皆辛苦,春来江水绿如蓝,离离原上草,春风吹又生,野火烧不尽,月黑雁飞高,独钓寒江雪,万径人踪灭,孤舟蓑笠翁,小娃撑小艇,浮萍一道开,霜叶红于二月花,停车坐爱枫林晚,远上寒山石径斜,白云深处有人家,清明时节雨纷纷,路上行人欲断魂,借问酒家何处有,牧童遥指杏花村,南朝四百八十寺,多少楼台烟雨中,夕阳无限好,爆竹声中一岁除,春风送暖入屠苏,总把新桃换旧符,千门万户瞳瞳日,京口瓜洲一水间,明月何时照我还,黑云翻墨未遮山,卷地风来忽吹散,望湖楼下水如天,淡妆浓抹总相宜,山色空朦雨欲奇,春江水暖鸭先知,正是河豚欲上时,横看成岭侧成峰,只缘身在此山中,远近高低各不同,早有蜻蜓立上头,不要人夸颜色好,只留清气满乾坤";
        
        NSString *customWords = @"盘他,硬核,像极了爱情,雨女无瓜,996,好嗨呦,安全审计,OA流程,升职加薪,用户至上,当责奋斗,开放协作,持续创新,诚信正直,不断反思,儿童手表,好为人师,智能音箱,360+,已度,着迷,猎网神探,垃圾分类,QDAS,Flutter,Dart,QiShare,Swift,SwiftUI,AI,安全大脑,IoT云,QUC,数据可视化,QPush,APM,HRBP,家庭防火墙,智能门铃,复盘,南瓜屋,产品经理,设计师,iOS,安卓,1024,行车记录仪,扫地机器人,智能门锁,智能牙刷,智能插座,WEB平台,奇舞团,QTest,PHP,Python,Go,Java,HTML,Linux,Unix,C#,Photoshop,Axsure,AI,图层,公众号,文案,回滚,bug,搜索,游戏,360杀毒,鲁大师,定时,360商城,帐号卫士,花椒直播,MAC,可穿戴设备,设备管理,图像识别,UDP,TCP,人机交互,语音识别,手机软件,视频直播,互联网金融,安全卫士,手机助手,清理大师,安全设备认证,hulk云平台,扫码关注,二维码,海量数据分析,数据挖掘,用户画像,实时运算,用户中心,北京时间,小仙女";
        
//        NSString *customWords = @"重新定义,扁平文化,第二曲线,执行力,stay hungry,安全大脑,大安全,安全感,吸星大法,国家网络安全大脑,城市安全大脑,家庭安全大脑,网络国防,IMABCDE,儿童手表,家庭防火墙,智能门铃,复盘,生态创新,孵化,南瓜屋,产品经理,设计师,iOS,安卓,网络安全学院,奇舞学院,QiShare,奇舞周刊,奇效,开放平台,1024,行车记录仪,扫地机器人,智能门锁,智能牙刷,智能插座,WEB平台,奇舞团,QTest,PHP,Python,Go,Java,HTML,Linux,Unix,C#,Photoshop,Axsure,AI,图层,原型,高保真,公众号,文案,回滚,bug,搜索,游戏,360杀毒,鲁大师,QPush,定时,360商城,帐号卫士,花椒直播,MAC,可穿戴设备,设备管理,图像识别,数据可视化,UDP,TCP,高保真,人机交互,语音识别,消息推送,电脑软件,手机软件,视频直播,金融科技,个人服务,安全理赔,企业服务,安全卫士,手机助手,清理大师,登录,注册,首页,资源中心,数据中心,产品管理,深耕安全十三年,安全设备认证,漏洞管理,敏感信息保护,云端安全,数据安全存储,扫码关注,二维码,海量数据分析,大数据挖掘,用户画像,实时运算,用户中心,北京时间";
        
//        NSString *customWords = @"南瓜屋,智能物联,嵌入式,产品经理,设计师,iOS,安卓,网络安全学院,奇舞学院,QiShare,奇舞周刊,奇效,开放平台,1024,小水滴,行车记录仪,扫地机器人,智能门锁,香山体脂称,欧瑞博门锁,乐高路由器,儿童手表,智能牙刷,智能插座,WEB平台,奇舞团,IoT云平台,QTest,MQTT,XLink,PHP,Python,Go,Java,HTML,Linux,Unix,C#,Photoshop,Axsure,AI,图层,原型,高保真,公众号,文案,回滚,bug,搜索,游戏,360杀毒,鲁大师,QPush,定时,OTA,360商城,帐号卫士,0配,花椒直播,一键配,固件,单片机,MAC,可穿戴设备,设备管理,互联互通,图像识别,数据可视化,UDP,TCP,高保真,人机交互,语音识别,消息推送,电脑软件,手机软件,视频直播,金融科技,个人服务,安全理赔,企业服务,安全卫士,手机助手,清理大师,安全路由,登录,注册,首页,资源中心,数据中心,产品管理,深耕安全十三年,安全设备认证,漏洞管理,智能硬件安全,敏感信息保护,云端安全,数据安全存储,扫码关注,二维码,海量数据分析,大数据挖掘,用户画像,实时运算,用户中心,鲁大师,快视频,北京时间,快资讯,你财富,同城帮";
        
        _primaryWords = [primaryWords componentsSeparatedByString:@","].mutableCopy;
        _middleWords = [middleWords componentsSeparatedByString:@","].mutableCopy;
        _seniorWords = [seniorWords componentsSeparatedByString:@","].mutableCopy;
        _complexWords = [complexWords componentsSeparatedByString:@","].mutableCopy;
        _customWords = [customWords componentsSeparatedByString:@","].mutableCopy;
        
        _allWords = @[_primaryWords, _middleWords, _seniorWords, _complexWords, _customWords];
    }
    
    return self;
}


#pragma mark - Getters

- (NSString *)randomWord {
    
    NSUInteger r = arc4random() % 10;
    NSUInteger i = r < 2? 0: r < 4? 1: r < 6? 2: r < 8? 3: 4;
    
    NSMutableArray<NSString *> *words = _allWords[i];
    
    if (words.count == 0) {
        return self.randomWord;
    } //!< 所有数据取完后会造成死循环
    
    NSUInteger index = arc4random() % words.count;
    NSString *randomWord = words[index];
    [words removeObject:randomWord];
    
    return randomWord;
}


#pragma mark - Public functions

- (NSArray<NSString *> *)randomWordsWithType:(QiGuessWordsType)type count:(NSUInteger)count {
    
    NSMutableArray<NSString *> *words = [NSMutableArray array];
    
    switch (type) {
        case QiGuessWordsTypePrimary:
            words = _primaryWords;
            break;
        case QiGuessWordsTypeMiddle:
            words = _middleWords;
            break;
        case QiGuessWordsTypeSenior:
            words = _seniorWords;
            break;
        case QiGuessWordsTypeComplex:
            words = _complexWords;
            break;
        case QiGuessWordsTypeCustom:
            words = _customWords;
            break;
        default:
            break;
    }
    
    NSMutableSet *randomWords = [NSMutableSet set];
    
    while (randomWords.count < MIN(count, words.count)) {
        NSUInteger i = arc4random() % words.count;
        [randomWords addObject:words[i]];
        [words removeObjectAtIndex:i];
    }
    
    return randomWords.allObjects;
}

@end
