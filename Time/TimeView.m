//
//  TimeView.m
//  Time
//
//  Created by Osamu Noguchi on 10/15/12.
//  Copyright (c) 2012 Osamu Noguchi. All rights reserved.
//

#import "TimeView.h"

@implementation TimeView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    int width = [self frame].size.width;
    int height = [self frame].size.height;
    
    NSPoint pt = NSMakePoint(width/2 - 90, height/2);
    float strSize = 18.f;
    
    NSColor *back = [NSColor blackColor];
    NSRect rect = NSMakeRect(0, 0, width, height);
    
    NSColor *color = [NSColor whiteColor];
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy:MM:dd HH:mm:ss:SSS"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithString:dateString];
    [str addAttribute:NSFontAttributeName value:[NSFont fontWithName:@"Times" size:strSize] range:NSMakeRange(0, 22)];
    [str addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, 22)];
    
    [back set];
    [NSBezierPath fillRect:rect];
    [str drawAtPoint:pt];
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
