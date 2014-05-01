//
//  DDResultsTableViewCell.m
//  DORMSDB
//
//  Created by Alex Mitchell on 4/6/14.
//  Copyright (c) 2014 Alex Mitchell. All rights reserved.
//

#import "DDResultsTableViewCell.h"

@implementation DDResultsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
