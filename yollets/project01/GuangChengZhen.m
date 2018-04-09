//
//  GuangChengZhen.m
//  project01
//
//  Created by lanou on 15/11/30.
//  Copyright (c) 2015年 yollet. All rights reserved.
//

#import "GuangChengZhen.h"
#import "MyProject.h"

void GuangChengZhen(ZhuRG *yollet)
// 逛城镇
{
    char a[10][11] =
    {
        //0123456789
        {"########?#"},// 0
        {"  ########"},// 1
        {"#&######B#"},// 2
        {"# #&##&# #"},// 3
        {"#        #"},// 4
        {"# ###### #"},// 5
        {"# ######&#"},// 6
        {"# ######  "},// 7
        {"#Z###### #"},// 8
        {"##########"}// 9
    };
    a[1][1] = '0';
    int i = 1, j = 1;
    for (int i = 0; i < 10; i++) {
        printf("%s\n", a[i]);
    }
    char shuru = '0';
    int n1 = 0;
    int n2 = 0;
    int n3 = 0;
    int n4 = 0;
    printf("这是哪？w上 s下 a左 d右 f使用道具 q查看人物状态 t查看装备：\n");
    while (a[7][9] != '0' && yollet->xueliang > 0 && a[0][8] != 0) {
        
        
        if (a[2][1] == '0') {
            if (n1 == 0) {
            printf("你是远来的冒险者吗？这里是西峰镇，要成为我们的一员吗？\n");
                n1++;
            }
            else if (n1 == 1) {
                printf("嘿，我见过你，要留下来吗\n");
            }
            a[2][1] = '&';
            
        }
        if (a[6][8] == '0') {
            printf("听说东北有宝物\n");
            a[6][8] = '&';
        }
        if (a[0][8] == '0') {
            printf("发现宝藏！%s %s 挖了一会 挖出了%s 防御+5\n", yollet->touxiang, yollet->name, yollet->zhuangB->kuZi);
            yollet->zhuangB->kuZiData += 5;
            yollet->fangyu += yollet->zhuangB->kuZiData;
            printf("按s往下走 不然我也不知道你会去哪\n");
            a[0][8] = '#';
        }
        if (a[1][0] == '0') {
            printf("回不去了！\n");
            a[1][0] = ' ';
        }

        if (a[8][1] == '0') {
            if (n4 == 0) {
            yollet->wuP->xueYaoData++;
            printf("获得止血草(回复生命)\n");
            a[8][1] = ' ';
                n4++;
            }
        }
        if (a[3][3] == '0') {
            GouMaiWuPing(yollet);
            a[3][3] = '&';
        }
        if (a[3][6] == '0') {
            if (n2 == 0) {
            printf("左边是我哥哥，他那里能买药物\n");
                n2++;
                a[3][6] = '&';
            }
            else if (n2 == 1) {
                printf("我哥哥从来不打折\n");
                n2++;
                a[3][6] = '&';
            }
            else {
                printf("但我会打折\n");
                GouMaiWuPingDaZhe(yollet);
                a[3][6] = '#';
            }
            
        }
        if (a[2][8] == '0' && n3 == 0) {
            yollet->wuP->zhaDanData++;
            printf("获得炸弹(有什么用呢)\n");
            a[2][8] = ' ';
            n3++;
        }
        scanf("\n%c", &shuru);
        
        switch (shuru) {
                
            case 'w':
            {
                if (a[i-1][j] != '#') {
                    if (a[i][j] != '#' && a[i][j] != '&') {
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
                    if (a[i][j] != '#' && a[i][j] != '&') {
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
                    if (a[i][j] != '#' && a[i][j] != '&') {
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
                    if (a[i][j] != '#' && a[i][j] != '&') {
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
            case 't':
            {
                ChaKanZhuangBei(yollet->zhuangB);
            }
                break;
            case 'f':
            {
                ShiYongDaoJu(yollet);
            }
                break;
            case 'q':
            {
                ChaKanZhuangTai(yollet);
            }
                break;
                
                
            default:
                printf("不要乱走\n");
                break;
        }
        for (int i = 0; i < 10; i++) {
            printf("%s\n", a[i]);
        }
        
    }
    printf("未完待续\n");
    }

