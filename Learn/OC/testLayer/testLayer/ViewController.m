//
//  ViewController.m
//  testLayer
//
//  Created by WangChao on 4/7/15.
//  Copyright (c) 2015 WangChao. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>
#import "AAView.h"

@interface ViewController ()
{
    CALayer *_layer;
    CAScrollLayer *_layer2;
    CATextLayer *textLayer;
    CAGradientLayer *gradientLayer;
}

@property(nonatomic ,retain) AAView *aa;

@end


const static NSString *bb = @"beg";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self go6];


}


-(void)go6
{
    CAShapeLayer *shpLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
//    [path moveToPoint: CGPointMake(250, 250)];
    
    [path addArcWithCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI*2 clockwise:NO];
    
//
    //    [path addLineToPoint:CGPointMake(400, 200)];
//    [path addLineToPoint:CGPointMake(100, 400)];
//    [path addLineToPoint:CGPointMake(300, 100)];
////    [path addLineToPoint:CGPointMake(500, 400)];
//    

    
//    [path addQuadCurveToPoint:(CGPoint){440,400} controlPoint:(CGPoint){300,200}];
//    [path addCurveToPoint:(CGPoint){400,400} controlPoint1:(CGPoint){400,600} controlPoint2:(CGPoint){300,200}];
//        [path closePath];

    shpLayer.path = path.CGPath;
    shpLayer.fillColor = [UIColor yellowColor].CGColor;
    shpLayer.strokeColor = [UIColor redColor].CGColor;
    shpLayer.lineWidth = 1.0;
    shpLayer.fillRule  =  kCAFillRuleNonZero;
//    
//    shpLayer.strokeStart = 0.5;
//    shpLayer.strokeEnd = 0.8;
//    
    shpLayer.lineJoin = kCALineJoinRound;
    
    shpLayer.lineDashPhase = 1.5;
    [self.view.layer addSublayer:shpLayer];
    
}





-(void)go5
{
    UIScrollView * scrol = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 150, 300, 200)];
    [self.view addSubview:scrol];
    
    CGRect rect = CGRectMake(0, 0, 300, 4000);
    AAView *av = [[AAView alloc] initWithFrame:rect];
    
    [(CATiledLayer*)av.layer setTileSize:
     CGSizeMake(100*av.contentScaleFactor, 100*av.contentScaleFactor)];
    
    [scrol addSubview:av];
    
    [scrol setContentSize:rect.size];
    
}






-(void)go3
{
    gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame  = CGRectMake(0, 0, 150, 150);
    gradientLayer.colors = @[(id)[UIColor redColor].CGColor,
                             (id)[UIColor blueColor].CGColor,
                             (id)[UIColor yellowColor].CGColor,
                             (id)[UIColor blackColor].CGColor];
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.locations = @[@0.1,@0.3];
    gradientLayer.startPoint = CGPointMake(1, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
}


-(void)go4
{
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.frame  = CGRectMake(200, 200, 150, 150);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    layer.shadowPath = [UIBezierPath bezierPathWithRect:layer.bounds].CGPath;
    layer.shadowColor = [UIColor redColor].CGColor;
    layer.shadowOpacity = 1.0;
    layer.instanceCount = 2;
    layer.preservesDepth = YES;
    CATransform3D t = CATransform3DMakeTranslation(0, 150, 0);
    t= CATransform3DRotate(t, M_PI, 1, 0, 0);
//    t=CATransform3DScale(t, 1, 0.8, 1);
    layer.instanceTransform = t;
    layer.instanceAlphaOffset = -0.1;
//    layer.instanceBlueOffset =-0.1;
//    layer.instanceRedOffset =-0.1;
//    layer.instanceGreenOffset =-0.1;

//    layer.instanceDelay = 20000;
    [self.view.layer addSublayer:layer];

    CALayer *go = [CALayer layer];
    go.contents = (__bridge id)[UIImage imageNamed:@"22.png"].CGImage;
    go.frame  = CGRectMake(0, 0, 150, 150);
    [layer addSublayer:go];
}


-(void)go
{
    _layer = [CALayer layer];
    _layer.frame = CGRectMake(0, 0, 150, 150);//{(100,100),(100,100)};
    _layer.backgroundColor = [UIColor  yellowColor].CGColor;
    //    _layer.borderWidth = 25;
    _layer.borderColor = [UIColor  redColor].CGColor;
    //    _layer.shadowOpacity = 0.7;
    //    _layer.shadowRadius = 10.0;
    //    _layer.shadowOffset = CGSizeMake(0, 3);
    
    _layer.contents = (__bridge id)([UIImage imageNamed:@"22.png"].CGImage);
    _layer.contentsGravity = kCAGravityCenter;
    _layer.magnificationFilter = kCAFilterLinear;
    _layer.geometryFlipped = NO;
    _layer.shouldRasterize = YES;
    
    _layer2 = [CAScrollLayer layer];
    _layer2.backgroundColor = [UIColor  redColor].CGColor;
    
    _layer2.frame = CGRectMake(40, 40, 200, 200);
    _layer2.scrollMode = kCAScrollBoth;
    [_layer2 addSublayer:_layer];
    
    [self.view.layer addSublayer:_layer2];
    
    
    [self performSelector:@selector(delaygo) withObject:nil afterDelay:5];

}


-(void)delaygo
{
    [_layer2 scrollPoint:CGPointMake(140, 140)];
}




-(void)go2
{
    textLayer =[CATextLayer layer];
    textLayer.frame = CGRectMake(50, 50, 200, 1000);
    
    NSString *text = @"agwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmwagwgl;wkg;lkwl;gkw;ekg;kwklk;lkkk;kge;wovmw";
    textLayer.string = text;
    CFStringRef fonNam = ((__bridge CFStringRef)@"Noteworthy-Light");
    textLayer.font = CTFontCreateWithName(fonNam, 20, nil);
    textLayer.foregroundColor = [UIColor yellowColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentRight;
    textLayer.wrapped = YES;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.view.layer addSublayer:textLayer];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
