//
//  EMDirectoryTableViewController.m
//  ObjCUITableViewNavigationPart2
//
//  Created by Eugene Mekhedov on 21.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMDirectoryTableViewController.h"
#import "EMCustomTableViewCell.h"
#import "UITableViewCellCategory.h"

@interface EMDirectoryTableViewController ()

@property (strong, nonatomic) NSString* path;
@property (strong, nonatomic) NSArray* contents;
@property (strong, nonatomic) NSString* selectedPath;

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

-(void) setContents:(NSArray *)contents{
    
    NSMutableArray* filesArray = [[NSMutableArray alloc] init];
    NSMutableArray* directoriesArray = [[NSMutableArray alloc] init];
    
    for (NSString* str in contents){
        if ([self isDirectory:str]){
            
            [directoriesArray addObject:str];
        }else{
            
            [filesArray addObject:str];
        }
    }
    
    [filesArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    [directoriesArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    _contents = [directoriesArray arrayByAddingObjectsFromArray:filesArray];
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
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                target:self
                                                                                action:@selector(actionEdit:)];
    if ([self backToRootBarButton] != nil){
        self.navigationItem.rightBarButtonItems = @[editButton, [self backToRootBarButton]];
    }else{
        self.navigationItem.rightBarButtonItems = @[editButton];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
-(void) actionEdit:(UIBarButtonItem*) sender{
    BOOL isEditing = self.tableView.editing;
    
    [self.tableView setEditing:!isEditing animated:YES];
    
    UIBarButtonSystemItem item = UIBarButtonSystemItemDone;
    
    if (isEditing){
        item = UIBarButtonSystemItemEdit;
    }
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item
                                                                                target:self
                                                                                action:@selector(actionEdit:)];
    
    if ([self backToRootBarButton] != nil){
        self.navigationItem.rightBarButtonItems = @[editButton, [self backToRootBarButton]];
    }else{
        self.navigationItem.rightBarButtonItems = @[editButton];
    }

    
}

-(void) actionBackToRoot:(UIBarButtonItem*) sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) actionAddFolder:(NSString*) folderName{
    
    NSString* path = [self.path stringByAppendingPathComponent:folderName];
    
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
    
    self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path error:nil];
    
    [self.tableView reloadData];
    
    
}
#pragma mark - DRY
-(UIBarButtonItem*) backToRootBarButton{
    
    UIBarButtonItem* item = nil;
    if ([self.navigationController.viewControllers count] > 1){
        item = [[UIBarButtonItem alloc] initWithTitle:@"Back to Root"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(actionBackToRoot:)];
    }
    return item;
}
-(BOOL) isDirectory:(NSString*) file{
    
    NSString* path = [self.path stringByAppendingPathComponent:file];
    
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    
    return isDirectory;
}

-(BOOL) isDirectoryAtIndexPath:(NSIndexPath*) indexPath{
    
    NSString* path = nil;
    
    @try {
         NSString* fileName = [self.contents objectAtIndex:indexPath.row];
         path = [self.path stringByAppendingPathComponent:fileName];
    } @catch (NSException *exception) {
        return NO;
    }
    
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    
    return isDirectory;
}



-(NSString*) fileSizeFromValue:(unsigned long long) size{
    
    static NSString* units[] = {@"B", @"KB", @"MB", @"GB", @"TB"};
    static int unitsCount = 5;
    CGFloat fileSize = (CGFloat)size;
    
    NSInteger index = 0;
    while(fileSize > 1024 && index < unitsCount){
        fileSize = fileSize / 1024;
        index++;
    }
    return [NSString stringWithFormat:@"%.2f %@", fileSize, units[index]];
}

-(void) cellForHiddenFIles:(EMCustomTableViewCell*) cell isDirectory:(BOOL) isDirectory indexPath:(NSIndexPath*) indexPath{
    
    if ([[self.contents objectAtIndex:indexPath.row] hasPrefix:@"."]){
        if (isDirectory){
            cell.imageView.alpha = 0.5f;
            cell.textLabel.alpha = 0.5f;
        }else{
            cell.image.alpha = 0.5f;
            cell.fileSize.alpha = 0.5f;
            cell.fileDate.alpha = 0.5f;
            cell.fileSize.alpha = 0.5f;
            cell.fileName.alpha = 0.5f;
        }
    }
}

