//
//  StepView.m
//  ST APP
//
//  Created by 梁少辉 on 2017/4/10.
//
//

#import "StepView.h"

@implementation StepView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
          [self createUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _cellW = 44;
        [self createUI];
    }
    return self;
}


- (void)createUI{
    [_stepTab removeFromSuperview];
    _stepTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.width) style:UITableViewStylePlain];
    /*该方法无效，必须让视图完全加载后调用方可生效
     //    _stepTab.separatorStyle = UITableViewCellSeparatorStyleNone;
     //    _stepTab.separatorColor = [UIColor greenColor];
     */
    _stepTab.showsVerticalScrollIndicator = NO;
    _stepTab.transform = CGAffineTransformMakeRotation(-M_PI_2);
    _stepTab.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
    _stepTab.delegate = self;
    _stepTab.dataSource = self;
    _stepTab.tableFooterView = [UIView new];
    [self addSubview:_stepTab];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _LightTopArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellW;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StepTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"STEPCELL"];
    if (!cell) {
        cell = (StepTableViewCell *)[[[NSBundle mainBundle]loadNibNamed:@"StepTableViewCell" owner:self options:nil] firstObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.zhuLight.backgroundColor = _zhuLightColor;
    
//    NSDictionary *stepDic = _cellArr[indexPath.row];
//    float goal = [stepDic[@"STEP"] intValue] >= [SMAAccountTool userInfo].userGoal.intValue ? 8.0:((cell.contentView.frame.size.height - 20 - 8) - ((cell.contentView.frame.size.height - 20 - 8) * ([stepDic[@"STEP"] intValue]/[SMAAccountTool userInfo].userGoal.floatValue)));
    if ([_LightTopArr[indexPath.row] floatValue] >= 8.0) {
        cell.zhuLightTop.constant = [_LightTopArr[indexPath.row] floatValue];
    }
    if (_zhuW) {
        cell.zhuW.constant = _zhuW.floatValue;
        cell.cellFloat = [NSString stringWithFormat:@"%f",_cellW];
    }
    if (_baseTextArr.count > 0) {
        cell.baoZhuLab.text = _baseTextArr[indexPath.row];
    }
    if (_xLabW) {
        cell.cellFloat = _xLabW;
    }
    
    if (_baseLead) {
        cell.baseLead.constant = _baseLead.floatValue;
    }
    if (_baseW) {
        cell.baseW.constant = _baseW.floatValue;
    }
    if (_zhuTop) {
        cell.zhuTop.constant = _zhuTop.floatValue;
    }
    if (_zhuBottom) {
        cell.zhuBottom.constant = _zhuBottom.floatValue;
    }
    if (_zhuLightW) {
        cell.zhuLightW.constant = _zhuLightW.floatValue;
    }
    if (_zhuLightTop) {
        cell.zhuLightTop.constant = _zhuLightTop.floatValue;
    }
    if (_LightBottomArr.count > 0) {
        cell.zhuLightBottom.constant = [_LightBottomArr[indexPath.row] floatValue];
    }

    return cell;
}


@end
