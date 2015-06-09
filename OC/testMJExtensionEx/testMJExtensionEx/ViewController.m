//
//  ViewController.m
//  testMJExtensionEx
//
//  Created by clark on 5/14/15.
//  Copyright (c) 2015 clark. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import <MJExtension/MJExtension.h>
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any adoditional setup after loading the view, typically from a nib.
    NSDictionary *dict = @{
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @20,
                           @"height" : @"1.55",
                           @"money" : @100.9,
                           @"sex" : @(SexFemale),
                           @"gay" : @"true"
                           };
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    User *user = [User objectWithKeyValues:dict];
#pragma clang diagnostic pop
    
//    NSLog(@"%@",user);
    
    NSMutableArray * cachePropites = [NSMutableArray array];
    
    unsigned int outCout = 0;
   objc_property_t *properties = class_copyPropertyList([user class], &outCout);
    
    for (unsigned int i = 0; i<outCout; i++) {
        
        objc_property_t onePro = properties[i];
        
        NSLog(@"name %s ====== value %s \n",
              property_getName(onePro),
              property_getAttributes(onePro));
    }
    
    Class  cl = object_getClass(self);
    

    
    
    
}

- (void)ex_registerClassPair {
    Class newClass = objc_allocateClassPair([NSError class], "TestClass", 0);
    class_addMethod(newClass, @selector(testMetaClass), (IMP)TestMetaClass, "v@:");
    objc_registerClassPair(newClass);
    id instance = [[newClass alloc] initWithDomain:@"some domain" code:0 userInfo:nil];
    [instance performSelector:@selector(testMetaClass)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
