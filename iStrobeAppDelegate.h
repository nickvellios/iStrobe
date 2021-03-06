//
//  iStrobeAppDelegate.h
//  iStrobe
//
//  Created by Nicholas Vellios on 7/12/10.
//  Copyright 2010 Nick Vellios. All rights reserved.
//
//	http://www.Vellios.com
//	nick@vellios.com
//
//	This code is released under the "Take a kid fishing or hunting license"
//	In order to use any code in your project you must take a kid fishing or
//	hunting and give some sort of credit to the author of the code either
//	on your product's website, about box, or legal agreement.
//  For more information visit http://www.Vellios.com/license/
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface iStrobeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

- (void)saveData;
- (void)loadData;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end

