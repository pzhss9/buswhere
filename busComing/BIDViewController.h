//
//  BIDViewController.h
//  pzha
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//
//#import "BIDMapView.h"
#import <UIKit/UIKit.h>
#import "BMapKit.h"
@interface BIDViewController : UIViewController <BMKCloudSearchDelegate,BMKMapViewDelegate>
@property NSString * BusName;
@property  IBOutlet  BMKMapView * mapview;
@property  NSDictionary *dictionary;
//@property  IBOutlet  BIDMapView * mapview;
@property   BMKCloudSearch * search;
-(IBAction)seach:(id)sender;
@end
