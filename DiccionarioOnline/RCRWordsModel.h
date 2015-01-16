//
//  RCRWordsModel.h
//  DiccionarioOnline
//
//  Created by Ramón Carnero Rojo on 16/1/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCRWordsModel : NSObject

@property NSDictionary *words;

-(NSArray *) letters;
-(NSString *) letterAtIndex: (NSInteger) aLetterIndex;
-(NSString *) wordAtIndex:(NSInteger) aWordIndex inLetterAtIndex:(NSInteger) aLetterIndex;
-(NSArray *) wordsAtIndex:(NSInteger) anIndex;

@end
