//
//  MMViewController.m
//  MMMemoryGame
//
//  Created by Kyle Mai on 9/26/13.
//  Copyright (c) 2013 Kyle Mai. All rights reserved.
//

#import "MMViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>


#define CenterPoint1 CGPointMake(41.50, 137.50)
#define CenterPoint2 CGPointMake(120.50, 137.50)
#define CenterPoint3 CGPointMake(199.50, 137.50)
#define CenterPoint4 CGPointMake(278.50, 137.50)
#define CenterPoint5 CGPointMake(41.50, 216.50)
#define CenterPoint6 CGPointMake(120.50, 216.50)
#define CenterPoint7 CGPointMake(199.50, 216.50)
#define CenterPoint8 CGPointMake(278.50, 216.50)
#define CenterPoint9 CGPointMake(41.50, 295.50)
#define CenterPoint10 CGPointMake(120.50, 295.50)
#define CenterPoint11 CGPointMake(199.50, 295.50)
#define CenterPoint12 CGPointMake(278.50, 295.50)
#define CenterPoint13 CGPointMake(41.50, 374.50)
#define CenterPoint14 CGPointMake(120.50, 374.50)
#define CenterPoint15 CGPointMake(199.50, 374.50)
#define CenterPoint16 CGPointMake(278.50, 374.50)
#define CenterPoint17 CGPointMake(41.50, 453.50)
#define CenterPoint18 CGPointMake(120.50, 453.50)
#define CenterPoint19 CGPointMake(199.50, 453.50)
#define CenterPoint20 CGPointMake(278.50, 453.50)

#define frame1  CGRectMake(4.00, 100.00, 75.00, 75.00)
#define frame2  CGRectMake(83.00, 100.00, 75.00, 75.00)
#define frame3  CGRectMake(162.00, 100.00, 75.00, 75.00)
#define frame4  CGRectMake(241.00, 100.00, 75.00, 75.00)
#define frame5  CGRectMake(4.00, 179.00, 75.00, 75.00)
#define frame6  CGRectMake(83.00, 179.00, 75.00, 75.00)
#define frame7  CGRectMake(162.00, 179.00, 75.00, 75.00)
#define frame8  CGRectMake(241.00, 179.00, 75.00, 75.00)
#define frame9  CGRectMake(4.00, 258.00, 75.00, 75.00)
#define frame10 CGRectMake(83.00, 258.00, 75.00, 75.00)
#define frame11 CGRectMake(162.00, 258.00, 75.00, 75.00)
#define frame12 CGRectMake(241.00, 258.00, 75.00, 75.00)
#define frame13 CGRectMake(4.00, 337.00, 75.00, 75.00)
#define frame14 CGRectMake(83.00, 337.00, 75.00, 75.00)
#define frame15 CGRectMake(162.00, 337.00, 75.00, 75.00)
#define frame16 CGRectMake(241.00, 337.00, 75.00, 75.00)
#define frame17 CGRectMake(4.00, 416.00, 75.00, 75.00)
#define frame18 CGRectMake(83.00, 416.00, 75.00, 75.00)
#define frame19 CGRectMake(162.00, 416.00, 75.00, 75.00)
#define frame20 CGRectMake(241.00, 416.00, 75.00, 75.00)

@interface MMViewController ()
{
    NSMutableArray *tagArray;
    MMTileView *view;
    UIView *firstTileView;
    UIImageView *firstTileImageView;
    NSTimer *timer;
    int loopTime;
    int matchCount;
    int missedCount;
    int timeCounter;
}
@property (weak, nonatomic) IBOutlet UIButton *pauseResumeButton;
@property (weak, nonatomic) IBOutlet UILabel *missedLabel;
@property (weak, nonatomic) IBOutlet UILabel *hitLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) AVAudioPlayer *selectedSound;

- (IBAction)resetGameAction:(id)sender;
- (IBAction)pauseResumeAction:(id)sender;


