//
//  ViewController.m
//  lect-19-03-2019
//
//  Created by Maksim Ivanov on 19/03/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

#import "ViewController.h"
#import "AnimalTableViewCell.h"
#import "AltAnimalTableViewCell.h"

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
    [self.tableView registerClass:[AltAnimalTableViewCell class]
           forCellReuseIdentifier:NSStringFromClass([AltAnimalTableViewCell class])];
    
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
    Boolean isOdd = indexPath.row % 2 == 0;
    id animal = self.animalData[indexPath.row];
    
    AnimalTableViewCell *cell = isOdd ?
        [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AnimalTableViewCell class]) forIndexPath:indexPath] :
        [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AltAnimalTableViewCell class]) forIndexPath:indexPath];
    
    cell.titleLabel.text = animal[@"title"];
    cell.subtitleLabel.text = animal[@"subtitle"];
    cell.coverImageView.image = [UIImage imageNamed: animal[@"image"]];
    
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
