//
//  main.m
//  project01
//
//  Created by lanou on 15/11/28.
//  Copyright (c) 2015年 yollet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProject.h"

int main(int argc, const char * argv[]) {
    RpgGame();
    
    /*
    char *a[10] = {"零", "一", "二", "三", "四", "五", "六", "七", "八", "九"};
    int b;
    printf("请输入: \n");
    scanf("%d", &b);
    int c = 0;
    int d = b;
    while (d) {
        d /= 10;
        c++;
    }
    printf("结果: %d \n", c);
    
    char *num[c];
    for (int i = 0; i < c; i ++) {
        int q = b / pow(10, c - 1 - i);
        b = b - q * pow(10, c - 1 - i);
        num[i] = a[q];
    }
    
    for (int i = 0; i < c; i ++) {
        printf("%s", num[i]);
    }
    printf("\n");
    */
    
    return 0;
}
