//
//  MeetingNoticeCellTableViewCell.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MeetingNoticeCellTableViewCell.h"
typedef NS_ENUM(NSInteger,noticeType) {
    noticeTypeInvite,//会议邀请
    noticeTypeAdd,//补充通知
};

static const CGFloat  topMargin = 15;
static const CGFloat  leftMargin = 20;
static const CGFloat  iconWidthHeight = 30;

@interface MeetingNoticeCellTableViewCell()
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, assign)noticeType noticeType;
@property (nonatomic, strong)UILabel *meetingTitle;
@property (nonatomic, strong)UILabel *meetingSubTitle;
@property (nonatomic, strong)UIImageView *rightIcon;
@property (nonatomic, strong)UILabel *timeLabel;
@end

@implementation MeetingNoticeCellTableViewCell
- (UIImageView *)rightIcon
{
    if (!_rightIcon) {
        _rightIcon = [[UIImageView alloc]init];
        _rightIcon.image = [UIImage imageNamed:@"rightarow"];
    }
    return _rightIcon;
}

#pragma mark - property
- (void)setModel:(MyMeetingModel *)model
{
    _model = model;
    self.meetingTitle = [UILabel new];
    self.meetingSubTitle = [UILabel new];
    self.timeLabel = [UILabel new];
    self.meetingTitle.text = model.REM_TITLE;
    self.meetingSubTitle.text = model.S_USER__NAME;
    self.timeLabel.text = model.EXECUTE_TIME;
    [self.meetingSubTitle sizeToFit];
}


- (void)setNoticeType:(noticeType)noticeType
{
    _noticeType = noticeType;
    self.icon = [[UIImageView alloc]init];
    self.title = [UILabel new];
    switch (_noticeType) {
        case noticeTypeInvite:
        {
            self.icon.image = [UIImage imageNamed:@"know_light"];
            self.title.textColor = ALColor(31.0, 178.0, 138.0);
        }
            break;
        case noticeTypeAdd:
        {
            [self.icon setImage:[UIImage imageNamed:@"know_set"]];

            self.title.textColor = ALColor(83.0, 135.0, 193.0);
        }
            break;

            
        default:
            break;
    }

}

#pragma mark - lifeStyle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    
    return self;
}

+ (instancetype)cellWithTabelView:(UITableView *)tableView
{
    MeetingNoticeCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"meetingNoticeCell"];
    if (!cell) {
        cell = [[MeetingNoticeCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"meetingNoticeCell"];
    }
    
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setup];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 初始化
- (void)setup
{
    self.icon.x = leftMargin;
    self.icon.y = topMargin;
    self.icon.width = iconWidthHeight;
    self.icon.height = iconWidthHeight;
    
    [self addSubview:self.icon];
    
    self.title.x = self.icon.x + self.icon.width + 15;
    self.title.y = self.icon.y;
    [self.title sizeToFit];
    [self addSubview:self.title];
    
    self.meetingTitle.x = CGRectGetMaxX(self.title.frame) + 5;
    self.meetingTitle.y = self.title.y;
     [self.meetingTitle sizeToFit];
    [self addSubview:self.meetingTitle];
    
    self.meetingSubTitle.x = self.title.x;
    self.meetingSubTitle.y = CGRectGetMaxY(self.title.frame) + 8;
    [self addSubview:self.meetingSubTitle];
    
    self.timeLabel.x = CGRectGetMaxX(self.meetingSubTitle.frame) + 20;
    self.timeLabel.y = self.meetingSubTitle.y;
    [self addSubview:self.timeLabel];

//    [self.rightIcon sizeToFit];
//    self.rightIcon.x = SIZEWIDTH - 15 - self.rightIcon.width;
//    self.rightIcon.centerY = self.height * 0.5;
//    
//    [self addSubview:self.rightIcon];
    
}


@end
