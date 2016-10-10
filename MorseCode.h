//
//  MorseCode.h
//  iStrobe
//
//  Created by Nicholas Vellios on 7/28/10.
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


@interface MorseCode : NSObject {
	NSArray *morseLetterKeys;
}

@property (nonatomic, retain) NSArray *morseLetterKeys;

- (void)setupMorse;
- (id)init;

@end
