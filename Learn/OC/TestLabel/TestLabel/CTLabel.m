//
//  CTLabel.m
//  TestLabel
//
//  Created by WangChao on 8/2/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTLabel.h"
#import<CoreText/CoreText.h>

@implementation CTLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    return [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
}

-(NSAttributedString *)getAttributedString
{
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:@"this is test!"];
    
    //把this的字体颜色变为红色
    [attriString addAttribute:(NSString *)kCTForegroundColorAttributeName
                        value:(id)[UIColor redColor].CGColor
                        range:NSMakeRange(0, 4)];
    //把is变为黄色
    [attriString addAttribute:(NSString *)kCTForegroundColorAttributeName
                        value:(id)[UIColor yellowColor].CGColor
                        range:NSMakeRange(5, 2)];
    //改变this的字体，value必须是一个CTFontRef
    [attriString addAttribute:(NSString *)kCTFontAttributeName
                        value:(id)CFBridgingRelease(CTFontCreateWithName((CFStringRef)[UIFont boldSystemFontOfSize:14].fontName,
                                                       14,
                                                       NULL))
                        range:NSMakeRange(0, 4)];
    //给this加上下划线，value可以在指定的枚举中选择
    [attriString addAttribute:(NSString *)kCTUnderlineStyleAttributeName
                        value:(id)[NSNumber numberWithInt:kCTUnderlineStyleDouble]
                        range:NSMakeRange(0, 4)];
    return attriString;
}

- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:rect];
    
    NSAttributedString *attriString = [self getAttributedString];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextConcatCTM(ctx, CGAffineTransformScale(CGAffineTransformMakeTranslation(0, rect.size.height), 1.f, -1.f));
    CGContextSaveGState(ctx);

    CGContextConcatCTM(ctx, CGAffineTransformMakeTranslation(0, rect.size.height));

    CGContextConcatCTM(ctx, CGAffineTransformMakeScale(1., -1.));
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attriString);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, rect);
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    CFRelease(framesetter);
    
    CTFrameDraw(frame, ctx);
    CFRelease(frame);
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