@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    tagArray = @[@1, @1, @2, @2, @3, @3, @4, @4, @5, @5, @6, @6, @7, @7, @8, @8, @9, @9, @10, @10].mutableCopy;
    firstTileView = nil;
    firstTileImageView = nil;
    loopTime = 0;
    matchCount = 0;
    missedCount = 0;
    timeCounter = 0;
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat: @"selected"] ofType:@"mp3"]];
    self.selectedSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.selectedSound prepareToPlay];
    [self.selectedSound setVolume:0.1];
    [self.selectedSound setNumberOfLoops:0];
    [self setupTiles];
}

/*
 switch (i) {
 case 1:
 view.frame = frame1;
 break;
 case 2:
 view.frame = frame2;
 break;
 case 3:
 view.frame = frame3;
 break;
 case 4:
 view.frame = frame4;
 break;
 case 5:
 view.frame = frame5;
 break;
 case 6:
 view.frame = frame6;
 break;
 case 7:
 view.frame = frame7;
 break;
 case 8:
 view.frame = frame8;
 break;
 case 9:
 view.frame = frame9;
 break;
 case 10:
 view.frame = frame10;
 break;
 case 11:
 view.frame = frame11;
 break;
 case 12:
 view.frame = frame12;
 break;
 case 13:
 view.frame = frame13;
 break;
 case 14:
 view.frame = frame14;
 break;
 case 15:
 view.frame = frame15;
 break;
 case 16:
 view.frame = frame16;
 break;
 case 17:
 view.frame = frame17;
 break;
 case 18:
 view.frame = frame18;
 break;
 case 19:
 view.frame = frame19;
 break;
 case 20:
 view.frame = frame20;
 break;
 default:
 break;
 }
 
*/

