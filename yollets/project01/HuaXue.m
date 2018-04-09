//
//  HuaXue.m
//  project01
//
//  Created by lanou on 15/12/3.
//  Copyright (c) 2015年 yollet. All rights reserved.
//

#import "HuaXue.h"
#import "MyProject.h"

void HuaXuePlay(ZhuRG *yollet)
// 滑雪
{
    char a[25][8] =
    {
        //0123456
        {"#  0  #"},// 0
        {"#     #"},// 1
        {"#?   ?#"},// 2 // Z   !
        {"#     #"},// 3
        {"#  ?  #"},// 4 //   X
        {"#?    #"},// 5 // S
        {"#    ?#"},// 6 //     !
        {"#?    #"},// 7 // B
        {"#    ?#"},// 8 //     B
        {"#     #"},// 9
        {"#  ?  #"},// 10//   !
        {"#     #"},// 11
        {"#?    #"},// 12// X
        {"#    ?#"},// 13//     Z
        {"#   X #"},// 14
        {"#  X  #"},// 15
        {"#     #"},// 16
        {"#    X#"},// 17
        {"#X    #"},// 18
        {"# X   #"},// 19
        {"#  X  #"},// 20
        {"#  X  #"},// 21
        {"#   X #"},// 22
        {"#  X  #"},// 23
        {"#?????#"} // 24
    };
    a[0][3] = '0';
    int i = 0, j = 3;
    for (int i = 0; i < 25; i++) {
        printf("%s\n", a[i]);
    }
    char shuru = '0';
    printf("走迷宫把！w上 s下 a左 d右 f使用道具 q查看人物状态 t查看装备：\n");
    while (a[8][9] != '0' && yollet->xueliang > 0) {
        
        if (a[1][2] == '0') {
            yollet->wuP->zhaDanData++;
            printf("得到炸弹(有什么用呢？)\n");
            a[1][2] = '#';
        }
        if (a[1][5] == '0') {
            yollet->wuP->xueYaoData++;
            printf("获得止血草(回复生命)\n");
            a[1][5] = '#';
        }
        if (a[4][3] == '0') {
            GongJi(yollet, 1);
            a[4][3] = '#';
        }
        if (a[8][7] == '0') {
            GongJi(yollet, 2);
            a[8][7] = '#';
        }
        scanf("\n%c", &shuru);
        
        switch (shuru) {
                
            case 'w':
            {
                if (a[i-1][j] != '#') {
                    if (a[i][j] != '#') {
                        a[i][j] = ' ';
                    }
                    i--;
                    a[i][j] = '0';
                    
                }
                else if (yollet->qianJin == 1) {
                    a[i-1][j] = ' ';
                    yollet->qianJin--;
                }
            }
                break;
            case 'a':
            {
                if (a[i][j-1] != '#') {
                    if (a[i][j] != '#') {
                        a[i][j] = ' ';
                    }
                    j--;
                    a[i][j] = '0';
                    
                    
                }
                else if (yollet->qianJin == 1) {
                    a[i][j-1] = ' ';
                    yollet->qianJin--;
                }
            }
                break;
            case 's':
            {
                if (a[i+1][j] != '#') {
                    if (a[i][j] != '#') {
                        a[i][j] = ' ';
                    }
                    i++;
                    a[i][j] = '0';
                    
                    
                }
                else if (yollet->qianJin == 1) {
                    a[i+1][j] = ' ';
                    yollet->qianJin--;
                }
            }
                break;
            case 'd':
            {
                if (a[i][j+1] != '#') {
                    if (a[i][j] != '#') {
                        a[i][j] = ' ';
                    }
                    j++;
                    a[i][j] = '0';
                    
                }
                else if (yollet->qianJin == 1) {
                    a[i][j+1] = ' ';
                    yollet->qianJin--;
                }
            }
                break;
            case 'f':
            {
                ShiYongDaoJu(yollet);
            }
                break;
            case 't':
            {
                ChaKanZhuangBei(yollet->zhuangB);
            }
                break;
            case 'q':
            {
                ChaKanZhuangTai(yollet);
            }
                break;
                
                
            default:
                printf("不要乱走");
                break;
        }
        for (int i = 0; i < 10; i++) {
            printf("%s\n", a[i]);
        }
        
    }
    if (a[8][9] != '0') {
        printf("game over");
    }
    else {
        printf("走出迷宫喽!");
        printf("等级+1 攻击+5 生命+5 魔法+5 防御+5\n");
        yollet->dengji++;
        yollet->gongji += 5;
        yollet->xueliang = 35;
        yollet->mofa = 35;
        yollet->fangyu += 5;
        
    }

}
