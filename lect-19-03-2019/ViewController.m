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
@property (nonatomic, strong) NSArray<NSString *> *animals;
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
    
    self.animals = @[
                     @"Корова",
                     @"Собака",
                     @"Кошка",
                     @"Лошадь",
                     @"Олень"
                     ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.animals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AnimalTableViewCell class]) forIndexPath:indexPath];
    
    NSString *title = self.animals[indexPath.row];
    cell.titleLabel.text = title;
    cell.coverImageView.image = [UIImage imageNamed: @"Image"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * title = self.animals[indexPath.row];
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
