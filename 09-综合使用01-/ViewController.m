//
//  ViewController.m
//  09-综合使用01-
//
//  Created by xiaomage on 16/6/1.
//  Copyright © 2016年 赵恩峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopsView;
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shopsView.clipsToBounds = YES;

}
#pragma mark - 添加
- (IBAction)add {
    /**** 定义常用变量 ****/
    int maxCols = 3;
    // 商品的宽度
    CGFloat shopW = 70;
    // 商品的高度
    CGFloat shopH = 90;
    // 获取商品父控件的索引
    NSUInteger index  = self.shopsView.subviews.count;
    
    /*** 商品的X****/
    // 求出列号
    NSUInteger col = index % maxCols;
    // 求出水平方向的间距
    CGFloat xSpace = (self.shopsView.frame.size.width - maxCols * shopW) / (maxCols - 1);
    // 求出商品X
    CGFloat shopX = col * (shopW + xSpace);
    
    /*** 商品的Y ****/
    // 求出行号
    NSUInteger row = index / maxCols;
    // 垂直方向的间距
    CGFloat ySpace = 20;
    // 求出商品Y
    CGFloat shopY = row * (shopH + ySpace);
    
    /*** 创建商品父控件****/
    // 1.创建商品父控件
    UIView *shopView = [[UIView alloc] init];
    shopView.frame = CGRectMake(shopX, shopY, shopW, shopH);
    // 2.将商品父控件添加到shopsView
    [self.shopsView addSubview:shopView];
    
    // 3.添加图片
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.frame = CGRectMake(0, 0, shopW, shopW);
    iconImageView.image = [UIImage imageNamed:@"qianbao"];
    [shopView addSubview:iconImageView];
    
    // 4.添加文字
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(0, shopW, shopW, shopH - shopW);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = @"钱包";
    [shopView addSubview:nameLabel];
    
     /*** 控制按钮的状态****/
    self.removeBtn.enabled = YES;
    self.addBtn.enabled = self.shopsView.subviews.count < 6;
//    if (self.shopsView.subviews.count >= 6) {
//        self.addBtn.enabled = NO;
//    }
}

#pragma mark - 删除
- (IBAction)remove {
    [self.shopsView.subviews.lastObject removeFromSuperview];
    /*** 控制按钮的状态****/
    self.addBtn.enabled = YES;
    self.removeBtn.enabled = (self.shopsView.subviews.count > 0);
//    if (self.shopsView.subviews.count == 0) {
//        self.removeBtn.enabled = NO;
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
