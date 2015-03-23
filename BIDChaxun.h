//
//  BIDChaxun.h
//  busComing
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
@interface BIDChaxun : UITableViewController <UISearchBarDelegate>
@property NSArray * bus;
///目前所在的城市
@property NSString *city;
@property NSArray * data;
@property IBOutlet UIButton *cityButton;
//@property IBOutlet  BMKMapView *mapView;
@property IBOutlet UISearchBar *searchBar;
///点击了选择城市按钮
-(IBAction)selectCityButton :(id)sender;
//点击头像出现或者收回左视图
-(IBAction)tipHeadButton:(id)sender;
@end
