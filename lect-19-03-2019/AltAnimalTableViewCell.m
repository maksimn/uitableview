//
//  AltAnimalTableViewCell.m
//  lect-19-03-2019
//
//  Created by Maksim Ivanov on 20/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "AltAnimalTableViewCell.h"

@implementation AltAnimalTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(16.f, 16.f, CGRectGetWidth(self.frame) - 88.f, 16.f);
    self.subtitleLabel.frame = CGRectMake(16.f, CGRectGetMaxY(self.titleLabel.frame) + 16.f, CGRectGetWidth(self.frame) - 88.f, 16.f);
    self.coverImageView.frame = CGRectMake(16.f + CGRectGetMaxX(self.titleLabel.frame), 16.f, 40.f, 40.f);
}

@end
