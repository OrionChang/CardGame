//
//  Card.h
//  CardGame
//
//  Created by Orion Chang on 5/25/14.
//  Copyright (c) 2014 Orion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;



- (int)match:(NSArray *)otherCards;

@end
