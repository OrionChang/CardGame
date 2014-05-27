//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Orion Chang on 5/27/14.
//  Copyright (c) 2014 Orion. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        
        for (int i = 1; i <= count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }

        }
        
    }
    
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *cardAtIndex = self.cards[index];
    
    if (!cardAtIndex.isMatched) {
        if (cardAtIndex.isChosen) {
            cardAtIndex.chosen = false;
        } else {
            // Match other chosen cards
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [cardAtIndex match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        cardAtIndex.matched = true;
                        otherCard.matched = true;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = false;
                    }
                    
                    // Can only match 2 cards for now
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            cardAtIndex.chosen = true;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
