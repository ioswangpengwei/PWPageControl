//
//  YYPageControl.h
//  YYLearnProduct
//
//  Created by MacW on 2018/4/4.
//  Copyright © 2018年 MacW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PWPageControl : UIControl

@property(nonatomic, strong)UIColor *normalColor;
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, assign) CGSize normalSize;

@property(nonatomic, strong) UIColor *selectColor;
@property (nonatomic, strong) UIImage *selectImage;
@property (nonatomic, assign) CGSize selectSize;

@property (nonatomic, assign) CGFloat controlSpacing;

@property (nonatomic, assign) NSInteger numberPage;

- (void)setSelectedIndex:(NSInteger)index;

@end
