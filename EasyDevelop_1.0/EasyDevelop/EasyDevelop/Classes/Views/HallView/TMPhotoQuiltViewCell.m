//
//  TMQuiltView
//
//  Created by Bruno Virlet on 7/20/12.
//
//  Copyright (c) 2012 1000memories

//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
//  and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR 
//  OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
//  DEALINGS IN THE SOFTWARE.
//


#import "TMPhotoQuiltViewCell.h"

const CGFloat kTMPhotoQuiltViewMargin = 0;

@implementation TMPhotoQuiltViewCell

@synthesize photoView = _photoView;
@synthesize titleLabel = _titleLabel;
@synthesize bottomView =_bottomView;
@synthesize images = _images;
@synthesize dingButton =_dingButton;
- (void)dealloc {
    [_photoView release], _photoView = nil;
    [_titleLabel release], _titleLabel = nil;
   [_bottomView release], _bottomView = nil;
    [_dingButton release], _dingButton =nil;
    
    [super dealloc];
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIImageView *)photoView {
    if (!_photoView) {
        _photoView = [[UIImageView alloc] init];
        _photoView.contentMode = UIViewContentModeScaleAspectFill;
        _photoView.clipsToBounds = YES;
        
        UIButton* buttonDing =[[UIButton alloc] initWithFrame:CGRectMake(60, -8, 121, 36)];
        [buttonDing  setImage:[UIImage imageNamed:@"dingyue.png"] forState:UIControlStateNormal];
        [buttonDing  setImage:[UIImage imageNamed:@"dingyue_h.png"] forState:UIControlStateHighlighted];
        [_photoView addSubview:buttonDing];
        
        [self addSubview:_photoView];
    }
    return _photoView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = UITextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}


- (UIButton *)dingButton {
    if (!_dingButton)
    {
        _dingButton = [[UIButton alloc] init];
        [self addSubview:_titleLabel];
    }
    return _dingButton;
}

- (UIImageView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIImageView alloc] init];
        _bottomView.contentMode = UIViewContentModeScaleAspectFill;
        _bottomView.clipsToBounds = YES;
        [self addSubview:_bottomView];
    }
    return _bottomView;
}
    
- (void)layoutSubviews {
    self.photoView.frame = CGRectInset(self.bounds, kTMPhotoQuiltViewMargin, kTMPhotoQuiltViewMargin);
    self.titleLabel.frame = CGRectMake(kTMPhotoQuiltViewMargin, self.bounds.size.height - 20 - kTMPhotoQuiltViewMargin,
                                       self.bounds.size.width - 2 * kTMPhotoQuiltViewMargin, 20);
//    self.dingButton.frame = CGRectMake(kTMPhotoQuiltViewMargin, self.bounds.size.height - 20 - kTMPhotoQuiltViewMargin,
//                                       self.bounds.size.width - 2 * kTMPhotoQuiltViewMargin, 20);
//    self.bottomView.frame = CGRectMake(kTMPhotoQuiltViewMargin, self.bounds.size.height - 20 - kTMPhotoQuiltViewMargin,
//                                       self.bounds.size.width - 2 * kTMPhotoQuiltViewMargin, 20);
}

#define userdeine
- (NSMutableArray *)images
{
    if (!_images)
	{
        NSMutableArray *imageNames = [NSMutableArray array];
        for(int i = 0; i < 10; i++) {
            [imageNames addObject:[NSString stringWithFormat:@"%d.jpg", i % 10 + 1]];
        }
        _images = [imageNames retain];
    }
    return _images;
}


- (UIImage *)imageAtIndexPath:(NSIndexPath *)indexPath {
    return [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
}

@end
