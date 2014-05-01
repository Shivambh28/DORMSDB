//
//  DDResultsTableViewCell.h
//  DORMSDB
//
//  Created by Alex Mitchell on 4/6/14.
//  Copyright (c) 2014 Alex Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDResultsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *roomtitle;
@property (weak, nonatomic) IBOutlet UILabel *campus;
@property (weak, nonatomic) IBOutlet UILabel *rating;

@end
