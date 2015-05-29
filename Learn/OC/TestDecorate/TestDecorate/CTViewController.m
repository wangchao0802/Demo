//
//  CTViewController.m
//  TestDecorate
//
//  Created by WangChao on 8/4/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTViewController.h"
#import "Person.h"
#import "CTCocreateComponent.h"
#import "CTConcreteDecoratorA.h"
#import "CTConcreteDecoratorB.h"

#import "NewPerson.h"
#import "CTbigshoes.h"
#import "CTShirt.h"


@interface CTViewController ()

@end

@implementation CTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    Person *p = [[Person alloc] initWithName:@"panpan"];
//    [p wearTie];
//    [p wearSuit];
//    [p wearBigTrouser];
//    [p show];
    
//    CTCocreateComponent *c  = [[CTCocreateComponent alloc] init];
//    CTConcreteDecoratorA *a = [[CTConcreteDecoratorA alloc] init];
//    CTConcreteDecoratorB *b = [[CTConcreteDecoratorB alloc] init];
//    
//    [a setcomponent:c];
//    [b setcomponent:a];
//    [b operation];
    
    NewPerson *np = [[NewPerson alloc] initWithName:@"new P"];
    CTShirt *shirt = [[CTShirt alloc] init];
    CTbigshoes *sh = [[CTbigshoes alloc] init];
    
    [shirt wear:np];
    [sh wear:shirt];
    
    [sh show];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
