//
//  MyProject.h
//  project01
//
//  Created by lanou on 15/11/28.
//  Copyright (c) 2015年 yollet. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct wuping {
    char xueYao[25];// 止血草
    int xueYaoData;
    char lanYao[25];// 鼠儿果
    int lanYaoData;
    char zhaDan[25];// 炸弹
    int zhaDanData;
}WuPing;
typedef struct zhuangbei {
    char yiFu[25];// 上衣
    int yiFuData;
    char kuZi[25];// 裤子
    int kuZiData;
    char xieZi[25];// 鞋子
    int xieZiData;
    char shiPing[25];// 饰品
    int shiPingData;
    char wuQi[25];// 武器
    int wuQiData;
}ZhuangBei;
typedef struct jineng {
    char zhiLiao[25];//  治疗术
    int zhiLiaoData1;
    int zhiLiaoData2;
    char fengZhou[25];// 风咒
    int fengZhouData1;
    int fengZhouData2;
    char juFeng[25];// 飓风
    int juFengData1;
    int juFengData2;
    char moFeng[25];// 魔风
    int moFengData1;
    int moFengData2;
    char baoFeng[25];// 暴风
    int baoFengData1;
    int baoFengData2;
}JiNeng;
typedef struct zhurengong {
    char touxiang[25];// 头像
    char name[25];// 名字
    int xueliang;// 血量
    int fangyu;// 防御力
    int dengji;// 等级
    ZhuangBei *zhuangB;// 装备
    int gongji;// 攻击力
    int mofa;// 魔法值
    int money;// 愤怒值
    JiNeng *jiN;// 技能栏
    WuPing *wuP;// 物品栏
    int qianJin;// 爆破值
}ZhuRG;


void RpgGame(void);// 角色扮演游戏
void QuMing(char *name);// 取名字
void ChaKanZhuangBei(ZhuangBei *zhuangbei);// 查看装备
void ShiYongDaoJu(ZhuRG *yollet);// 使用道具
void GongJi(ZhuRG *yollet, int n);// 攻击怪物
int XuanZeFaShu(ZhuRG *yollet);// 选择法术
int PanDuanXueLiang(ZhuRG *yollet);// 判断血量
void ChaKanZhuangTai(ZhuRG *yollet);// 查看人物状态
void GouMaiWuPing(ZhuRG *yollet);// 购物
void GouMaiWuPingDaZhe(ZhuRG *yollet);// 购物打折
