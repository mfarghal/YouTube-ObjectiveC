//
//  AppDelegate.m
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 6/30/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeController.h"
#import "Extension-UIColor.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    UICollectionViewFlowLayout *lay = [[UICollectionViewFlowLayout alloc] init];
    UICollectionViewController *collectionView = [[HomeController alloc] initWithCollectionViewLayout:lay];
    
    UINavigationController *naviController = [[UINavigationController alloc]initWithRootViewController:collectionView];
    
    [self.window setRootViewController:naviController];
    
    
    [[naviController navigationBar] setBarTintColor:[UIColor ExactRGBWithRed:230 Green:32 Blue:32]];
    
    
    //This Section For delete Shadow come with NavigationBar
    [[naviController navigationBar] setShadowImage:[[UIImage alloc]init]];
    [[naviController navigationBar] setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
    
     application.statusBarStyle = UIStatusBarStyleLightContent;
    
    
    [[naviController navigationBar] setTranslucent:NO];
    

    
    UIView *statusBarBackground = [[UIView alloc]init];
    [statusBarBackground setBackgroundColor:[UIColor ExactRGBWithRed:190 Green:32 Blue:32]];
    [self.window addSubview:statusBarBackground];
    
    
    /*
     Must add to info.plist
      controller-based status bar appearance = NO
     */
    
    statusBarBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [self.window addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[statusBarBackground]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(statusBarBackground)]];
    [self.window addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[statusBarBackground(==20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(statusBarBackground)]];
    [self.window setNeedsUpdateConstraints];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
