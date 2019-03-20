//
//  ViewController.m
//  lect-19-03-2019
//
//  Created by Maksim Ivanov on 19/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "ViewController.h"
#import "AnimalTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *animalData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.rowHeight = 80;
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[AnimalTableViewCell class]
           forCellReuseIdentifier:NSStringFromClass([AnimalTableViewCell class])];
    
    [self.view addSubview:self.tableView];
    
    NSArray *arr = @[@{
                         @"image": @"Image-3",
                         @"title": @"Корова",
                         @"subtitle": @"Lorem ipsum dolor"
                         },
                     @{
                         @"image": @"Image-4",
                         @"title": @"Собака",
                         @"subtitle": @"sit amet, consectetur"
                         },
                     @{
                         @"image": @"Image-2",
                         @"title": @"Кошка",
                         @"subtitle": @"adipiscing elit, sed"
                         },
                     @{
                         @"image": @"Image-1",
                         @"title": @"Лошадь",
                         @"subtitle": @"do eiusmod tempor"
                         },
                     @{
                         @"image": @"Image",
                         @"title": @"Олень",
                         @"subtitle": @"incididunt ut laborer"
                         }
                     ];
    
    self.animalData = arr;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.animalData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AnimalTableViewCell class]) forIndexPath:indexPath];
    
    NSInteger pos = indexPath.row;
    NSString *title = self.animalData[pos][@"title"];
    NSString *imageName = self.animalData[pos][@"image"];
    NSString *subtitle = self.animalData[pos][@"subtitle"];
    
    cell.titleLabel.text = title;
    cell.subtitleLabel.text = subtitle;
    cell.coverImageView.image = [UIImage imageNamed: imageName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = self.animalData[indexPath.row][@"title"];
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmActionButton = [UIAlertAction
                                          actionWithTitle:@"oK"
                                          style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction * _Nonnull action) {
                                              [alertController dismissViewControllerAnimated:YES completion:nil];
                                          }];
    [alertController addAction:confirmActionButton];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
