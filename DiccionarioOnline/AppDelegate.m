//
//  AppDelegate.m
//  DiccionarioOnline
//
//  Created by Ramón Carnero Rojo on 16/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "AppDelegate.h"
#import "RCRWordsModel.h"
#import "RCRWordsTableViewController.h"
#import "RCRDefinitionViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    //Compruebo el tipo de pantalla
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        //tableta
        [self configureForPad];
    }else{
        [self configureForPhone];
    }
 
    [self.window makeKeyAndVisible];
    return YES;
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

#pragma mark - Configuration

-(void)configureForPad{
    
    //Creamos el modelo
    RCRWordsModel *wordsModel = [[RCRWordsModel alloc] init];
    
    //Creamos los controladores
    RCRWordsTableViewController *tVC = [[RCRWordsTableViewController alloc] initWithModel:wordsModel];
    RCRDefinitionViewController *dVC = [[RCRDefinitionViewController alloc] initWithModel:@"Starship"];
    
    //Creamos los combinadores
    UINavigationController *tableNav = [[UINavigationController alloc]init];
    [tableNav pushViewController:tVC animated:NO];
    
    UINavigationController *definitionNav = [[UINavigationController alloc]init];
    [definitionNav pushViewController:dVC animated:NO];
    
    UISplitViewController *splitVC = [[UISplitViewController alloc]init];
    [splitVC setViewControllers:@[tableNav,definitionNav]];
    
    //Asignamos delegados
    splitVC.delegate = dVC;
    tVC.delegate = dVC;
    
    //Lo asignamos como root
    [self.window setRootViewController:splitVC];
}

-(void)configureForPhone{
    
    //Creamos el modelo
    RCRWordsModel *wordsModel = [[RCRWordsModel alloc] init];
    
    //Creamos los controladores
    RCRWordsTableViewController *tVC = [[RCRWordsTableViewController alloc] initWithModel:wordsModel];
    
    //Creamos los combinadores
    UINavigationController *tableNav = [[UINavigationController alloc]init];
    [tableNav pushViewController:tVC animated:NO];
    
    //Asignamos delegados
    tVC.delegate = tVC;
    
    //Lo asignamos como root
    [self.window setRootViewController:tableNav];
}

@end
