//
//  YYPageControl.m
//  YYLearnProduct
//
//  Created by MacW on 2018/4/4.
//  Copyright © 2018年 MacW. All rights reserved.
//

#import "PWPageControl.h"
#import "Masonry.h"

@interface PWPageControl()

@property (nonatomic, assign) NSInteger currentPage;

@end

@implementation PWPageControl

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}
- (void)setSelectedIndex:(NSInteger)index {
    NSLog(@"test");
    UIImageView *lastSelectImageView = [self viewWithTag:1000+self.currentPage];
    UIImageView *currentImageView = [self viewWithTag:1000+index];
    
    [lastSelectImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.normalSize);
    }];
    lastSelectImageView.backgroundColor = self.normalColor;
    lastSelectImageView.image = self.normalImage;
    [currentImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.selectSize);
    }];
    currentImageView.backgroundColor = self.selectColor;
    currentImageView.image =  self.selectImage;
    
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    }];
    
    self.currentPage = index;
}
- (void)initialize {
    _controlSpacing = 8;
    _normalColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    _selectColor = [UIColor orangeColor];
    _selectSize = CGSizeMake(6, 6);
    _normalSize = CGSizeMake(6, 6);
}

-(void)setNormalSize:(CGSize)normalSize {
    _normalSize = normalSize;
    [self setUpConstraints];
}

-(void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    [self updatePageControl];

}

- (void)setNormalImage:(UIImage *)normalImage {
    _normalImage = normalImage;
    [self updatePageControl];

}

-(void)setSelectSize:(CGSize)selectSize {
    _selectSize = selectSize;
    [self setUpConstraints];

}

-(void)setSelectColor:(UIColor *)selectColor {
    _selectColor = selectColor;
    [self updatePageControl];

}

-(void)setSelectImage:(UIImage *)selectImage {
    _selectImage = selectImage;
    [self updatePageControl];
}

- (void)setNumberPage:(NSInteger)numberPage {
    _numberPage = numberPage;
    [self setUpConstraints];
}

- (void)setUpConstraints {
    
    CGFloat left = (self.normalSize.width +self.controlSpacing) *(self.numberPage - 1)/2 +self.selectSize.width/2;

    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.currentPage = 0;
    UIImageView *lastImageView;
    for (int i = 0; i < self.numberPage; i ++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.tag = 1000+i;
        [self addSubview:imageView];
        if (i == 0) {
            imageView.backgroundColor = self.selectColor;
            imageView.image = self.selectImage;
            imageView.layer.cornerRadius = self.selectSize.height/2;
            imageView.layer.masksToBounds = YES;
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.size.mas_equalTo(self.selectSize);
                make.left.equalTo(self.mas_centerX).offset(-left);
            }];
            lastImageView = imageView;
        } else {
            imageView.backgroundColor = self.normalColor;
            imageView.image = self.normalImage;
            imageView.layer.cornerRadius = self.normalSize.height/2;
            imageView.layer.masksToBounds = YES;
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.size.mas_equalTo(self.normalSize);
                make.left.equalTo(lastImageView.mas_right).offset(self.controlSpacing);
            }];
            lastImageView = imageView;
        }
    }
}

- (void)updatePageControl {
    
    
    if (self.numberPage > 0) {
        
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx == 0) {
                obj.backgroundColor = self.selectColor;
                obj.image = self.selectImage;
         
              
            } else {
                obj.backgroundColor = self.normalColor;
                obj.image = self.normalImage;
             
            }
        }];
    }
}

@end
