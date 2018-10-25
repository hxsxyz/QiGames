//
//  QiGuessWords.m
//  QiGames
//
//  Created by huangxianshuai on 2018/10/24.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import "QiGuessWords.h"

@interface QiGuessWords ()

@property (nonatomic, copy) NSMutableArray<NSString *> *primaryWords;
@property (nonatomic, copy) NSMutableArray<NSString *> *middleWords;
@property (nonatomic, copy) NSMutableArray<NSString *> *seniorWords;
@property (nonatomic, copy) NSMutableArray<NSString *> *complexWords;
@property (nonatomic, copy) NSMutableArray<NSString *> *customWords;

@property (nonatomic, copy) NSArray<NSMutableArray<NSString *>*> *allWords;

@end

@implementation QiGuessWords

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        NSString *primaryWords = @"螃蟹,口红,台灯,菜鸟,空调,饕餮,拖鞋,足球,沙发,翠花,香水,篮球,前端,唐僧,雨伞,贪婪,排球,豆浆,热点,油条,眼镜,啤酒,香蕉,手机,蜡烛,鸡蛋,钻戒,滑雪,饺子,电脑,恐龙,风水,榴莲,台湾,大象,插座,乌龟,蜡烛,老虎,花瓶,吐槽,卖萌,蝴蝶,监狱,手套,围巾,耳机,沙漏,坑爹,尔康,键盘,眼罩,钓鱼,冰雹,山楂,地暖,套路,屌丝,Wi-Fi,麦霸,扫帚,西瓜,学校,龙虾,性感,快递,纱窗,项链,马桶,腊肠,弃疗,躺枪,团购,葡萄,蜂蜜,辣椒,羊肉,烤鱼,玉米,贝壳,洋葱,油条,凤梨,长城,下雪,水杯,剁手,口罩,菜刀,聚餐 微笑,瞪眼,家暴,宅男,鸟巢,钓鱼,高铁,手机,白领,另类,蝴蝶,猎头,草根,举重,跳绳,蓝牙,房奴,下岗,皮球,跳水,喘气,蚊子,斑马,头发,大象,豆芽,水杯,花盆,老鼠,剪刀,东风,飞机,中国,莲藕,蜗牛,葡萄,点头,草莓,太阳,核桃,内裤,地图,月亮,牛肉,酸奶,拥抱,火腿,面包,摇头,大蒜,蜗居,微信,明星,白蛇,钓鱼,眼镜,闭嘴,吐槽,洋葱,雾霾,土豪,雪花,屌丝,宝宝,公主,蛋糕,插排,医生,跑步,国旗,沙漏,耳机,奶牛,春风,监狱,厕所,奇葩,皇帝,鸡蛋,火锅,手套,跳跃,油条,蜡烛,美国,镜子,算盘,放屁,日历,开心";
        NSString *middleWords = @"班主任,放风筝,苹果汁,孙悟空,自行车,猪八戒,电视机,餐巾纸,乒乓球,太极拳,温度计,微波炉,饮水机,办公桌,打麻将,年终奖,方便面,牛肉干,葛优躺,老司机,西红柿,独角兽,云计算,老男孩,客户端,守财奴,尿不湿,丘比特,三明治,剃须刀,轮滑鞋,秋刀鱼,结婚证,挤牙膏,富二代,红楼梦,犀利哥,大数据,拿破仑,采花贼,蜘蛛网,跑步机,单身狗,臭豆腐,剪指甲,互联网,玫瑰花,小鲜肉,拉肚子,马后炮,炒鱿鱼,耳旁风,败家子,老奶奶,替罪羊,乒乓球,看门狗,丧门星,恶作剧,三国杀,口头禅,马后炮,光秃秃,自行车,摩托车,碰碰车,丑八怪,空城计,背黑锅,二百五,血淋淋,羽毛球,马屁精,单相思,势利眼,铁饭碗,铁公鸡,摇钱树,紧箍咒,交际花,小日本,无底洞,猫头鹰,眼中钉,蜘蛛侠,笑面虎,落汤鸡,王八蛋,一丈红,地头蛇,老狐狸,癞蛤蟆,狮子座,富二代,北极熊,吃苹果,打游戏,下象棋,丧家犬,啃骨头,寄生虫,啄木鸟,老司机,跟屁虫,机器猫,白羊座,狗腿子,老油条,不倒翁,母夜叉,小星星,灰姑娘,桃花运,门外汉,自拍杆,拍马屁,金牛座,讲故事,笔记本,双鱼座,青花瓷,充电器,人民币,女朋友,大猩猩,摄像机,监控器,体温计,猕猴桃,法国人,剪头发,姐妹花,天黑黑,回娘家,健身房,么么哒,姑奶奶,孙悟空,蛋炒饭,婴儿肥,黑天鹅,太阳花,唐人街,软骨头,医药费,海景房,金耳环,金箍棒,麻辣烫,冰淇淋,秀恩爱,听音乐,平板撑";
        NSString *seniorWords = @"落井下石,七上八下,垂头丧气,左顾右盼,狼吞虎咽,小鸟依人,万紫千红,走马观花,马马虎虎,抓耳挠腮,闻鸡起舞,见钱眼开,鸡飞狗跳,累觉不爱,口是心非,笑里藏刀,一石二鸟,粗茶淡饭,妙笔生花,目不识丁,鸟语花香,汗马功劳,如虎添翼,面黄肌瘦,火冒三丈,自言自语,圣诞老人,心如刀割,顶天立地,骑虎难下,千军万马,螳螂捕蝉,三心二意,心花怒放,大呼小叫,心直口快,蓝瘦香菇,匠人精神,小李飞刀,骨肉相连,如鱼得水,对牛弹琴,吃瓜群众,趁热打铁,盗墓笔记,一心一意,龙飞凤舞,车水马龙,青梅竹马,奶茶妹妹,倚老卖老,一目十行,不屈不挠,撕心裂肺,冰天雪地,上下一心,一毛不拔,呕心沥血,哭笑不得,一唱一和,三十而立,多事之秋,信口开河,匍匐前进,心急如焚,一字一句,春暖花开,喜上眉梢,三长两短,七嘴八舌,一泻千里,心花怒放,怒气冲天,汗流浃背,大公无私,一了百了,心乱如麻,铺天盖地,汗如雨下,出口成章,一五一十,歪歪扭扭,忐忑不安,儿女情长,万里长城,三妻四妾,哭哭啼啼,冷血动物,心事重重,月黑风高,如雷贯耳,出生入死,五花八门,三头六臂,排山倒海,心如刀割,五马分尸,一笑千金,死不瞑目,归心似箭,力挽狂澜,顺手牵羊,同归于尽,五体投地,唠唠叨叨,刻骨铭心,一手遮天,天伦之乐,左邻右舍,大街小巷,尖嘴猴腮,水滴石穿,出尔反尔,守株待兔,悬梁刺股,名垂青史,放虎归山,呼风唤雨,鹅毛大雪,对牛弹琴,水落石出,势不两立,朝三暮四,刀光剑影,不明不白,口是心非,一诺千金,四分五裂,千丝万缕,一举一动,东倒西歪,丢三落四,青梅竹马,五湖四海,伶牙俐齿,千军万马,东张西望,受宠若惊,两面三刀,万水千山,健步如飞,争分夺秒,名垂青史,单刀直入,兴风作浪,花红柳绿,万里无云,众目睽睽,大红大绿,一路顺风";
        NSString *complexWords = @"低头思故乡,处处闻啼鸟,报得三春晖,孤帆远影碧空尽,当春乃发生,两情若是久长时,疑是银河落九天,千山鸟飞绝,直挂云帆济沧海,把酒问青天,但愿人长久,千树万树梨花开,木兰当户织,柳暗花明又一村,天涯若比邻,天涯共此时,古道西风瘦马,会当凌绝顶,一片冰心在玉壶,一行白鹭上青天,春色满园关不住,天下谁人不识君,大头儿子小头爸爸,十万个为什么,聪明的一休,复仇者联盟,梁山伯与朱丽叶,罗密欧与祝英台,摔跤吧爸爸,唐人街探案,湄公河行动,唐伯虎点秋香,西虹市首富,致我们终将逝去的青春,速度与激情,了不起的盖茨比,智取威虎山,解救吾先生,侏罗纪世界,肖申克的救赎,名侦探柯南,樱桃小丸子,美少女战士,中国好声音,快乐大本营,中国新说唱,相声有新人,王牌对王牌,我就是演员,欢乐喜剧人,爸爸去哪儿,跨界喜剧王,蒙面唱将猜猜猜,奔跑吧兄弟";
        NSString *customWords = @"南瓜屋,智能物联,嵌入式,产品经理,设计师,iOS,安卓,网络安全学院,奇舞学院,QiShare,奇舞周刊,奇效,开放平台,1024,小水滴,行车记录仪,扫地机器人,智能门锁,香山体脂称,欧瑞博门锁,乐高路由器,儿童手表,智能牙刷,智能插座,WEB平台,奇舞团,IoT云平台,QTest,MQTT,XLink,PHP,Python,Go,Java,HTML,C#,Photoshop,Axsure,AI,图层,蒙版,原型,高保真,公众号,文案,回滚,bug,搜索,游戏,360杀毒,鲁大师,QPush,定时,OTA,360商城,360账号卫士,0配,花椒直播";
        
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
    NSUInteger i = r < 3? 0: r < 4? 1: r < 5? 2: r < 7? 3: 4;
    
    NSMutableArray<NSString *> *words = _allWords[i];
    
    if (words.count == 0) {
        return self.randomWord;
    }
    
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
