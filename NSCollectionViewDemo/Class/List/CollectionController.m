//
//  CollectionController.m
//  NSCollectionViewDemo
//
//  Created by BaoBaoDaRen on 2019/10/29.
//  Copyright © 2019 Boris. All rights reserved.
//

#import "CollectionController.h"
#import "JoinItem.h"
#import "NSColor+Helper.h"

@interface CollectionController () <NSCollectionViewDataSource, NSCollectionViewDelegate>
{
    CGFloat itemH;
}
@property (nonatomic, strong) NSCollectionView  *colView;
@property (nonatomic, strong) NSScrollView      *colScrolView;
@property (nonatomic, assign) NSInteger         selectedIndex;

@end

static NSString *const itemRestr = @"collectionResIds";

@implementation CollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self initTableUI];
}
- (void)initTableUI
{
    self.colView = [[NSCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor lightGrayColor].CGColor;
    itemH = 65;
    self.selectedIndex = 0;

    
    self.colView.dataSource = self;
    self.colView.delegate = self;
    
    NSCollectionViewFlowLayout *flowLayout = [[NSCollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 1;
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.scrollDirection = NSCollectionViewScrollDirectionVertical; // default is NSCollectionViewScrollDirectionVertical
    flowLayout.footerReferenceSize = CGSizeZero;
    flowLayout.sectionInset = NSEdgeInsetsZero;
    
    [self.colView setCollectionViewLayout:flowLayout];
    self.colView.backgroundColors = @[[NSColor whiteColor]];
    [self.colView registerClass:[JoinItem class] forItemWithIdentifier:itemRestr];
    [self.colView setSelectable:YES];
    
    
    self.colScrolView = [[NSScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.colScrolView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    self.colScrolView.scrollerStyle = NSScrollerStyleOverlay;
    [self.colScrolView setHasVerticalScroller:YES];//有垂直滚动条
    [self.view addSubview:self.colScrolView];
    
    [self.colScrolView setDocumentView:self.colView];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    JoinItem *item = [collectionView makeItemWithIdentifier:itemRestr forIndexPath:indexPath];
    if (indexPath.item == self.selectedIndex) {
        
        [NSColor view:item.view wantsColor:[NSColor lightGrayColor]];
    } else {
        [NSColor view:item.view wantsColor:[NSColor whiteColor]];
    }
    item.detailTitle.stringValue = [NSString stringWithFormat:@"这是第【%ld】行", (long)indexPath.item];
    
    return item;
}
- (NSView *)collectionView:(NSCollectionView *)collectionView viewForSupplementaryElementOfKind:(NSCollectionViewSupplementaryElementKind)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isKindOfClass:[NSCollectionElementKindSectionHeader class]]) {
        
        NSView *view = [[NSView alloc] init];
        [NSColor view:view wantsColor:[NSColor redColor]];
        return view;
    } else {
        NSView *view = [[NSView alloc] init];
        [NSColor view:view wantsColor:[NSColor whiteColor]];
        return view;
    }
}
- (NSSize)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return NSMakeSize(self.view.frame.size.width ? self.view.frame.size.width : 240, itemH);
}
- (NSSize)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(240, 0.01);
}
- (void)collectionView:(NSCollectionView *)collectionView didSelectItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths
{
    self.selectedIndex = collectionView.selectionIndexes.firstIndex;
    [self.colView reloadData];
}


@end
