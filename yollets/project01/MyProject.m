//
//  MyProject.m
//  project01
//
//  Created by lanou on 15/11/28.
//  Copyright (c) 2015年 yollet. All rights reserved.
//

#import "MyProject.h"
#import "ZouMiGong.h"
#import "GuangChengZhen.h"
#import "HuaXue.h"

void QuMing(char *name)
// 取名字
{
    int n = 1;
    printf("起个名字把：");
    scanf("%s", name);
    printf("你的名字是：%s ? 确认请按输入1,重新取名请按0：", name);
    scanf("%d", &n);
    if (n == 0) {
        QuMing(name);
    }
}

void ChaKanZhuangBei(ZhuangBei *zhuangbei)
// 查看装备
{
    printf("目前所有装备：\n");
    if (zhuangbei->yiFuData != 0) {
        printf("%s 防御+%d\n", zhuangbei->yiFu, zhuangbei->yiFuData);
    }
    if (zhuangbei->kuZiData != 0) {
        printf("%s 防御+%d\n", zhuangbei->kuZi, zhuangbei->kuZiData);
    }
    if (zhuangbei->xieZiData != 0) {
        printf("%s 防御+%d\n", zhuangbei->xieZi, zhuangbei->xieZiData);
    }
    if (zhuangbei->shiPingData != 0) {
        printf("%s 魔法+%d\n", zhuangbei->shiPing, zhuangbei->shiPingData);
    }
    if (zhuangbei->wuQiData != 0) {
        printf("%s 攻击+%d\n", zhuangbei->wuQi, zhuangbei->wuQiData);
    }
    int n = 0;
    printf("继续冒险请输入1\n");
    scanf("%d", &n);
    if (n != 1) {
        ChaKanZhuangBei(zhuangbei);
    }
}

void ShiYongDaoJu(ZhuRG *yollet)
// 使用道具
{
    printf("目前所有道具：\n");
    printf("%s %d\n", yollet->wuP->xueYao, yollet->wuP->xueYaoData);
    printf("%s %d\n", yollet->wuP->lanYao, yollet->wuP->lanYaoData);
    printf("%s %d\n", yollet->wuP->zhaDan, yollet->wuP->zhaDanData);
    int n = 0;
    printf("选择要使用的道具：1.止血草(HP+10)  2.鼠儿果(MP+10)  3.炸弹(???) 0.退出菜单\n");
    scanf("%d", &n);
    if (n == 1) {
        if (yollet->wuP->xueYaoData != 0) {
            yollet->wuP->xueYaoData--;
            yollet->xueliang += 10;
            printf("生命+10\n");
        }
        else {
            printf("道具数量不足");
        }
    }
    if (n == 2) {
        if (yollet->wuP->lanYaoData != 0) {
            yollet->wuP->lanYaoData--;
            yollet->mofa += 10;
            printf("魔法+10\n");
        }
        else {
            printf("道具数量不足");
        }
    }
    if (n == 3) {
        if (yollet->wuP->zhaDanData != 0) {
            yollet->wuP->zhaDanData--;
            yollet->qianJin = 1;
            printf("破墙+1\n");
        }
        else {
            printf("道具数量不足");
        }
    }
    printf("退出菜单\n");
}


