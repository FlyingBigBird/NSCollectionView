//
//  AppDelegate.m
//  NSCollectionViewDemo
//
//  Created by BaoBaoDaRen on 2019/10/29.
//  Copyright © 2019 Boris. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectionController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    CollectionController *vc = [[CollectionController alloc] initWithNibName:@"CollectionController" bundle:nil];
    self.window.contentViewController = vc;
    [self.window setTitle:@"列表视图"];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
