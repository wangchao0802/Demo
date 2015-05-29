//
//  FirstViewController.m
//  TestMessageSend
//
//  Created by WangChao on 4/19/15.
//  Copyright (c) 2015 WangChao. All rights reserved.
//

#import "FirstViewController.h"
#import <objc/runtime.h>
#import "NSWriteObject.h"

@interface FirstViewController ()
{
    NSWriteObject *_obj;
}
//-(void)test;

//+(void)testClass;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _obj = [NSWriteObject new];
    _obj.aprope = @"test1";
    
    NSWriteObject * obj2 = [_obj mutableCopy];
    NSArray *bb= @[@"aa",@"bb"];
    NSMutableArray *arr = [bb mutableCopy];
    NSLog(@" arr %@  \n",arr);
 
    [arr addObject:@"cc"];
    NSLog(@" arr %@  \n",arr);
 
    NSLog(@" obj1 %@  %@ oj2 %@ %@",_obj,_obj.aprope,obj2,obj2.aprope);
    
   
//    [self performSelector:@selector(test) withObject:nil];
    
    // Do any additioafter loading the view, typically from a nib.
}



 +(BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(test))
    {
        class_addMethod([self class],sel,(IMP)dynamicMethodIMP,"v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

+(BOOL)resolveClassMethod:(SEL)sel
{
    NSString *str  = NSStringFromSelector(sel);
    if ([str isEqualToString:@"testclass"])
    {
        Class seleMeatClass = objc_getMetaClass(class_getName([self class]));
        class_addMethod(seleMeatClass,sel,(IMP)dynamicMethodIMP,"v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

-(id)forwardingTargetForSelector:(SEL)aSelector
{
    NSString *str  = NSStringFromSelector(aSelector);
    if ([str isEqualToString:@"test"])
    {
        NSWriteObject *obj = [NSWriteObject new];
        return obj;
    }
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature * sign = [super methodSignatureForSelector:aSelector];
    if (!sign) {
        sign = [_obj methodSignatureForSelector:aSelector];
    }
    
    NSUInteger argCount = [sign numberOfArguments];
    for (NSInteger i=0 ; i<argCount;i++)
    {
        const char * ci =[sign  getArgumentTypeAtIndex:0];
        NSString *st= [NSString stringWithUTF8String:ci];
    }
    return sign;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL  sel = anInvocation.selector;
    [anInvocation invokeWithTarget:_obj];
}

void dynamicMethodIMP(id self, SEL _cmd)
{
    NSLog(@"fuck go");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
