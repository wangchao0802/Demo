//
//  UIDeviceAdditions.h
//  Jdmobile
//
//  Created by steven sun on 12/28/10.
//  Copyright 2010 360buy. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIDevice (JDCategory)


- (NSString *)machine;



/*
 * @method uniqueGlobalDeviceIdentifier
 * @description use this method when you need a unique global identifier to track a device
 * with multiple apps. as example a advertising network will use this method to track the device
 * from different apps.
 * It generates a hash from the MAC-address only.
 */

- (NSString *) macaddress;



@end