#pragma mark - UITableViewDataSource
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        NSString* fileName = [self.contents objectAtIndex:indexPath.row];
        NSString* path = [self.path stringByAppendingPathComponent:fileName];
        
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        
        NSMutableArray* tempArray = [NSMutableArray arrayWithArray:self.contents];
        [tempArray removeObjectAtIndex:indexPath.row];
        
        self.contents = tempArray;
        
        [self.tableView beginUpdates];
        
            NSIndexPath* newIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
            [self.tableView deleteRowsAtIndexPaths:@[newIndexPath] withRowAnimation:YES];
        
        [self.tableView endUpdates];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contents count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* FolderIdentidier = @"FolderCell";
    static NSString* FileIdentidier = @"FileCell";
    static NSString* AddFIleIdentifier = @"addFolderIdentifier";
    
    if (indexPath.row == [self.contents count]){
        
        UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:AddFIleIdentifier];
        
        return cell;
    }
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    
    if ([self isDirectoryAtIndexPath:indexPath]){
        
        UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:FolderIdentidier];
        
        cell.imageView.alpha = 1.f;
        cell.textLabel.alpha = 1.f;
        
        cell.textLabel.text = fileName;
        
        [self cellForHiddenFIles:cell isDirectory:YES indexPath:indexPath];
        
        return cell;
    }else{
        
        EMCustomTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:FileIdentidier];
        
        NSString* path = [self.path stringByAppendingPathComponent:fileName];
        
        NSDictionary* attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        
        cell.fileName.text = fileName;
        cell.fileSize.text = [self fileSizeFromValue:[attributes fileSize]];
        
        static NSDateFormatter* dateFormatter = nil;
        
        if (!dateFormatter){
            dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"dd/MM/yyyy hh:mm";
        }
        cell.fileDate.text = [dateFormatter stringFromDate:[attributes fileModificationDate]];
        
        cell.image.alpha = 1.f;
        cell.fileSize.alpha = 1.f;
        cell.fileDate.alpha = 1.f;
        cell.fileSize.alpha = 1.f;
        cell.fileName.alpha = 1.f;
        
        [self cellForHiddenFIles:cell isDirectory:NO indexPath:indexPath];
        
        return cell;
    }
    
    
    
    
}

#pragma mark - UITableViewDelegate
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return indexPath.row == [self.contents count] ? UITableViewCellEditingStyleNone : UITableViewCellEditingStyleDelete;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self isDirectoryAtIndexPath:indexPath]){
        return 43.f;
    }else{
        return 80.f;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self isDirectoryAtIndexPath:indexPath]){
        
        NSString* fileName = [self.contents objectAtIndex:indexPath.row];
        NSString* path = [self.path stringByAppendingPathComponent:fileName];
        self.selectedPath = path;

//There are 3 different ways to create a new controller
// -----------------FIRST----------------
        
        //EMDirectoryTableViewController* vc = [[EMDirectoryTableViewController alloc] initWithPath:path];
        //[self.navigationController pushViewController:vc animated:YES];
        
// -----------------SECOND----------------

        //EMDirectoryTableViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EMDirectoryTableViewController"]; // need to use only if you work with storyboard(create labels, buttons, etc on storyboard). So if you'll create new ViewController with storyboard all your(labels, buttons, etc) will create too, but if you init you controller through code there will no any labels and buttons on it.
        //vc.path = path;
        //[self.navigationController pushViewController:vc animated:YES];
        
// -----------------THIRD----------------

        [self performSegueWithIdentifier:@"navigateDeep" sender:nil];
    }else{
        
        if (indexPath.row == [self.contents count]){
            
            UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Folder" message:@"Enter foler name" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                NSString* folderName = alertController.textFields.firstObject.text;
                [self actionAddFolder:folderName];
                
            }];
            [alertController addAction:ok];
            
            UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
            [alertController addAction:cancel];
            
            [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.placeholder = @"Enter folder name";
            }];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
        }

    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    NSString* message = [NSString stringWithFormat:@"%lld B", [cell superSize:[self.path stringByAppendingPathComponent:cell.textLabel.text]]];
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Info" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString* folderName = alertController.textFields.firstObject.text;
        [self actionAddFolder:folderName];
        
    }];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

#pragma mark - Segue
-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    NSLog(@"shouldPerformSegueWithIdentifier: %@", identifier);
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender{
    
    NSLog(@"prepareForSegue: %@", segue.identifier);
    
    EMDirectoryTableViewController* vc = segue.destinationViewController;
    
    vc.path = self.selectedPath;
}

@end