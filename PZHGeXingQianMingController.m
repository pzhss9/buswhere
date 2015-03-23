//
//  PZHGeXingQianMingController.m
//  busComing
//
//  Created by apple on 14-11-1.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//

#import "PZHGeXingQianMingController.h"

@interface PZHGeXingQianMingController ()

@end

@implementation PZHGeXingQianMingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)editGeXingQianMing:(id)sender
{
    NSString *signature=self.geXingQianMing.text;
    NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:signature,@"qianming", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"GETGEXINGQIANMING"//消息名称
                                                       object:nil
                                                     userInfo:dic//参数，一般是字典类型
     ];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
