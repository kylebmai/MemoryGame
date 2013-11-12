//
//  MMTileView.h
//  MMMemoryGame
//
//  Created by Kyle Mai on 9/28/13.
//  Copyright (c) 2013 Kyle Mai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMTileViewTouchedDelegate.h"

@interface MMTileView : UIView
{
    id <MMTileViewTouchedDelegate> delegate;
}

@property (strong, nonatomic) id <MMTileViewTouchedDelegate> delegate;

@end
