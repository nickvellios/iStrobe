//
//  MainViewController.m
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

#import "MainViewController.h"


@implementation MainViewController

@synthesize strobeTimer, strobeFlashTimer, powerButton;
@synthesize strobeSlider;
@synthesize adBannerView = _adBannerView;
@synthesize bannerIsVisible, strobeActivated;
@synthesize flashController;

- (void)viewWillAppear:(BOOL)animated{
	[self uiSetup];
	
	[self createAdBannerView];
	
	if (_adBannerView != nil) {        
        [_adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifier320x50];
		CGRect adBannerViewFrame = [_adBannerView frame];
		adBannerViewFrame.origin.y = 0;
		[_adBannerView setFrame:adBannerViewFrame];
		bannerIsVisible = YES;
    } else {
		bannerIsVisible = NO;
	}
}

- (void)uiSetup {
	//Slider Images
	UIImage *stetchLeftTrack = [[UIImage imageNamed:@"slider-bg.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
	UIImage *stetchRightTrack = [[UIImage imageNamed:@"slider-bg.png"]  stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
	
	//Slider: Top
	strobeSlider.backgroundColor = [UIColor clearColor];	
	[strobeSlider setThumbImage: [UIImage imageNamed:@"slider-knob.png"] forState:UIControlStateNormal];
	[strobeSlider setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
	[strobeSlider setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	strobeIsOn = NO;
	strobeActivated = NO;
	strobeFlashOn = NO;
	
	flashController = [[FlashController alloc] init];
	
	self.strobeTimer = [NSTimer scheduledTimerWithTimeInterval:[self.strobeSlider value] target:self selector:@selector(strobeTimerCallback:) userInfo:nil repeats:YES];
	self.strobeFlashTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(strobeFlashTimerCallback:) userInfo:nil repeats:YES];
}

- (void)strobeTimerCallback:(id)sender {
	if (strobeActivated) {
		strobeIsOn = !strobeIsOn;
		strobeFlashOn = YES;
	} else {
		strobeFlashOn = NO;
	}
}

- (void)strobeFlashTimerCallback:(id)sender {
	if (strobeFlashOn) {
		strobeFlashOn = !strobeFlashOn;
		[self startStopStrobe:strobeIsOn];
	} else {
		[self startStopStrobe:NO];
	}
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)powerButtonPressed:(id)sender {
	if(strobeActivated) {
		[powerButton setImage:[UIImage imageNamed:@"powerbuttonoff.png"] forState:UIControlStateNormal];
		strobeActivated = NO;
	} else {
		[powerButton setImage:[UIImage imageNamed:@"powerbuttonon.png"] forState:UIControlStateNormal];
		strobeActivated = YES;
	}

	[self startStopStrobe:strobeActivated];
}

- (IBAction)handleSlider:(id)sender {
	[self.strobeTimer invalidate];
	
	self.strobeTimer = [NSTimer scheduledTimerWithTimeInterval:[self.strobeSlider value] target:self selector:@selector(strobeTimerCallback:) userInfo:nil repeats:YES];
}

- (IBAction)showInfo:(id)sender {
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (IBAction)onStrobeSwitch:(id)sender {
	UISwitch *mySwitch = sender;
	strobeActivated = mySwitch.on;
	
	[self startStopStrobe:strobeActivated];
	
	if(strobeActivated) {
		strobeSlider.enabled = YES;
	} else {
		strobeSlider.enabled = NO;
	}
}

- (void)startStopStrobe:(BOOL)strobeOn {	
	if (strobeOn || ([self.strobeSlider value] >= 0.29 && strobeActivated)) {
		[flashController toggleStrobe:YES];
	} else {
		[flashController toggleStrobe:NO];
	}
}

- (IBAction)urlButton:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.DwarfCamel.com"]]; 
}

- (void)createAdBannerView {
    Class classAdBannerView = NSClassFromString(@"ADBannerView");
    if (classAdBannerView != nil) {
        self.adBannerView = [[[classAdBannerView alloc] initWithFrame:CGRectZero] autorelease];
        [_adBannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects: ADBannerContentSizeIdentifier320x50, ADBannerContentSizeIdentifier480x32, nil]];
		[_adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifier320x50];            
        [_adBannerView setFrame:CGRectOffset([_adBannerView frame], 0, -70)];
        [_adBannerView setDelegate:self];
		
        [self.view addSubview:_adBannerView];        
    }
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
	if(!bannerIsVisible) {
		[UIView beginAnimations:@"animateAdBannerOn" context:NULL];
		// assumes the banner view is at the top of the screen.
		banner.frame = CGRectOffset(banner.frame, 0, 70);
		[UIView commitAnimations];
		bannerIsVisible = YES;
	}
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
	if(bannerIsVisible) {
		[UIView beginAnimations:@"animateAdBannerOff" context:NULL];
		// assumes the banner view is at the top of the screen.
		banner.frame = CGRectOffset(banner.frame, 0, -70);
		[UIView commitAnimations];
		bannerIsVisible = NO;
	}
}

- (void)dealloc {
	[flashController release];
	
	self.adBannerView = nil;
	
    [super dealloc];
}


@end
