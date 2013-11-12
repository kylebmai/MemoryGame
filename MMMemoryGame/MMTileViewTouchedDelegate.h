//
//  MMTileViewTouchedDelegate.h
//  MMMemoryGame
//
//  Created by Kyle Mai on 9/28/13.
//  Copyright (c) 2013 Kyle Mai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMTileView.h"

@protocol MMTileViewTouchedDelegate <NSObject>

- (void)tileTouched:(id)tileView;

@end
