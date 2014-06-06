//
//  PlayingCardGameViewController.m
//  CardGame
//
//  Created by Orion Chang on 6/7/14.
//  Copyright (c) 2014 Orion. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardGameViewController


- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
