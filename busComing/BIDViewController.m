//
//  BIDViewController.m
//  pzha
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController

- (void)viewDidLoad
{//30.2559717801 119.7290361039
    [super viewDidLoad];
    //模拟数据
    BMKCoordinateRegion region;
    
    region.center.latitude  = 30.2559717801;
    
    region.center.longitude = 119.7290361039;
    
    self.mapview.region=region;
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = 30.2559717801;
    coor.longitude = 119.7290361039;
    annotation.coordinate = coor;
    annotation.title = @"这里是北京";
    [_mapview addAnnotation:annotation];
    
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)loadData
{
    NSArray *data= [self.dictionary objectForKey:self.BusName];
    NSArray* array = [NSArray arrayWithArray:_mapview.annotations];
    [self.mapview removeAnnotations:array];
    for (int i = 0; i < data.count; i++)
    {
        BMKCloudPOIInfo* poi = [data objectAtIndex:i];
        BMKPointAnnotation* item = [[BMKPointAnnotation alloc] init];
        CLLocationCoordinate2D pt = (CLLocationCoordinate2D){ poi.longitude,poi.latitude};
        item.coordinate = pt;
        item.title = poi.title;
        if (self.mapview!=nil)
        {
            NSLog(@"ok");
        }
        [self.mapview addAnnotation:item];
        // [item release];
    }
}


-(IBAction)onClickLocalSearch{
    BMKCloudLocalSearchInfo *cloudLocalSearch = [[BMKCloudLocalSearchInfo alloc] init];
    /*
     * 本示例代码使用了测试ak和测试数据，开发者在检索自己LBS数据之前，需替换 cloudLocalSearch.ak
     * 和cloudLocalSearch.geoTableId的值
     *
     * 1、替换cloudLocalSearch.ak的值：
     * （1）请访问http://lbsyun.baidu.com/apiconsole/key申请一个“服务端”的ak，其他类型的ak无效；
     * （2）将申请的ak替换cloudLocalSearch.ak的值；
     *
     * 2、替换cloudLocalSearch.geoTableId值：
     * （1）申请完服务端ak后访问http://lbsyun.baidu.com/datamanager/datamanage创建一张表；
     * （2）在“表名称”处自由填写表的名称，如MyData，点击保存；
     * （3）“创建”按钮右方将会出现形如“MyData(34195)”字样，其中的“34195”即为geoTableId的值；
     * （4）添加或修改字段：点击“字段”标签修改和添加字段，然后保存；
     * （5）添加数据：
     *  a、标注模式：“数据” ->“标注模式”，输入要添加的地址然后“百度一下”，点击地图蓝色图标，再点击保存即可；
     *  b、批量模式： “数据” ->“批量模式”，可上传文件导入，具体文件格式要求请参见当页的“批量导入指南”；
     * （6）选择左边“设置”标签，“是否发布到检索”选择“是”，然后"保存";
     * （7）数据发布后，替换cloudLocalSearch.geoTableId的值即可；
     
     * 备注：每创建一张新表后需要选择发布到检索并保存，否则将会出现检索不到数据的情况
     */
    cloudLocalSearch.ak = @"YqG5U0IswFg9RZAqw8vXexim";
    cloudLocalSearch.geoTableId = 77701;
    cloudLocalSearch.pageIndex = 0;
    cloudLocalSearch.pageSize = 10;
    
    cloudLocalSearch.region = @"北京市";
    cloudLocalSearch.keyword = @"天安门";
    BOOL flag = [_search localSearchWithSearchInfo:cloudLocalSearch];
    //[cloudLocalSearch release];
    if(flag){
        NSLog(@"本地云检索发送成功");
    }else{
        NSLog(@"本地云检索发送失败");
    }
}
- (void)onGetCloudPoiResult:(NSArray*)poiResultList searchType:(int)type errorCode:(int)error{
    // 清楚屏幕中所有的annotation
    NSArray* array = [NSArray arrayWithArray:_mapview.annotations];
    [_mapview removeAnnotations:array];
    if (error == BMKErrorOk) {
        BMKCloudPOIList* result = [poiResultList objectAtIndex:0];
        for (int i = 0; i < result.POIs.count; i++) {
            BMKCloudPOIInfo* poi = [result.POIs objectAtIndex:i];
            BMKPointAnnotation* item = [[BMKPointAnnotation alloc] init];
            CLLocationCoordinate2D pt = (CLLocationCoordinate2D){ poi.longitude,poi.latitude};
            item.coordinate = pt;
            item.title = poi.title;
            if (self.mapview!=nil) {
                NSLog(@"ok");
            }
            [self.mapview addAnnotation:item];
            // [item release];
        }
    } else {
        NSLog(@"error ==%d",error);
    }
}
/*- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
 {
 if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
 BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
 newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
 newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
 return newAnnotationView;
 }
 return nil;
 }
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
