//
//  MFDAppDelegate.h
//  MyFirstData
//
//  Created by Savitha Reddy on 5/14/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
