//
//  JDSecondLevelObject.h
//  TestMJExtension
//
//  Created by clark on 15/6/2.
//  Copyright (c) 2015年 clark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDSecondLevelObject : NSObject

@property (nonatomic ,assign) NSInteger bottomMargin;
@property (nonatomic,assign) NSInteger jumpTo;
@property (nonatomic, strong) NSDictionary * content;
@property (nonatomic,copy) NSString *showName;
@property (nonatomic,copy) NSString *type;

@property (nonatomic,strong) NSArray *bannerArray;

@property (nonatomic,strong) id  data;


@end
