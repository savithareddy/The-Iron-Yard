//
//  TDLSingleton.m
//  ToDo
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TDLSingleton.h"

@interface TDLSingleton () //create the interface for the property such that it is local to this file
@property (nonatomic) NSMutableArray *listNames;
@end

@implementation TDLSingleton
//{
//    NSMutableArray *listItems;
//}

+(TDLSingleton *) sharedCollection
{
    static dispatch_once_t create;
    static TDLSingleton *singleton  = nil;
    
    dispatch_once(&create, ^{
        singleton = [[TDLSingleton alloc]init];
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

-(NSMutableArray *) listNames // getter method // to make it always an array and not making it nothing // so  u can add array items
{
    if(_listNames == nil)
    {
        _listNames = [@[]mutableCopy];// doing this will always initiate the array
    }
    return _listNames; // returns nil now
}
-(void)addListName:(NSDictionary *)listName
{
    [self.listNames addObject:listName];// self.listItems calls the getter method and initialises the array
    [self saveData];
}

-(NSArray *)allListNames
{
    return [self.listNames copy];// copy copies any object whose properties are already set
   // return [NSArray arrayWithArray:self.listItems]; //earlier way of representing
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
    //NSLog(@"%@");
    if([[NSFileManager defaultManager]fileExistsAtPath:path] )
    {
       self. listNames = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
}


@end
