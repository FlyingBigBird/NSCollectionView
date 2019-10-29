//
//  JoinItem.h
//  xingcommOSX
//
//  Created by BaoBaoDaRen on 2019/8/14.
//  Copyright © 2019 Boris. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface JoinItem : NSCollectionViewItem

@property (weak) IBOutlet NSButton *mouseResponseBtn;

@property (weak) IBOutlet NSTextField *titleLab;

@property (weak) IBOutlet NSTextField *detailTitle;

@property (weak) IBOutlet NSView *sepLine;

@end

NS_ASSUME_NONNULL_END
