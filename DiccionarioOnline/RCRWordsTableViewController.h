//
//  RCRWordsTableViewController.h
//  DiccionarioOnline
//
//  Created by Ramón Carnero Rojo on 16/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;
#import "RCRWordsModel.h"
@class RCRWordsTableViewController;

@protocol RCRWordsTableViewControllerDelegate <NSObject>

@optional

-(void)wordsTableViewController:(RCRWordsTableViewController*)wVC
                   didWord:(NSString*) word;

@end

@interface RCRWordsTableViewController : UITableViewController<RCRWordsTableViewControllerDelegate>

@property (strong) RCRWordsModel* wordsModel;
// Las propiedades de delegate son siempre weak
@property (weak,nonatomic) id <RCRWordsTableViewControllerDelegate> delegate;

-(id) initWithModel: (RCRWordsModel *) aModel;


@end
