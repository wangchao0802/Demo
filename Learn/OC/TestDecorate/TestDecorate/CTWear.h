//
//  CTWear.h
//  TestDecorate
//
//  Created by WangChao on 8/4/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "NewPerson.h"

@interface CTWear : NewPerson
{
    
    NewPerson*_person;
}

-(void)wear:(NewPerson *)p;

-(void)show ;


@end
