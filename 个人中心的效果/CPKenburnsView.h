//
//  CPKenburnsView.h
//  个人中心的效果
//
//  Created by mac on 17/2/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CPKenburnsImageViewState) {
    CPKenburnsImageViewStateAnimating,
    CPKenburnsImageViewStatePausing
};

typedef NS_ENUM(NSInteger, CPKenburnsImageViewZoomCourse) {
    CPKenburnsImageViewZoomCourseRandom                = 0,
    CPKenburnsImageViewZoomCourseUpperLeftToLowerRight = 1,
    CPKenburnsImageViewZoomCourseUpperRightToLowerLeft = 2,
    CPKenburnsImageViewZoomCourseLowerLeftToUpperRight = 3,
    CPKenburnsImageViewZoomCourseLowerRightToUpperLeft = 4
};
typedef NS_ENUM(NSInteger, CPKenburnsImageViewZoomPoint) {
    CPKenburnsImageViewZoomPointLowerLeft  = 0,
    CPKenburnsImageViewZoomPointLowerRight = 1,
    CPKenburnsImageViewZoomPointUpperLeft  = 2,
    CPKenburnsImageViewZoomPointUpperRight = 3
};



@interface CPKenburnsImageView : UIImageView

@end

@interface CPKenburnsView : UIView

@property (nonatomic, strong) CPKenburnsImageView *imageView;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, assign) CGFloat animationDuration;

@property (nonatomic, assign) CGFloat zoomRatio;

@property (nonatomic, assign) CGFloat endZoomRate;

@property (nonatomic, assign) CGFloat startZoomRate;

@property (nonatomic, assign) UIEdgeInsets padding;

@property (nonatomic, assign) CPKenburnsImageViewZoomCourse course;

@property (nonatomic, assign) CPKenburnsImageViewState state;

- (void)restartMotion;
- (void)showWholeImage;
- (void)zoomAndRestartAnimation;
- (void)zoomAndRestartAnimationWithCompletion:(void(^)(BOOL finished))completion;

@end
