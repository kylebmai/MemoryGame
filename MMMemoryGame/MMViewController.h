//
//  MMViewController.h
//  MMMemoryGame
//
//  Created by Kyle Mai on 9/26/13.
//  Copyright (c) 2013 Kyle Mai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMTileView.h"
#import "MMTileViewTouchedDelegate.h"
#import "MMTileImageView.h"

@interface MMViewController : UIViewController <MMTileViewTouchedDelegate, UIAlertViewDelegate>

@end
