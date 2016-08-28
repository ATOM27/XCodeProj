//
//  UITableViewCellCategory.m
//  ObjCUITableViewNavigationPart2
//
//  Created by Eugene Mekhedov on 28.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "UITableViewCellCategory.h"

@implementation UITableViewCell (CellCategory)

-(unsigned long long) superSize:(NSString *)path{
    
    unsigned long long size = 0;
    
    NSArray* contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    for (NSString* cont in contents){
        
        path = [path stringByAppendingPathComponent:cont];
        
        BOOL isDirectory = NO;
        
        [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
        
        if (isDirectory){
            size += [self superSize:path];
            path = path.stringByDeletingLastPathComponent;
        }else{
            size += [[[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil] fileSize];
            path = path.stringByDeletingLastPathComponent;
        }
    }
    return size;
}

@end