//
//  JoinItem.m
//  xingcommOSX
//
//  Created by BaoBaoDaRen on 2019/8/14.
//  Copyright © 2019 Boris. All rights reserved.
//

#import "JoinItem.h"

@interface JoinItem ()

@end

@implementation JoinItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    self.sepLine.wantsLayer = YES;
    self.sepLine.layer.backgroundColor = [NSColor lightGrayColor].CGColor;
    
    [self openMouseOverflowEvent];
}
// 监听鼠标响应区域...
-(void)openMouseOverflowEvent {
    
    NSTrackingAreaOptions options = NSTrackingMouseEnteredAndExited | NSTrackingActiveInKeyWindow;
    NSTrackingArea *area = [[NSTrackingArea alloc] initWithRect:self.view.bounds options:options owner:self userInfo:nil];
    [self.view addTrackingArea:area];
    
}
// 鼠标进入...
- (void)mouseEntered:(NSEvent *)event
{
    NSLog(@"鼠标进入");
    self.mouseResponseBtn.hidden = NO;
}
// 鼠标离开...
- (void)mouseExited:(NSEvent *)event
{
    NSLog(@"鼠标离开");
    self.mouseResponseBtn.hidden = YES;
}

//- (void)mouseDown:(NSEvent *)event
//{
//    switch (event.clickCount)
//    {
//        case 1:
//        {
//            // 单击...
//
//            break;
//        } case 2:
//        {
//            // 双击...
//
//            break;
//        }
//        default:
//            break;
//    }
//}

// 鼠标右键...
- (void)rightMouseDown:(NSEvent *)event
{
    NSLog(@"右键点击");
    
    
}

@end
