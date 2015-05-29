//
//  CheckNetwork.m
//  Jdmobile
//
//  Created by Steven Sun on 11/17/10.
//  Copyright 2010 360Jdmobile. All rights reserved.
//

#import "CheckNetwork.h"
#import "SynthesizeSingleton.h"

#define SERVER							@"http://gw.m.360buy.com"

@implementation CheckNetwork

SYNTHESIZE_SINGLETON_FOR_CLASS(CheckNetwork);


- (void) configureInfoByReachability: (Reachability*) curReach
{
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    BOOL connectionRequired= [curReach connectionRequired];
    NSString* statusString= @"";
    switch (netStatus)
    {
        case NotReachable:
        {
            statusString = @"Access Not Available";
            //Minor interface detail- connectionRequired may return yes, even when the host is unreachable.  We cover that up here...
            connectionRequired= NO;  
            break;
        }
            
        case ReachableVia2G:
        {
            statusString = @"ReachableVia2G";
            break;
        }
            
        case ReachableViaWWAN:
        {
            statusString = @"Reachable WWAN";
            break;
        }
        case ReachableViaWiFi:
        {
			statusString= @"Reachable WiFi";
            break;
		}
    }
    if(connectionRequired)
    {
        statusString= [NSString stringWithFormat: @"%@, Connection Required", statusString];
    }
	
	
    //textField.text= statusString;
	
	
	// 返回到调用的对象回调方法中
	if (target_ && reachabilitySelector_) {
		[target_ performSelector:reachabilitySelector_ withObject:statusString withObject:[NSNumber numberWithInt:netStatus]];
	}
	
	
}

- (void) updateInterfaceWithReachability: (Reachability*) curReach
{
    if(curReach == hostReach_)
	{	//
		[self configureInfoByReachability: curReach];
        NetworkStatus netStatus = [curReach currentReachabilityStatus];
        BOOL connectionRequired= [curReach connectionRequired];
		
		
		// test
		if (netStatus == ReachableViaWWAN) {
			NSString* baseLabel=  @"";
			if(connectionRequired)
			{
				baseLabel=  @"Cellular data network is available.\n  Internet traffic will be routed through it after a connection is established.";
			}
			else
			{
				baseLabel=  @"Cellular data network is active.\n  Internet traffic will be routed through it.";
			}
		}
		
        
    }
	if(curReach == internetReach_)
	{	
		[self configureInfoByReachability: curReach];
	}
	if(curReach == wifiReach_)
	{	
		[self configureInfoByReachability: curReach];
	}
	
}

//Called by Reachability whenever status changes.
- (void) reachabilityChanged: (NSNotification* )note
{
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
	[self updateInterfaceWithReachability: curReach];
}

- (void) startNotificationWithTarget:(id)target reachabilitySelector:(SEL)reachabilitySelector {
	
	target_ = target;
	reachabilitySelector_ = reachabilitySelector;
	
	[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(reachabilityChanged:) name: kReachabilityChangedNotification object: nil];
	
    //Change the host name here to change the server your monitoring
	if (hostReach_ == nil) {
		hostReach_ = [[Reachability reachabilityWithHostName:SERVER] retain];
	}
	[hostReach_ startNotifier];
	[self updateInterfaceWithReachability: hostReach_];
	
	//
	if (internetReach_ == nil) {
		internetReach_ = [[Reachability reachabilityForInternetConnection] retain];
	}
	[internetReach_ startNotifier];
	[self updateInterfaceWithReachability: internetReach_];
	
	//
	if (wifiReach_ == nil) {
		wifiReach_ = [[Reachability reachabilityForLocalWiFi] retain];
	}
	[wifiReach_ startNotifier];
	[self updateInterfaceWithReachability: wifiReach_];
	
}



- (NetworkStatus )internetConnectionStatus {
	
	if (reachability_ == nil) {
		reachability_ = [[Reachability reachabilityForInternetConnection] retain];
	}
	return [reachability_ currentReachabilityStatus];
}




@end
