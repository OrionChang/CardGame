//
//  PlayingCard.m
//  CardGame
//
//  Created by Orion Chang on 5/25/14.
//  Copyright (c) 2014 Orion. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

static const int MATCH_SUIT_SCORE = 1;
static const int MATCH_RANK_SCORE = 4;

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    // Can only match 2 cards for now
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = MATCH_RANK_SCORE;
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score = MATCH_SUIT_SCORE;
        }
    }
    
    return score;
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard validRankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♣️",@"♦️",@"♠️",@"♥️"];
}

+ (NSArray *)validRankStrings
{
    return @[@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (int)maxRank
{
    return [[self validRankStrings] count] - 1;
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}



@end
