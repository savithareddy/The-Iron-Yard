//
//  XYZAnimalTest.m
//  Why Test Fails
//
//  Created by Savitha Reddy on 6/17/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XYZAnimal.h"

@interface XYZAnimalTest : XCTestCase

@end

@implementation XYZAnimalTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
-(void) testIfCrawling
{
    XYZAnimal *bear = [[XYZAnimal alloc]init];
    bear.amountOfLegs = 4;
    bear.crawling = YES;
    XCTAssertTrue(bear.isCrawling, @"Bear is Crawling");
}

-(void) testIsNotCrawling
{
    XYZAnimal *snake = [[XYZAnimal alloc] init];
    snake.amountOfLegs = 0;
    XCTAssertTrue(!snake.isCrawling, @"Snake is not crawling");
    
    XYZAnimal *human = [[XYZAnimal alloc] init];
    human.amountOfLegs = 2;
    XCTAssertTrue(!human.isCrawling, @"human is not crawling in \"%s\"", __PRETTY_FUNCTION__);
    NSLog(@"NSLogging this Human  \"%s\"", __PRETTY_FUNCTION__);

}
- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

@end
