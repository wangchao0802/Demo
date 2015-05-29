//
//  AAView.m
//  testLayer
//
//  Created by WangChao on 4/7/15.
//  Copyright (c) 2015 WangChao. All rights reserved.
//

#import "AAView.h"
#import <QuartzCore/QuartzCore.h>

@implementation AAView


+(Class)layerClass
{
    return [CATiledLayer class];
}
//
//-(instancetype) initWithFrame:(CGRect)frame
//{
//    if (self = [super init])
//    {
//    }
//    
//    return self;
//}
- (void)drawRect:(CGRect)rect
{
    NSLog(@"layer rect %@",NSStringFromCGRect(rect));

}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGRect rect = CGContextGetClipBoundingBox(ctx);
    
    NSLog(@"layer rect %@",NSStringFromCGRect(rect));
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddRect(ctx, CGRectMake(rect.origin.x +2, rect.origin.y +2, rect.size.width-4, rect.size.height-4));
    CGContextFillPath(ctx);
    NSLog(@"+++++==================");
    
}



@end
