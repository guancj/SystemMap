//
//  ViewController.m
//  SystemMap
//
//  Created by 有限公司 深圳市 on 15/11/19.
//  Copyright © 2015年 SmaLife. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import <MapKit/MapKit.h>
#include <objc/runtime.h>
#import "PrayTime.h"
#define QUERY_PREFIX @"http://query.yahooapis.com/v1/public/yql?q="
#define QUERY_SUFFIX @"&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
@interface ViewController ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locaManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"我要更新1");
     NSLog(@"我要更新2");
    
//    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
//    
//    NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
//    
//    NSLog(@"apps: %@", [workspace performSelector:@selector(allApplications)]);
    
    // Do any additional setup after loading the view, typically from a nib.
//    MKMapView * mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
//    mapView.region=MKCoordinateRegionMake(CLLocationCoordinate2DMake(39.26, 116.3), MKCoordinateSpanMake(1, 1));
//    mapView.userTrackingMode = YES;
//    [self.view addSubview:mapView];
//    MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect);
   // https://api.thinkpage.cn/v3/weather/now.json?key=ntlttxmitdrkby61&location=beijing&language=zh-Hans&unit=c
    self.locaManager = [[CLLocationManager alloc] init];
    self.locaManager.delegate = self;
    
    self.locaManager.desiredAccuracy = kCLLocationAccuracyBest; //控制定位精度,越高耗电量越大。
    
    self.locaManager.distanceFilter = 20; //控制定位服务更新频率。单位是“米”
    [self.locaManager requestAlwaysAuthorization];  //调用了这句,就会弹出允许框了.
    [self.locaManager requestWhenInUseAuthorization];
    self.locaManager.pausesLocationUpdatesAutomatically = NO; //该模式是抵抗ios在后台杀死程序设置，iOS会根据当前手机使用状况会自动关闭某些应用程序的后台刷新，该语句申明不能够被暂停，但是不一定iOS系统在性能不佳的情况下强制结束应用刷新kCLAuthorizationStatusAuthorizedAlways
    //    [CLLocationManager authorizationStatus] = kCLAuthorizationStatusAuthorizedAlways;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        self.locaManager.allowsBackgroundLocationUpdates = YES;
    }
      [self.locaManager startUpdatingLocation];
}
static NSString *locaStr;
static NSString *latitude;
static NSString *longitude;
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation * currLocation = [locations lastObject];
//    [self coordinates:currLocation];
    NSLog(@"---%@",[NSString stringWithFormat:@"%f",currLocation.coordinate.latitude]);
    
    NSLog(@"+++%@",[NSString stringWithFormat:@"%f",currLocation.coordinate.longitude]);
     latitude =[NSString stringWithFormat:@"%f",currLocation.coordinate.latitude];
    longitude =[NSString stringWithFormat:@"%f",currLocation.coordinate.longitude];
    locaStr = [NSString stringWithFormat:@"%f:%f",currLocation.coordinate.latitude,currLocation.coordinate.longitude];
    //    textview.text = [NSString stringWithFormat:@"%f  %f",currLocation.coordinate.latitude, currLocation.coordinate.longitude];
    PrayTime *prayTime = [[PrayTime alloc] init];
    NSLog(@"fewfwefwefwfw===%f  %f  %f",[prayTime getTimeZone],[prayTime getBaseTimeZone],[prayTime detectDaylightSaving]);
    double zone = [prayTime getTimeZone];
//    [prayTime setCalcMethod:3];// 为穆斯林朝拜时间 51.0201353,7.93319
    [prayTime setCustomParams:[prayTime.methodParams objectForKey:[NSNumber numberWithInt: 3]]];// 为穆斯林朝拜时间
//    NSLog(@"wfkffowfiwe===%@",[prayTime getDatePrayerTimes:2016 andMonth:9 andDay:28 andLatitude:currLocation.coordinate.latitude andLongitude:currLocation.coordinate.longitude andtimeZone:zone]);
    NSLog(@"wfkffowfiwe===%@",[prayTime getDatePrayerTimes:2016 andMonth:9 andDay:28 andLatitude:41.3947688 andLongitude:2.078728 andtimeZone:zone]);

    NSLog(@"wfewfiriir==%@",[prayTime computeDayTimes]);
}

