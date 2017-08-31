//
//  StepTableViewCell.m
//  ST APP
//
//  Created by 梁少辉 on 2017/4/10.
//
//

#import "StepTableViewCell.h"

@implementation StepTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    if (!_cellFloat) {
        _cellFloat = @"42";
    }
    [self createUI];
}

- (void)setCellFloat:(NSString *)cellFloat{
    _cellFloat = cellFloat;
    [self createUI];
}

- (void)createUI{
    self.contentView.layer.shouldRasterize = YES;
    self.contentView.layer.rasterizationScale =  [UIScreen mainScreen].scale;
    [_baoZhuLab removeFromSuperview];
    _baoZhuLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, _cellFloat.floatValue, _baseLead.constant)];
    _baoZhuLab.center = CGPointMake(_baseLead.constant/2, _cellFloat.floatValue/2);
    _baoZhuLab.transform = CGAffineTransformMakeRotation(M_PI_2);
    _baoZhuLab.text = @"";
    _baoZhuLab.textColor = [UIColor greenColor];
    _baoZhuLab.font = [UIFont systemFontOfSize:18];
    _baoZhuLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_baoZhuLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
