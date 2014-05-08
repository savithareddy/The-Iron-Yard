//
//  GHASingleton.m
//  GitHubApp
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "GHASingleton.h"

@interface GHASingleton ()

@property (nonatomic) NSMutableArray *listNames;

@end

@implementation GHASingleton

+(GHASingleton *) sharedCollection
{
    static dispatch_once_t create;
    static GHASingleton *singleton  = nil;
    
    dispatch_once(&create, ^{
        singleton = [[GHASingleton alloc]init];
    });
    
    return singleton;
}

-(id) init
{
    self=[super init];
    if(self)
    {
        [self loadListNames];
    }
    return self;
}

-(NSMutableArray *) listNames
{
    if(_listNames == nil)
    {
        _listNames = [@[]mutableCopy];
    }
    return _listNames;
}
-(void)addListName:(NSDictionary *)listName
{
    [self.listNames addObject:listName];
    [self saveData];
}

-(NSArray *)allListNames
{
    return [self.listNames copy];
}
-(void) removeListName:(NSDictionary *)listName
{
    [self.listNames removeObjectIdenticalTo:listName];
    [self saveData];
}
-(void) removeListNameAtIndex:(NSInteger)index
{
    [self.listNames removeObjectAtIndex:index];
    [self saveData];
}

- (void)saveData
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.listNames];
    [data writeToFile:path options:NSDataWritingAtomic error:nil];
}


- (NSString *)listArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask,YES);
    NSString *documentDirectory = documentDirectories[0];
    return [ documentDirectory stringByAppendingPathComponent:@"listdata.data"];
    
}
- (void)loadListNames
{
    NSString *path = [self listArchivePath];
    if([[NSFileManager defaultManager]fileExistsAtPath:path] )
    {
        self. listNames = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
}


@end
