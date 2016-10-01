//
//  ViewController.m
//  ObjCUIWebViewDZ
//
//  Created by Eugene Mekhedov on 01.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import "EMWebViewController.h"

typedef NS_ENUM(NSInteger, EMSectionName){
    EMSectionNameURL,
    EMSectionNamePDF
};

@interface ViewController ()

@property (strong, nonatomic) NSArray* urlArray;
@property (strong, nonatomic) NSArray* pdfArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.urlArray = [NSArray arrayWithObject:@"https://vk.com/id76240030"];
    self.pdfArray = [NSArray arrayWithObject:@"1.pdf"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger numberOfRows = 0;
    
    if (section == EMSectionNameURL){
        numberOfRows = [self.urlArray count];
        
    }else if (section == EMSectionNamePDF){
        numberOfRows = [self.pdfArray count];
    }
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    if (indexPath.section == EMSectionNameURL){
        cell.textLabel.text = [self.urlArray objectAtIndex:indexPath.row];
    }else if (indexPath.section == EMSectionNamePDF){
        cell.textLabel.text = [self.pdfArray objectAtIndex:indexPath.row];
    }
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == EMSectionNameURL){
        return @"URL";
    }else if (section == EMSectionNamePDF){
        return @"PDF";
    }
    
    return nil;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell*)sender{
    EMWebViewController* destinationController = segue.destinationViewController;
    destinationController.cellString = sender.textLabel.text;

}




@end
