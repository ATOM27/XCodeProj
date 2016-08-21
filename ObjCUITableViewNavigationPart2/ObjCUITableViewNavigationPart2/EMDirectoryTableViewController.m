//
//  EMDirectoryTableViewController.m
//  ObjCUITableViewNavigationPart2
//
//  Created by Eugene Mekhedov on 21.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMDirectoryTableViewController.h"

@interface EMDirectoryTableViewController ()

@property (strong, nonatomic) NSString* path;
@property (strong, nonatomic) NSArray* contents;

@end

@implementation EMDirectoryTableViewController

- (instancetype)initWithPath:(NSString*) path
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.path = path;
    }
    return self;
}

-(void) setPath:(NSString *)path{
    _path = path;
    
    self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.path){
        self.path = @"/Users/eugenemekhedov/Documents/XCodeProj";
    }
    
    self.navigationItem.title = [self.path lastPathComponent];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ([self.navigationController.viewControllers count] > 1){
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"Back to Root"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(actionBackToRoot:)];
        self.navigationItem.rightBarButtonItem = item;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(void) actionBackToRoot:(UIBarButtonItem*) sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - DRY

-(BOOL) isDirectoryAtIndexPath:(NSIndexPath*) indexPath{
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    NSString* path = [self.path stringByAppendingPathComponent:fileName];
    
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    
    return isDirectory;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* indentidier = @"Cell";
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:indentidier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentidier];
    }
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fileName;
    
    if ([self isDirectoryAtIndexPath:indexPath]){
        cell.imageView.image = [UIImage imageNamed:@"folder.png"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.imageView.image = [UIImage imageNamed:@"file.png"];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self isDirectoryAtIndexPath:indexPath]){
        
        NSString* fileName = [self.contents objectAtIndex:indexPath.row];
        NSString* path = [self.path stringByAppendingPathComponent:fileName];
        
        //EMDirectoryTableViewController* vc = [[EMDirectoryTableViewController alloc] initWithPath:path];
        //[self.navigationController pushViewController:vc animated:YES];
        
        EMDirectoryTableViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EMDirectoryTableViewController"]; // need to use only if you work with storyboard(create labels, buttons, etc on storyboard). So if you'll create new ViewController with storyboard all your(labels, buttons, etc) will create too, but if you init you controller through code there will no any labels and buttons on it.
        vc.path = path;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
