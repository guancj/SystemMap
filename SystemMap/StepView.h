//
//  StepView.h
//  ST APP
//
//  Created by 梁少辉 on 2017/4/10.
//
//

#import <UIKit/UIKit.h>
#import "StepTableViewCell.h"
@interface StepView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *stepTab;
@property (nonatomic, assign) NSInteger pillarCount;
@property (nonatomic, strong) NSString *baseLead;//离底部距离
@property (nonatomic, strong) NSString *baseW;//底部坐标线宽度
@property (nonatomic, strong) NSString *zhuW;//背景柱状图宽度
@property (nonatomic, strong) NSString *zhuTop;//背景柱状图与顶部距离
@property (nonatomic, strong) NSString *zhuBottom;//背景柱状图与底部距离
@property (nonatomic, strong) NSString *zhuLightW;//前景柱状图宽度
@property (nonatomic, strong) NSString *zhuLightTop;//前景柱状图与顶部距离
@property (nonatomic, strong) NSString *zhuLightBottom;//前景柱状图与底部距离
@property (nonatomic, strong) NSString *xLabW;//底部坐标宽度
@property (nonatomic, strong) UIColor *zhuLightColor;//前景柱状图颜色
@property (nonatomic, assign) CGFloat cellW;//CELL的宽度

@property (nonatomic, strong) NSMutableArray *LightTopArr;
@property (nonatomic, strong) NSMutableArray *baseTextArr;
@property (nonatomic, strong) NSMutableArray *LightBottomArr;
@end
