//
//  RCRDefinitionViewController.h
//  DiccionarioOnline
//
//  Created by Ramón Carnero Rojo on 16/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;
#import "RCRWordsTableViewController.h"

@interface RCRDefinitionViewController : UIViewController <UIWebViewDelegate, UISplitViewControllerDelegate, RCRWordsTableViewControllerDelegate>

@property (strong) IBOutlet UIWebView *browser;
@property (strong) IBOutlet UIActivityIndicatorView *activityView;
@property (copy) NSString *wordModel;

-(id) initWithModel:(NSString *) aModel;


@end
