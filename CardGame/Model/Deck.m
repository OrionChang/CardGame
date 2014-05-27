//
//  Deck.m
//  CardGame
//
//  Created by Orion Chang on 5/25/14.
//  Copyright (c) 2014 Orion. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
    
}

- (Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    if ([self.cards count]) {
        
        int cardIndex = arc4random() % [self.cards count];
        randomCard = self.cards[cardIndex];
        [self.cards removeObjectAtIndex:cardIndex];
        
    }
    
    return randomCard;
}

@end
