//
//  AnimalTableViewCell.m
//  lect-19-03-2019
//
//  Created by Maksim Ivanov on 19/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AnimalTableViewCell.h"

@interface AnimalTableViewCell ()

@end

@implementation AnimalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)_reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:_reuseIdentifier];
    
    if (self)
    {
        _coverImageView = [UIImageView new];
        _coverImageView.backgroundColor = [UIColor yellowColor];
        
        [self.contentView addSubview:_coverImageView];
        
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_titleLabel];
        
        _subtitleLabel = [UILabel new];
        _subtitleLabel.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_subtitleLabel];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.coverImageView.frame = CGRectMake(16.f, 16.f, 40.f, 40.f);
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame) + 16.f, 16.f, CGRectGetWidth(self.frame) - 88.f, 16.f);
    
    self.subtitleLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame) + 16.f, CGRectGetMaxY(self.titleLabel.frame) + 16.f,
        CGRectGetWidth(self.frame) - 88.f, 16.f);
}

// ДЗ добавить контент в кастомную ячейку

@end