- (IBAction)selector:(id)sender{
//    NSDictionary *parameters = @{@"device_num":@"1",@"device_list":@[@{@"id":@"gh_16e81fe35a4c_4d7a95d27d361cc0",@"mac":@"123456789ABC",@"connect_protocol":@"3",@"auth_key":@"1234567890ABCDEF1234567890ABCDEF",@"close_strategy":@"1",@"conn_strategy":@"1",@"crypt_method":@"1",@"auth_ver":@"1",@"manu_mac_pos":@"-1",@"ser_mac_pos":@"-2",@"ble_simple_protocol":@"1"}],@"op_type":@"1"};
//
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    [manager GET:@"https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wxf71013eb5678c378&secret=04d04762ffde3117b823f9aa53b6ee72" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString *tocken = [responseObject objectForKey:@"access_token"];
//        NSLog(@" %@ responseObject=%@",tocken,responseObject);
//        
//        [manager POST:[NSString stringWithFormat:@"https://api.weixin.qq.com/device/getqrcode?access_token=%@&product_id=5275",tocken] parameters:parameters
//         
//              success:^(AFHTTPRequestOperation *operation,id responseObject) {
//                  NSString *succe = [[responseObject objectForKey:@"base_resp"] objectForKey:@"errmsg"];
//                  NSLog(@"Success: %@   %@", responseObject,succe);
//                  
//              }failure:^(AFHTTPRequestOperation *operation,NSError *error) {
//                  //
//                  NSLog(@"Error: %@", error);
//                  //
//              }];
//
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"error = %@",error);
//    }];
    
    /******************************************天气***************************************************/
//@"id":@"dev1",@"mac":@"123456789ABC",@"connect_protocol":@"3" ,
//    NSDictionary *d = @{@"device_list":@[@{@"id":@"dev1"},@{@"mac":@"123456789ABC"},@{@"connect_protocol":@"3"},@{@"auth_key":@""},@{@"close_strategy":@"1"},@{@"conn_strategy":@"1"},@{@"crypt_method":@"0"},@{@"auth_ver":@"1"},@{@"auth_ver":@"-1"},@{@"ser_mac_pos":@"-2"},@{@"ble_simple_protocol":@"0"}]};
//       NSLog(@"efwef==%@",parameters);
//   NSDictionary *parameters = [NSDictionary dictionary];

   //    api.openweathermap.org/data/2.5/weather?lat=35&lon=139 25.5838016,113.7212301
//    locaStr = @"47.6870112:115.4076315";
//    [manager GET:[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=25.5838016&lon=113.7212301&APPID=2dd31498a79e5f34c57b82565aa7d561"] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//          NSLog(@"Success: %@", responseObject);
//        [self parsingWatcherData:responseObject];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
    
//     NSDictionary *results = [self query:@"SELECT * FROM weather.forecast WHERE woeid=2502265"];
//    NSLog(@"+++++%@",[[results valueForKeyPath:@"query.results"] description]);
  
    
    /*************************************食物API******************************************************/
    //https://developer.nutritionix.com/docs/v1_1  dfc68413  8830b6bae9185990e08534a06b0c4194
   // NSLog(@"Nutritionix API call:  %@", [apiIUrl stringByAppendingFormat:@"item?upc=%@&appId=%@&appKey=%@", upc, appId, appKey]);
    
    NSDictionary *parameters1 = @{@"appId":@"dfc68413",@"appKey":@"8830b6bae9185990e08534a06b0c4194",@"query":@"Starbucks OR Frappuccino*"};
    NSString *apiIUrl = @"https://developer.nutritionix.com/docs/v1_1";
    NSString *scanUrl = [apiIUrl stringByAppendingFormat:@"item?upc=%@&appId=%@&appKey=%@", @"StarbucksORFrappuccino*", @"dfc68413", @"8830b6bae9185990e08534a06b0c4194"];
//    id response;
   AFHTTPRequestOperationManager *manager1 = [AFHTTPRequestOperationManager manager];
    [manager1 GET:@"https://api.nutritionix.com/v1_1/item?upc=49000036756&appId=dfc68413&appKey=8830b6bae9185990e08534a06b0c4194" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
//         response = responseObject;
         
         NSMutableDictionary *jsonDictionary = (NSMutableDictionary *)responseObject;
         
         NSMutableArray *data = [[NSMutableArray alloc] init];
         
//         [data addObject:upc];
         [data addObject:jsonDictionary];
         
     }
     
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
//         response = nil;
         
         NSLog(@">>>  Nutritionix API call error:  %@", error);
     }
     ];

}

- (NSDictionary *) query: (NSString *)statement {
    NSString *query = [NSString stringWithFormat:@"%@%@%@", QUERY_PREFIX, [statement stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding], QUERY_SUFFIX];
    
    NSData *jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:query] encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error] : nil;
    
    if (error) NSLog(@"[%@ %@] JSON error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), error.localizedDescription);
    
    return results;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)parsingWatcherData:(id)operation{
    NSDictionary *watchDic = [operation objectForKey:@"results"][0];
    NSString *date = watchDic[@"last_update"];
    NSDictionary *location = watchDic[@"location"];
    for (NSString *key in location) {
        NSString *value = [location objectForKey:key];
        NSLog(@"w0ewfe==%@",value);
    }

    NSDictionary *now = watchDic[@"now"];
    for (NSString *key in now) {
        NSString *value = [now objectForKey:key];
         NSLog(@"w0ewf11e==%@",value);
    }
}
@end