void GongJi(ZhuRG *yollet, int n)
// 攻击怪物
{
    int g1 = 15, g2 = 50;// 怪物血量
    int s = 0;// 伤害记录
    int c = 0;// 选择攻击方式
    switch (n) {
        case 1:{
            printf("你碰到了 ˙∆˚ 史莱姆，它发出了弱者的气息\n");
            while (g1 > 0) {
                printf("˙∆˚ 史莱姆 血量%d 防御5 攻击8\n", g1);
                printf("%s%s你的血量：%d 剩余魔法：%d\n", yollet->touxiang, yollet->name, yollet->xueliang, yollet->mofa);
                printf("选择攻击方法：1.平A  2.法术  3.道具\n");
                scanf("%d", &c);
                if (c == 1) {
                    g1 = g1 - (yollet->gongji - 5);
                    s = yollet->gongji - 5;
                }
                else if (c == 2) {
                    s = XuanZeFaShu(yollet);
                    g1 -= s;
                }
                else if (c == 3) {
                    ShiYongDaoJu(yollet);
                }
                else {
                    printf("%s%s想要逃跑，被史莱姆追上一顿胖揍，生命-20\n", yollet->touxiang, yollet->name);
                    yollet->xueliang -= 20;
                    break;
                }
                printf("˙∆˚ 受到了%d点伤害\n", s);
                printf("˙∆˚攻击 你受到%d点伤害\n", 8 - yollet->fangyu);
                yollet->xueliang = yollet->xueliang - (8 - yollet->fangyu);
                if(PanDuanXueLiang(yollet) == 0){
                    printf("你被史莱姆吃掉了\n");
                    break;
                }
                
                }
            if (g1 <= 0) {
            printf("˙∆˚ 死了, 获得鼠儿果(回复MP) 获得￥30\n按s往下走\n");
            yollet->wuP->lanYaoData++;
            yollet->money +=30;
            }
            }
            break;
        case 2:{
            printf("你碰到了 ˚¬˚ 领主，他好像很厉害\n");
            while (g2 > 0) {
                printf("˚¬˚ 领主 血量%d 防御5 攻击10\n", g2);
                printf("%s%s你的血量：%d 剩余魔法：%d\n", yollet->touxiang, yollet->name, yollet->xueliang, yollet->mofa);
                printf("选择攻击方法：1.平A  2.法术  3.道具\n");
                scanf("%d", &c);
                if (c == 1) {
                    g2 = g2 - (yollet->gongji - 5);
                    s = yollet->gongji - 5;
                }
                else if (c == 2) {
                    s = XuanZeFaShu(yollet);
                    g2 -= s;
                }
                else if (c == 3) {
                    ShiYongDaoJu(yollet);
                }
                else {
                    printf("%s%s想要逃跑，被领主一把抓住，投了一个漂亮的三分，生命-100\n", yollet->touxiang, yollet->name);
                    yollet->xueliang -= 100;
                    break;
                }
                printf("˚¬˚ 受到了%d点伤害\n", s);
                printf("˚¬˚使用扣篮攻击 你受到%d点伤害\n", 10 - yollet->fangyu);
                yollet->xueliang = yollet->xueliang - (10 - yollet->fangyu);
                if(PanDuanXueLiang(yollet) == 0){
                    printf("你被领主抓走了~~\n");
                    break;
                }
                
            }
            if (g2 <= 0) {
                printf("˚¬˚ 撤退了, 获得领主的篮球 0 ，攻击+10 获得$100\n按d往右走\n");
                yollet->zhuangB->wuQiData = 10;
                yollet->gongji += yollet->zhuangB->wuQiData;
                yollet->money +=100;
                
            }
        }
            break;
            
        default:
            break;
    }
}

