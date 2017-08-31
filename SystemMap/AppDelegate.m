//
//  AppDelegate.m
//  SystemMap
//
//  Created by 有限公司 深圳市 on 15/11/19.
//  Copyright © 2015年 SmaLife. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NEWViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) CLLocationManager *locaManager;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//     Override point for customization after application launch.
//    self.locaManager = [[CLLocationManager alloc] init];
//    self.locaManager.delegate = self;
//    
//    self.locaManager.desiredAccuracy = kCLLocationAccuracyBest; //控制定位精度,越高耗电量越大。
//    
//    self.locaManager.distanceFilter = 20; //控制定位服务更新频率。单位是“米”
//   
//    self.locaManager.pausesLocationUpdatesAutomatically = NO; //该模式是抵抗ios在后台杀死程序设置，iOS会根据当前手机使用状况会自动关闭某些应用程序的后台刷新，该语句申明不能够被暂停，但是不一定iOS系统在性能不佳的情况下强制结束应用刷新
//    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
//        self.locaManager.allowsBackgroundLocationUpdates = YES;
//        [self.locaManager requestAlwaysAuthorization];  //调用了这句,就会弹出允许框了.
//    }
//    [self.locaManager startUpdatingLocation];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[ViewController alloc] init];

    return YES;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation * currLocation = [locations lastObject];
    NSLog(@"---%@",[NSString stringWithFormat:@"%f",currLocation.coordinate.latitude]);
    
    NSLog(@"+++%@",[NSString stringWithFormat:@"%f",currLocation.coordinate.longitude]);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
