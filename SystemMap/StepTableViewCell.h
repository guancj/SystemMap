//
//  StepTableViewCell.h
//  ST APP
//
//  Created by 梁少辉 on 2017/4/10.
//
//

#import <UIKit/UIKit.h>

@interface StepTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIView *zhuNor, *zhuLight;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *baseW, *zhuW, *zhuLightW, *baseLead, *zhuTop, *zhuBottom, *zhuLightTop, *zhuLightBottom;
@property (nonatomic, strong) UILabel *baoZhuLab;
@property (nonatomic, strong) NSString *cellFloat;
@end
