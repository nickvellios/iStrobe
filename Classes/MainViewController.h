//
//  MainViewController.h
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

#import "FlipsideViewController.h"
#import "FlashController.h"
#import <iAd/ADBannerView.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, ADBannerViewDelegate> {
	NSTimer *strobeTimer;
	NSTimer *strobeFlashTimer;

	BOOL strobeIsOn; // For our code to turn strobe on and off
	BOOL strobeActivated; // To allow user to turn off the light all together
	BOOL strobeFlashOn; // For our code to turn strobe on and off rapidly
	IBOutlet UISlider *strobeSlider;
	IBOutlet UIButton *powerButton;

	IBOutlet ADBannerView *_adBannerView;
	BOOL bannerIsVisible;
	
	FlashController *flashController;
}

@property (nonatomic, retain) NSTimer *strobeTimer;
@property (nonatomic, retain) NSTimer *strobeFlashTimer;
@property (nonatomic, retain) IBOutlet UISlider *strobeSlider;
@property (nonatomic, retain) IBOutlet UIButton *powerButton;

@property (nonatomic, retain) IBOutlet ADBannerView *adBannerView;
@property (nonatomic, assign) BOOL bannerIsVisible;
@property (nonatomic, assign) BOOL strobeActivated;

@property (nonatomic, retain) FlashController *flashController;

- (void)createAdBannerView;
- (IBAction)powerButtonPressed:(id)sender;
- (IBAction)showInfo:(id)sender;
- (IBAction)onStrobeSwitch:(id)sender;
- (void)strobeTimerCallback:(id)sender;
- (void)strobeFlashTimerCallback:(id)sender;
- (IBAction)handleSlider:(id)sender;
- (IBAction)urlButton:(id)sender;
- (void)uiSetup;
- (void)startStopStrobe:(BOOL)strobeOn;

@end
