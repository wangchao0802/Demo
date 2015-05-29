//
//  CheckNetwork.h
//  Jdmobile
//
//  Created by Steven Sun on 11/17/10.
//  Copyright 2010 360Jdmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"


@interface CheckNetwork : NSObject 
{
	id				target_;
	SEL				reachabilitySelector_;
	
	Reachability	*reachability_;
	
	
	Reachability	*hostReach_;
    Reachability	*internetReach_;
    Reachability	*wifiReach_;
}


+ (CheckNetwork *) sharedCheckNetwork;

- (void) startNotificationWithTarget:(id)target reachabilitySelector:(SEL)reachabilitySelector;

- (NetworkStatus )internetConnectionStatus;

@end
