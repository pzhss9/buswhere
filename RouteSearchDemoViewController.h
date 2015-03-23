//
//  RouteSearchDemoViewController.h
//  BaiduMapApiDemo
//
//  Copyright 2011 Baidu Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface RouteSearchDemoViewController : UIViewController<BMKMapViewDelegate, BMKRouteSearchDelegate> {
@protected	IBOutlet BMKMapView* _mapView;
@protected	IBOutlet UITextField* _startCityText;
@protected	IBOutlet UITextField* _startAddrText;
@protected	IBOutlet UITextField* _endCityText;
@protected	IBOutlet UITextField* _endAddrText;
@protected  IBOutlet UIActivityIndicatorView *activityIndicatorView;
@protected IBOutlet UIButton *searchButton;
    BMKRouteSearch* _routesearch;
}

-(IBAction)onClickBusSearch;
-(IBAction)onClickDriveSearch;
-(IBAction)onClickWalkSearch;
-(IBAction)textFiledReturnEditing:(id)sender;

@end
