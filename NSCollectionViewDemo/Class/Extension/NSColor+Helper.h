//
//  NSColor+Helper.h
//  xingcommOSX
//
//  Created by BaoBaoDaRen on 2019/8/7.
//  Copyright © 2019 Boris. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSColor (Helper)

+ (NSColor *)colorWithHexString:(NSString *)stringToConvert;

+ (void) view:(NSView *)view wantsColor :(NSColor *)color;

@end

NS_ASSUME_NONNULL_END