- (void)setupTiles
{
    for (int i = 1; i <= 20; i++)
    {
        view = [[MMTileView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        view.delegate = self;
        view.userInteractionEnabled = NO;
        switch (i) {
            case 1:
                view.center = CenterPoint1;
                break;
            case 2:
                view.center = CenterPoint2;
                break;
            case 3:
                view.center = CenterPoint3;
                break;
            case 4:
                view.center = CenterPoint4;
                break;
            case 5:
                view.center = CenterPoint5;
                break;
            case 6:
                view.center = CenterPoint6;
                break;
            case 7:
                view.center = CenterPoint7;
                break;
            case 8:
                view.center = CenterPoint8;
                break;
            case 9:
                view.center = CenterPoint9;
                break;
            case 10:
                view.center = CenterPoint10;
                break;
            case 11:
                view.center = CenterPoint11;
                break;
            case 12:
                view.center = CenterPoint12;
                break;
            case 13:
                view.center = CenterPoint13;
                break;
            case 14:
                view.center = CenterPoint14;
                break;
            case 15:
                view.center = CenterPoint15;
                break;
            case 16:
                view.center = CenterPoint16;
                break;
            case 17:
                view.center = CenterPoint17;
                break;
            case 18:
                view.center = CenterPoint18;
                break;
            case 19:
                view.center = CenterPoint19;
                break;
            case 20:
                view.center = CenterPoint20;
                break;
            default:
                break;
        }

        int randomTag = [self randomTag];
        view.tag = randomTag;
        view.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        
//        UIImageView *viewImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i.png", randomTag]]];
//        viewImage.center = view.center;
//
//        [self.view addSubview:viewImage];
        [self.view addSubview:view];
        [view setAlpha:0];
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^(void){
                             switch (i) {
                                 case 1:
                                     view.frame = frame1;
                                     break;
                                 case 2:
                                     view.frame = frame2;
                                     break;
                                 case 3:
                                     view.frame = frame3;
                                     break;
                                 case 4:
                                     view.frame = frame4;
                                     break;
                                 case 5:
                                     view.frame = frame5;
                                     break;
                                 case 6:
                                     view.frame = frame6;
                                     break;
                                 case 7:
                                     view.frame = frame7;
                                     break;
                                 case 8:
                                     view.frame = frame8;
                                     break;
                                 case 9:
                                     view.frame = frame9;
                                     break;
                                 case 10:
                                     view.frame = frame10;
                                     break;
                                 case 11:
                                     view.frame = frame11;
                                     break;
                                 case 12:
                                     view.frame = frame12;
                                     break;
                                 case 13:
                                     view.frame = frame13;
                                     break;
                                 case 14:
                                     view.frame = frame14;
                                     break;
                                 case 15:
                                     view.frame = frame15;
                                     break;
                                 case 16:
                                     view.frame = frame16;
                                     break;
                                 case 17:
                                     view.frame = frame17;
                                     break;
                                 case 18:
                                     view.frame = frame18;
                                     break;
                                 case 19:
                                     view.frame = frame19;
                                     break;
                                 case 20:
                                     view.frame = frame20;
                                     break;
                                 default:
                                     break;
                             }
                             view.layer.cornerRadius = 37.5;
                             view.alpha = 1;
                         }
                         completion:nil];
    }
}


- (int)randomTag
{
    int i = arc4random() % tagArray.count;
    int tagNum = [tagArray[i] intValue];
    [tagArray removeObjectAtIndex:i];
    
    return tagNum;
}

- (void)tileTouched:(UIView *)tileView
{
    if (loopTime <= 1 && matchCount < 10)
    {
        loopTime++;
        
        [self.selectedSound play];
        
        
        NSLog(@"View %li", (long)tileView.tag);
        
        MMTileImageView *tileImageView = [[MMTileImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%li.png", (long)tileView.tag]]];
        tileImageView.center = tileView.center;
        tileImageView.frame = tileView.frame;
        
        tileView.layer.borderColor = [UIColor orangeColor].CGColor;
        tileView.layer.borderWidth = 2;
        tileView.backgroundColor = [UIColor clearColor];
        tileView.alpha = 0;
        tileImageView.alpha = 0;
        [self.view addSubview:tileImageView];
        //[self.view sendSubviewToBack:tileImageView];
        
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^(void){
                             tileImageView.alpha = 1.0;
                             tileView.alpha = 1.0;
                         }
                         completion:nil];
        
        if (firstTileView == nil && firstTileImageView == nil) {
            firstTileView = tileView;
            firstTileImageView = tileImageView;
            firstTileView.userInteractionEnabled = NO;
        }
        else
        {
            if (firstTileView.tag == tileView.tag)
            {
                NSLog(@"Got a Match");
                firstTileView = nil;
                firstTileImageView = nil;
                [self resetLoopTime];
                matchCount++;
                
                if (matchCount == 10) {
                    [timer invalidate];
                    [_pauseResumeButton setTitle:@"Start" forState:UIControlStateNormal];
                    [_pauseResumeButton setEnabled:NO];
                    [self performSelector:@selector(playWinningSound) withObject:nil afterDelay:1.0];
                }
                
                NSLog(@"Match Count %i", matchCount);
            }
            else
            {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
                
                missedCount--;
                
                NSLog(@"No Match");
                [UIView animateWithDuration:0.5
                                      delay:2
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^(void){
                                     tileImageView.alpha = 0;
                                     firstTileImageView.alpha =0;
                                     
                                     tileView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
                                     tileView.layer.borderWidth = 0;
                                     
                                     firstTileView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
                                     firstTileView.layer.borderWidth = 0;
                                     
                                     
                                     //tileView.alpha = 0;
                                 }
                                 completion:^(BOOL finished){
                                         [self resetLoopTime];
                                 }];
                
                firstTileView.userInteractionEnabled = YES;
                firstTileView = nil;
                firstTileImageView = nil;
            }
        }
        _hitLabel.text = [NSString stringWithFormat:@"%i", matchCount];
        _missedLabel.text = [NSString stringWithFormat:@"%i", missedCount];
    }
}

- (void)playWinningSound
{
    UIAlertView *winningAlert = [[UIAlertView alloc] initWithTitle:@"You Won!" message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    
    [winningAlert show];
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"banana" ofType:@"mp3"]];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer setNumberOfLoops:0];
    [self.audioPlayer play];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.audioPlayer stop];
    self.audioPlayer = nil;
}

