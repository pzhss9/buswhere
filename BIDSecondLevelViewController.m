//
//  BIDSecondLevelViewController.m
//  busComing
//
//  Created by apple on 14-9-13.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//
#import "BIDSecondLevelViewController.h"
#import "BIDPointAnnotationForBusStop.h"
@interface BIDSecondLevelViewController ()

@end

@implementation BIDSecondLevelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.navigationController.navigationBar.translucent = NO;
    }
    self.mapView.delegate=self;
    self.navigationItem.title=[[NSString alloc]initWithFormat:@"%@ 位置图",self.BusName];
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
  
    [self.mapView setMapType:BMKMapTypeStandard];
    BMKCoordinateRegion region;
    region.center.latitude  = 30.3569717901;
    region.center.longitude = 119.7390362039;
    self.mapView.region=region;
    
    [self getBusData];
    [self getBusLine];
    [self getBusStopData];
    [self loadData];
   // [self reloadData];
   
  
}
//获得公交车站信息
-(void)getBusStopData
{
    BMKCloudPOIInfo* poi= [[BMKCloudPOIInfo alloc]init];
poi.latitude=30.257238;poi.longitude=119.733629;
    poi.title=@"公交车站";
    NSArray * data =@[poi];
    [self.dictionary setObject:data forKey:@"busstop"];
}
//获得公交车信息
-(void)getBusData
{
    BMKCloudPOIInfo* poi= [[BMKCloudPOIInfo alloc]init];
    BMKCloudPOIInfo* poi2= [[BMKCloudPOIInfo alloc]init];
    BMKCloudPOIInfo* poi3= [[BMKCloudPOIInfo alloc]init];
    BMKCloudPOIInfo* poi4= [[BMKCloudPOIInfo alloc]init];
    poi.latitude=30.257238;poi.longitude=119.732629;
    poi2.latitude=30.248659;poi2.longitude=119.737229;
    poi3.latitude=30.245539;poi3.longitude=119.736546;
    poi4.latitude=30.240516;poi4.longitude=119.738127;
    poi.title=@"方向：xxx->xxxx \n预计还有xxx分钟";
    poi2.title=@"方向：xxx->xxxx \n预计还有xxx分钟";
    poi3.title=@"方向：xxx->xxxx \n预计还有xxx分钟";
    poi4.title=@"方向：xxx->xxxx \n预计还有xxx分钟";
    //模拟数据
   
    
    NSArray * data =@[poi,poi2,poi3,poi4];
    self.dictionary = [ [NSMutableDictionary alloc] initWithObjectsAndKeys:data,self.BusName, nil];
}

