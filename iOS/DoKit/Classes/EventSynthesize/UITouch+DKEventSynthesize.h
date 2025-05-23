/**
 * Copyright 2017 Beijing DiDi Infinity Technology and Development Co., Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "common.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

DOKIT_EXPORT UIEvent *_Nullable DKEventWithTouches(NSArray<UITouch *> *touches);

@interface UITouch (DKEventSynthesize)

- (instancetype)initWithStartPoint:(CGPoint)startPoint view:(UIView *)view;

- (void)dk_updateWithPhase:(UITouchPhase)phase;

- (void)dk_updateWithPointInWindow:(CGPoint)pointInWindow;

@end

NS_ASSUME_NONNULL_END
