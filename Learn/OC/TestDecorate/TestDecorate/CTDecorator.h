//
//  CTDecorator.h
//  TestDecorate
//
//  Created by WangChao on 8/4/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTComponent.h"

@interface CTDecorator : CTComponent
{
    CTComponent *_component;
    
}

-(void)setcomponent:(CTComponent *)co;



@end
