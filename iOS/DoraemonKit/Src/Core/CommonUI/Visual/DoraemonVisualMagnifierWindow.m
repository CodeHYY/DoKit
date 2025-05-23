//
//  DoraemonVisualMagnifierWindow.m
//  DoraemonKit
//
//  Created by wenquan on 2018/12/6.
//

#import "DoraemonKit/Src/Core/CommonUI/Visual/DoraemonVisualMagnifierWindow.h"

@implementation DoraemonVisualMagnifierWindow

-(instancetype)init{
    self = [super init];
    if (self) {
        self.magnifierSize = 90;
        self.magnification = 2.0;
        #if defined(__IPHONE_13_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0)
            if (@available(iOS 13.0, *)) {
                for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes){
                    if (windowScene.activationState == UISceneActivationStateForegroundActive){
                        self.windowScene = windowScene;
                        break;
                    }
                }
            }
        #endif
        self.frame = CGRectMake(0, 0, self.magnifierSize, self.magnifierSize);
        self.layer.delegate = self;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [[UIColor clearColor] CGColor];
        self.windowLevel = UIWindowLevelStatusBar + 1.f;
        self.layer.contentsScale = [[UIScreen mainScreen] scale];
    }
    return self;
}

#pragma mark - Override

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextTranslateCTM(ctx, self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    CGContextScaleCTM(ctx, _magnification, _magnification);
    CGContextTranslateCTM(ctx, -1 * self.targetPoint.x, -1 * self.targetPoint.y);
    
    [self.targetWindow.layer renderInContext:ctx];
}

#pragma mark - Setter

- (void)setMagnification:(CGFloat)magnification {
    if (magnification > 0) {
        _magnification = magnification;
    }
}

- (void)setTargetWindow:(UIView *)targetWindow {
    _targetWindow = targetWindow;
    [self setTargetPoint:self.targetPoint];
    
}

- (void)setMagnifierSize:(CGFloat)magnifierSize {
    _magnifierSize = magnifierSize;
    self.frame = CGRectMake(0, 0, _magnifierSize, _magnifierSize);
    self.layer.cornerRadius = self.magnifierSize/2;
    self.layer.masksToBounds = YES;
}

- (void)setTargetPoint:(CGPoint)targetPoint {
    _targetPoint = targetPoint;
    if (self.targetWindow) {
        self.center = CGPointMake(targetPoint.x, targetPoint.y);
        [self.layer setNeedsDisplay];
    }
}

@end