int XuanZeFaShu(ZhuRG *yollet)
// 选择法术
{
    int n = 0;
    printf("选择哪种法术？\n 1.治疗术(耗蓝%d治疗%d）  2.风咒(耗蓝%d攻击%d)  3.飓风(耗蓝%d攻击%d）  4.魔风(耗蓝%d攻击%d)  5.暴风(耗蓝%d攻击%d)\n", yollet->jiN->zhiLiaoData2, yollet->jiN->zhiLiaoData1, yollet->jiN->fengZhouData2, yollet->jiN->fengZhouData1, yollet->jiN->juFengData2, yollet->jiN->juFengData1, yollet->jiN->moFengData2, yollet->jiN->moFengData1, yollet->jiN->baoFengData2, yollet->jiN->baoFengData1);
    scanf("%d", &n);
    switch (n) {
        case 1:
            if (yollet->mofa >= yollet->jiN->zhiLiaoData2) {
            yollet->xueliang += yollet->jiN->zhiLiaoData1;
            yollet->mofa -= yollet->jiN->zhiLiaoData2;
            }
            else {
                printf("法力不足");
            }
            return 0;
            break;
        case 2:
            if (yollet->mofa >= yollet->jiN->fengZhouData2) {
                yollet->mofa -= yollet->jiN->fengZhouData2;
                return yollet->jiN->fengZhouData1;
            }
            else {
                printf("法力不足");
            return 0;
            }
            break;
        case 3:
            if (yollet->mofa >= yollet->jiN->juFengData2) {
                yollet->mofa -= yollet->jiN->juFengData2;
                return yollet->jiN->juFengData1;
            }
            else {
                printf("法力不足");
                return 0;
            }
            break;
        case 4:
            if (yollet->mofa >= yollet->jiN->moFengData2) {
                yollet->mofa -= yollet->jiN->moFengData2;
                return yollet->jiN->moFengData1;
            }
            else {
                printf("法力不足");
                return 0;
            }
            break;
        case 5:
            if (yollet->mofa >= yollet->jiN->baoFengData2) {
                yollet->mofa -= yollet->jiN->baoFengData2;
                return yollet->jiN->baoFengData1;
            }
            else {
                printf("法力不足");
                return 0;
            }
            break;
            
        default:
            printf("%s%s没有这种法术", yollet->touxiang, yollet->name);
            return 0;
            break;
    }
}

int PanDuanXueLiang(ZhuRG *yollet)
// 判断血量
{
    if (yollet->xueliang > 0) {
        return 1;
    }
    else {
        return 0;
    }
}

void ChaKanZhuangTai(ZhuRG *yollet)
// 查看人物状态
{
    printf("头像：%s 名字：%s 血量：%d 魔法值：%d 等级：%d 攻击力：%d 防御力：%d 钱：%d ???：%d\n", yollet->touxiang, yollet->name, yollet->xueliang, yollet->mofa, yollet->dengji, yollet->gongji, yollet->fangyu, yollet->money, yollet->qianJin);
}

void GouMaiWuPing(ZhuRG *yollet)
// 购物
{
    printf("˙o˙ 买点东西吗？1.买 2.不买\n");
    int n2 = 0;
    scanf("%d", &n2);
    while (n2 == 1) {
        printf("1.止血草 ￥100  2.鼠儿果 ￥100  3.退出\n");
        int n3 = 0;
        scanf("%d", &n3);
        if (n3 == 1 && yollet->money >= 100) {
            yollet->money -= 100;
            yollet->wuP->xueYaoData++;
            printf("止血草+1\n");
        }
        else if(n3 == 1 && yollet->money < 100) {
            printf("钱不够！\n");
        }
        else if (n3 == 2 && yollet->money >= 100) {
            yollet->money -= 100;
            yollet->wuP->lanYaoData++;
            printf("鼠儿果+1\n");
        }
        else if(n3 == 2 && yollet->money < 100) {
            printf("钱不够！\n");
        }
        else {
            printf("˙o˙ 谢谢光临! 按s往下\n");
            n2 = 5;
        }
    }
    if (n2 == 2) {
        printf("˙o˙ 真的不买点什么吗 按s往下\n");
    }
}

