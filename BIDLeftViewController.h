//
//  BIDLeftViewController.h
//  busComing
//
//  Created by apple on 14-10-30.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDLeftViewController : UITableViewController
///头像
@property IBOutlet UIButton *photo;
///姓名
@property IBOutlet UILabel *name;
///个性签名
@property IBOutlet UILabel *gexingqianming;
///是否登入标识
@property BOOL isLogin;

@end
