//
//  MorseCode.m
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

#import "MorseCode.h"


@implementation MorseCode

@synthesize morseLetterKeys;

- (id)init {
	if (self = [super init]) {
		[self setupMorse];
    }
	
    return self;
}

- (void)setupMorse {
	morseLetterKeys = [NSArray arrayWithObjects:
					   @"a", // .-
					   @"b", // -...
					   @"c", // -.-.
					   @"d", // -..
					   @"e", // .
					   @"f", // ..-.
					   @"g", // --.
					   @"h", // ....
					   @"i", // ..
					   @"j", // .---
					   @"k", // -.-
					   @"l", // .-..
					   @"m", // --
					   @"n", // -.
					   @"o", // ---
					   @"p", // .--.
					   @"q", // --.-
					   @"r", // .-.
					   @"s", // ...
					   @"t", // -
					   @"u", // ..-
					   @"v", // ...-
					   @"w", // .--
					   @"x", // -..-
					   @"y", // -.--
					   @"z", // --..
					   @"0", // -----
					   @"1", // .----
					   @"2", // ..---
					   @"3", // ...--
					   @"4", // ....-
					   @"5", // .....
					   @"6", // -....
					   @"7", // --...
					   @"8", // ---..
					   @"9", // ----.
					   @".", // .-.-.-
					   @",", // --..--
					   @"?", // ..--..
					   @"!", // .----.
					   nil];
}
@end