void GouMaiWuPingDaZhe(ZhuRG *yollet)
// 购物打折
{
    printf("˚0˚ 买点东西吗？1.买 2.不买\n");
    int n2 = 0;
    scanf("%d", &n2);
    while (n2 == 1) {
        printf("1.止血草 ￥50  2.鼠儿果 ￥50  3.退出\n");
        int n3 = 0;
        scanf("%d", &n3);
        if (n3 == 1 && yollet->money >= 50) {
            yollet->money -= 50;
            yollet->wuP->xueYaoData++;
            printf("止血草+1\n");
        }
        else if(n3 == 1 && yollet->money < 50) {
            printf("钱不够！\n");
        }
        else if (n3 == 2 && yollet->money >= 50) {
            yollet->money -= 50;
            yollet->wuP->lanYaoData++;
            printf("鼠儿果+1\n");
        }
        else if(n3 == 2 && yollet->money < 50) {
            printf("钱不够！\n");
        }
        else {
            printf("˚0˚ 谢谢光临! 按s往下\n");
            n2 = 5;
        }
    }
    if (n2 == 2) {
        printf("˚0˚ 打折也不买! 按s往下\n");
    }
}
void RpgGame(void)
// 角色扮演游戏
{
    int n = 0;
    ZhuRG *yollet = (ZhuRG *)malloc(sizeof(ZhuRG));
    QuMing(yollet->name);
    strcpy(yollet->touxiang, "˚π˚ ");
    yollet->xueliang = 30;// 血量
    yollet->mofa = 30;// 魔法
    yollet->dengji = 1;// 等级
    yollet->gongji = 10;// 攻击力
    yollet->fangyu = 0;// 防御力
    yollet->money = 0;// 钱
    yollet->qianJin = 0;// ？？？
    yollet->zhuangB = (ZhuangBei *)malloc(sizeof(ZhuangBei));
    strcpy(yollet->zhuangB->yiFu, "新手披风 ≈||≈");
    yollet->zhuangB->yiFuData = 0;
    strcpy(yollet->zhuangB->xieZi, "凌波靴 Ω");
    yollet->zhuangB->xieZiData = 0;
    strcpy(yollet->zhuangB->kuZi, "链甲裤 π");
    yollet->zhuangB->kuZiData = 0;
    strcpy(yollet->zhuangB->shiPing, "十字架 †");
    yollet->zhuangB->shiPingData = 0;
    strcpy(yollet->zhuangB->wuQi, "领主的篮球 0");
    yollet->zhuangB->wuQiData = 0;
    yollet->wuP = (WuPing *)malloc(sizeof(WuPing));
    strcpy(yollet->wuP->xueYao, "止血草 Z");
    yollet->wuP->xueYaoData = 0;
    strcpy(yollet->wuP->lanYao, "鼠儿果 S");
    yollet->wuP->lanYaoData = 0;
    strcpy(yollet->wuP->zhaDan, "炸弹 B");
    yollet->wuP->zhaDanData = 0;
    yollet->jiN = (JiNeng *)malloc(sizeof(JiNeng));
    strcpy(yollet->jiN->zhiLiao, "治疗术 ∂");
    yollet->jiN->zhiLiaoData1 = 10;
    yollet->jiN->zhiLiaoData2 = 10;
    strcpy(yollet->jiN->fengZhou, "风咒 ∫");
    yollet->jiN->fengZhouData1 = 10;
    yollet->jiN->fengZhouData2 = 10;
    strcpy(yollet->jiN->juFeng, "飓风 ∫∫");
    yollet->jiN->juFengData1 = 20;
    yollet->jiN->juFengData2 = 20;
    strcpy(yollet->jiN->moFeng, "魔风 ∫∫∫");
    yollet->jiN->moFengData1 = 30;
    yollet->jiN->moFengData2 = 30;
    strcpy(yollet->jiN->baoFeng, "暴风 *∫");
    yollet->jiN->baoFengData1 = 50;
    yollet->jiN->baoFengData2 = 50;
    printf("叮咚 您获得了新手披风 按1查看装备\n");
    yollet->zhuangB->yiFuData = 5;
    yollet->fangyu += yollet->zhuangB->yiFuData;
    scanf("%d", &n);
    if (n == 1) {
        ChaKanZhuangBei(yollet->zhuangB);
    }
    printf("啊～～～ %s%s掉进了一个洞穴\n", yollet->touxiang, yollet->name);
    ZouMiGong(yollet);
    if (yollet->xueliang > 0) {
    printf("终于走出这个洞穴了，这是哪？\n");
    GuangChengZhen(yollet);
    }
    free(yollet->jiN);
    free(yollet->wuP);
    free(yollet->zhuangB);
    free(yollet);
}