- (void)resetLoopTime
{
    loopTime = 0;
}

- (void)removeHintImageView
{
    for (UIImageView *imageView in self.view.subviews) {
        if ([imageView isKindOfClass:[MMTileImageView class]]) {
            [UIView animateWithDuration:2.0
                             animations:^(void){
                                 imageView.alpha = 0;
                             }
                             completion:nil];
            //[imageView removeFromSuperview];
        }
    }
    
    for (UIView *tileView in self.view.subviews) {
        if ([tileView isKindOfClass:[MMTileView class]])
        {
            tileView.userInteractionEnabled = YES;
        }
    }
    
    [self performSelector:@selector(startTimer) withObject:nil afterDelay:2.0];
}

- (void)startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimeCounter) userInfo:nil repeats:YES];
}

- (void)updateTimeCounter
{
    timeCounter += 1.0;
    _timerLabel.text = [NSString stringWithFormat:@"%02d:%02d", (timeCounter / 60) % 60, timeCounter % 60];
}

- (IBAction)resetGameAction:(id)sender
{
    for (UIView *tileView in self.view.subviews) {
        if ([tileView isKindOfClass:[MMTileView class]]) {
            [tileView removeFromSuperview];
        }
    }
    view = nil;
    
    for (UIImageView *imageView in self.view.subviews) {
        if ([imageView isKindOfClass:[MMTileImageView class]]) {
            [imageView removeFromSuperview];
        }
    }
    
    [tagArray removeAllObjects];
    tagArray = @[@1, @1, @2, @2, @3, @3, @4, @4, @5, @5, @6, @6, @7, @7, @8, @8, @9, @9, @10, @10].mutableCopy;
    firstTileView = nil;
    firstTileImageView = nil;
    loopTime = 0;
    matchCount = 0;
    missedCount = 0;
    timeCounter = 0;
    _hitLabel.text = @"";
    _missedLabel.text = @"";
    _timerLabel.text = @"00:00";
    [timer invalidate];
    timer = nil;
    [_pauseResumeButton setTitle:@"Start" forState:UIControlStateNormal];
    [_pauseResumeButton setEnabled:YES];
    [self setupTiles];
}

- (IBAction)pauseResumeAction:(id)sender
{
    if ([_pauseResumeButton.titleLabel.text isEqualToString:@"Start"])
    {
        [_pauseResumeButton setTitle:@"Pause" forState:UIControlStateNormal];
        
        for (UIView *tileView in self.view.subviews) {
            if ([tileView isKindOfClass:[MMTileView class]])
            {
                MMTileImageView *tileImageView = [[MMTileImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%li.png", (long)tileView.tag]]];
                tileImageView.center = tileView.center;
                tileImageView.frame = tileView.frame;
                tileImageView.alpha = 0;
                [self.view addSubview:tileImageView];
                [UIView animateWithDuration:2.0
                                 animations:^(void){
                                     tileImageView.alpha = 1.0;
                                 }
                                 completion:nil];
            }
        }
        
        [self performSelector:@selector(removeHintImageView) withObject:nil afterDelay:5.0];
    }
    else if ([_pauseResumeButton.titleLabel.text isEqualToString:@"Pause"])
    {
        [_pauseResumeButton setTitle:@"Resume" forState:UIControlStateNormal];
        
        [timer invalidate];
        
        for (UIView *tileView in self.view.subviews) {
            if ([tileView isKindOfClass:[MMTileView class]])
            {
                tileView.userInteractionEnabled = NO;
            }
        }
    }
    else
    {
        [_pauseResumeButton setTitle:@"Pause" forState:UIControlStateNormal];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimeCounter) userInfo:nil repeats:YES];
        
        for (UIView *tileView in self.view.subviews) {
            if ([tileView isKindOfClass:[MMTileView class]])
            {
                tileView.userInteractionEnabled = YES;
            }
        }
    }
}
@end
