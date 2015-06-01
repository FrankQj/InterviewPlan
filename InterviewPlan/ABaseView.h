//
//  ABaseView.h
//  InterviewPlan
//
//  Created by Mike on 15-4-28.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickedBlock)(UIButton *);

@interface ABaseView : UIView

@property (nonatomic, copy) ButtonClickedBlock buttonBlock;
- (void)addOtherViews;
@end