-(void)getBusLine
{
    CLLocationCoordinate2D coors[6] = {0};
    coors[0].latitude = 30.261262;
    coors[0].longitude = 119.730725	;
    coors[1].latitude = 30.257238;
    coors[1].longitude = 119.732629;
    coors[2].latitude = 30.248659;
    coors[2].longitude = 119.737229;
    coors[3].latitude = 30.245539;
    coors[3].longitude = 119.736546;
    coors[4].latitude = 30.240516;
    coors[4].longitude = 119.738127	;
    coors[5].latitude = 30.237521;
    coors[5].longitude = 119.737912;
    self.polyline =[BMKPolyline polylineWithCoordinates:coors count:6];
     [_mapView addOverlay:_polyline];
    
}
/*- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
        NSLog(@"heading is %@",userLocation.heading);
}*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
        NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
}*/
-(void)cleanPoi//清除地图上的标注（大头针）
{
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
}
-(void)loadData
{
    
    
    [self cleanPoi];
    NSArray *data= [self.dictionary objectForKey:self.BusName];
    for(int i=0;i<[data count];i++)
    {
           BMKCloudPOIInfo* poi = [data objectAtIndex:i];
    
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
        
    CLLocationCoordinate2D coor;
    coor.latitude = poi.latitude;
    coor.longitude = poi.longitude;
    annotation.coordinate = coor;
    annotation.title = poi.title;
        
        
        if(i==0)
        {
            _mapView.zoomLevel=16;
            BMKCoordinateRegion region;
            
            region.center.latitude  = poi.latitude;
            
            region.center.longitude = poi.longitude;
            
            self.mapView.region=region;
            
        }

     [self.mapView addAnnotation:annotation];
    }
    data= [self.dictionary objectForKey:@"busstop"];
    for(int i=0;i<[data count];i++)
    {
        BMKCloudPOIInfo* poi = [data objectAtIndex:i];
        
        BIDPointAnnotationForBusStop* annotation = [[BIDPointAnnotationForBusStop alloc]init];
        
        CLLocationCoordinate2D coor;
        coor.latitude = poi.latitude;
        coor.longitude = poi.longitude;
        annotation.coordinate = coor;
        annotation.title = poi.title;
        
        
        [self.mapView addAnnotation:annotation];
    }

    
  
}
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id )annotation
{
    if ([annotation isKindOfClass:[BIDPointAnnotationForBusStop class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = NO;// 设置该标注点动画显示
        
		
        newAnnotationView.image = [UIImage imageNamed:@"busStop.png"];   //把大头针换成别的图片
        return newAnnotationView;
    }

   else if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = NO;// 设置该标注点动画显示
       
		
        newAnnotationView.image = [UIImage imageNamed:@"icon_nav_bus2.png"];   //把大头针换成别的图片
        return newAnnotationView;
    }
    return nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)reloadData
{
    //模拟数据
    BMKCloudPOIInfo* poi= [[BMKCloudPOIInfo alloc]init];
    BMKCloudPOIInfo* poi2= [[BMKCloudPOIInfo alloc]init];
    BMKCloudPOIInfo* poi3= [[BMKCloudPOIInfo alloc]init];
    BMKCloudPOIInfo* poi4= [[BMKCloudPOIInfo alloc]init];
    poi.latitude=30.248659;poi.longitude=119.737229;
    poi2.latitude=30.245539;poi2.longitude=119.736546;
    poi3.latitude=30.240516;poi3.longitude=119.738127;
    poi4.latitude=30.237521;poi4.longitude=119.737912;
    poi.title=@"方向：xxx->xxxx\n 预计还有xxx分钟";
    poi2.title=@"方向：xxx->xxxx\n 预计还有xxx分钟";
    poi3.title=@"方向：xxx->xxxx \n预计还有xxx分钟";
    poi4.title=@"方向：xxx->xxxx\n 预计还有xxx分钟";
    //模拟数据

    
     NSArray * data =@[poi,poi2,poi3,poi4];
      self.dictionary = [ [NSMutableDictionary alloc] initWithObjectsAndKeys:data,self.BusName, nil];
     [self loadData];
}
-(IBAction)startLocation:(id)sender
{
    if (self.stateType==tingzhizhaungtai) {
        NSLog(@"进入跟随定位态");
        [_locService startUserLocationService];
        _mapView.showsUserLocation = NO;//先关闭显示的定位图层
        _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
        _mapView.showsUserLocation = YES;//显示定位图层
        self.stateType=gensuizhaungtai;
        [self.stateButton setTitle:@"停止显示" forState:UIControlStateNormal];
        
        
    }
    else if(self.stateType==gensuizhaungtai)
    {
     [_locService stopUserLocationService];
        self.stateType=tingzhizhaungtai;
        //_mapView.showsUserLocation = NO;
         [self.stateButton setTitle:@"显示我的位置" forState:UIControlStateNormal];
    }
    
}
/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)mapViewWillStartLocatingUser:(BMKMapView *)mapView
{
	NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
        NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
   
    
    
  
    
    [_mapView updateLocationData:userLocation];
     
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)mapViewDidStopLocatingUser:(BMKMapView *)mapView
{
    NSLog(@"stop locate");
}
-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    self.stateType = tingzhizhaungtai;
    self.isFirstTn=NO;
}
-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    self.isFirstTn=NO;
    self.stateType = tingzhizhaungtai;
}
//根据overlay生成对应的View
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay
{
	if ([overlay isKindOfClass:[BMKCircle class]])//圆
    {
        BMKCircleView* circleView = [[BMKCircleView alloc] initWithOverlay:overlay] ;
        circleView.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
        circleView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        circleView.lineWidth = 5.0;
		return circleView;
    }
    
    if ([overlay isKindOfClass:[BMKPolyline class]])//折线
    {
        BMKPolylineView* polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay] ;
        polylineView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:1];
        polylineView.lineWidth = 3.0;
		return polylineView;
    }
	
	if ([overlay isKindOfClass:[BMKPolygon class]])//多边形
    {
        BMKPolygonView* polygonView = [[BMKPolygonView alloc] initWithOverlay:overlay] ;
        polygonView.strokeColor = [[UIColor purpleColor] colorWithAlphaComponent:1];
        polygonView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.2];
        polygonView.lineWidth =2.0;
		return polygonView;
    }
    if ([overlay isKindOfClass:[BMKGroundOverlay class]])//图片
    {
        BMKGroundOverlayView* groundView = [[BMKGroundOverlayView alloc] initWithOverlay:overlay] ;
		return groundView;
    }
	return nil;
}


@end
