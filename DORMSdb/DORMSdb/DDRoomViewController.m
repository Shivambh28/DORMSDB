//
//  DDRoomViewController.m
//  DORMSDB
//
//  Created by Alex Mitchell on 3/30/14.
//  Copyright (c) 2014 Alex Mitchell. All rights reserved.
//

#import "DDRoomViewController.h"

@interface DDRoomViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *favoriteButton;

@end

@implementation DDRoomViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    self.room = [DDObject roomWithNumber: @"2349" Hall: @"Kershaw" AC:YES Laundry:YES Printer:NO SubstanceFree:YES GenderNeutral:NO LoggiaAccess:NO Campus:@"East" Cluster:@"bEast" Type:@"Double" Floor:3];
    [super viewDidLoad];
    [self.navigationController.navigationItem setTitle:[NSString stringWithFormat:@"%@ %@", self.room.hall, self.room.number]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- TableView Delegate Methods


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"amenityItem" forIndexPath:indexPath];
    
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"Rating";
                cell.imageView.image = nil;
                break;
            case 1:
                cell.textLabel.text = [NSString stringWithFormat: @"%@",self.room.type];
                cell.imageView.image = [UIImage imageNamed:@"YES"];
                break;
                
            case 2:
                cell.textLabel.text = [NSString stringWithFormat:@"%@ Campus (%@)",self.room.campus,self.room.cluster];
                cell.imageView.image = [UIImage imageNamed:@"YES"];
                break;
            case 3:
                cell.textLabel.text = @"Air Conditioning";
                if (self.room.airConditioning)
                    cell.imageView.image = [UIImage imageNamed:@"YES"];
                else
                    cell.imageView.image = [UIImage imageNamed:@"NO"];
                break;
            case 4:
                cell.textLabel.text = @"Printer";
                if (self.room.printer)
                    cell.imageView.image = [UIImage imageNamed:@"YES"];
                else
                    cell.imageView.image = [UIImage imageNamed:@"NO"];
                break;
            case 5:
                cell.textLabel.text = @"Laundry Facilities";
                if (self.room.laundry)
                    cell.imageView.image = [UIImage imageNamed:@"YES"];
                else
                    cell.imageView.image = [UIImage imageNamed:@"NO"];
                break;
            case 6:
                cell.textLabel.text = @"Substance Free";
                if (self.room.substanceFree)
                    cell.imageView.image = [UIImage imageNamed:@"YES"];
                else
                    cell.imageView.image = [UIImage imageNamed:@"NO"];
                break;
            case 7:
                cell.textLabel.text = @"Loggia Access";
                if (self.room.loggiaAccess)
                    cell.imageView.image = [UIImage imageNamed:@"YES"];
                else
                    cell.imageView.image = [UIImage imageNamed:@"NO"];
                break;
            case 8:
                cell.textLabel.text = @"Gender Neutral";
                if (self.room.genderNeutral)
                    cell.imageView.image = [UIImage imageNamed:@"YES"];
                else
                    cell.imageView.image = [UIImage imageNamed:@"NO"];
                break;
                
            default:
                
                break;
        }
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
