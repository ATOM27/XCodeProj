//
//  EMLoginViewController.h
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 08.01.17.
//  Copyright © 2017 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EMAccessToken;

typedef void(^EMLoginCompletionBlock)(EMAccessToken* token);

@interface EMLoginViewController : UIViewController <UIWebViewDelegate>

-(id) initWithCompletionBlock:(EMLoginCompletionBlock) completionBlock;

@end
