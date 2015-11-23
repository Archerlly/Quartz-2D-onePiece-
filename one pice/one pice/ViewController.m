//
//  ViewController.m
//  one pice
//
//  Created by 阿城 on 15/10/9.
//  Copyright © 2015年 阿城. All rights reserved.
//

#import "ViewController.h"
#import "OnePiceVIew.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    OnePiceVIew *view = [[OnePiceVIew alloc]initWithFrame:CGRectMake(100, 50, 300, 300)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
