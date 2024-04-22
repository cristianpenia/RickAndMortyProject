//
//  RickAndMortyAppStart/LoginRouterTests.m
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RickAndMortyAppStart/LoginRouter.h"

@interface RickAndMortyAppStart/LoginRouterTests : XCTestCase

@property (nonatomic, strong) RickAndMortyAppStart/LoginRouter *router;

@end

@implementation RickAndMortyAppStart/LoginRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[RickAndMortyAppStart/LoginRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
