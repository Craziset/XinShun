//
//  MenuView.h
//  XinShun
//
//  Created by Corepass on 16/11/17.
//  Copyright © 2016年 LONG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuView : UIView

+(instancetype)MenuViewWithDependencyView:(UIView *)dependencyView MenuView:(UIView *)leftmenuView isShowCoverView:(BOOL)isCover;

-(instancetype)initWithDependencyView:(UIView *)dependencyView MenuView:(UIView *)leftmenuView isShowCoverView:(BOOL)isCover;


-(void)show;

-(void)hidenWithoutAnimation;
-(void)hidenWithAnimation;

@end
