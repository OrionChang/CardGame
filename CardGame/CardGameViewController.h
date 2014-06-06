//
//  CardGameViewController.h
//  CardGame
//
//  Created by Orion Chang on 5/25/14.
//  Copyright (c) 2014 Orion. All rights reserved.
//
// Abstract class. Must implement methods as described below.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

// protected
// for subclasses
- (Deck *)createDeck; // abstract

@end
