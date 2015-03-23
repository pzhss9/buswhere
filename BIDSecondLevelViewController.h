//
//  BIDSecondLevelViewController.h
//  busComing
//
//  Created by apple on 14-9-13.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
#define gensuizhaungtai 1
#define tingzhizhaungtai 2
//#import "BIDMapView.h"
@interface BIDSecondLevelViewController : UIViewController <BMKCloudSearchDelegate,BMKMapViewDelegate,BMKLocationServiceDelegate>
@property NSString * BusName;

@property  NSMutableDictionary *dictionary;//装资料，
@property IBOutlet  BMKMapView *mapView;
@property BMKLocationService *locService ;
@property int stateType;
@property IBOutlet UIButton *stateButton;
@property BOOL isFirstTn;
@property BMKPolyline* polyline;
//@property  IBOutlet  BIDMapView * mapview;
//@property   BMKCloudSearch * search;
-(IBAction)seach:(id)sender;
-(IBAction) reloadData;
-(void)cleanPoi;

@end
