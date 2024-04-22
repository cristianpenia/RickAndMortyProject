//
//  RickAndMortyAppStart/LoginViewControllerTests.m
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RickAndMortyAppStart/LoginViewController.h"

#import "RickAndMortyAppStart/LoginViewOutput.h"

@interface RickAndMortyAppStart/LoginViewControllerTests : XCTestCase

@property (nonatomic, strong) RickAndMortyAppStart/LoginViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation RickAndMortyAppStart/LoginViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[RickAndMortyAppStart/LoginViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RickAndMortyAppStart/LoginViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов RickAndMortyAppStart/LoginViewInput

@end
