//
//  MMTileView.m
//  MMMemoryGame
//
//  Created by Kyle Mai on 9/28/13.
//  Copyright (c) 2013 Kyle Mai. All rights reserved.
//

#import "MMTileView.h"

@implementation MMTileView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [delegate tileTouched:self];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
