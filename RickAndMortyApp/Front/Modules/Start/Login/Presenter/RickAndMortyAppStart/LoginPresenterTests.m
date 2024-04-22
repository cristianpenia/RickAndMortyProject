//
//  RickAndMortyAppStart/LoginPresenterTests.m
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RickAndMortyAppStart/LoginPresenter.h"

#import "RickAndMortyAppStart/LoginViewInput.h"
#import "RickAndMortyAppStart/LoginInteractorInput.h"
#import "RickAndMortyAppStart/LoginRouterInput.h"

@interface RickAndMortyAppStart/LoginPresenterTests : XCTestCase

@property (nonatomic, strong) RickAndMortyAppStart/LoginPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation RickAndMortyAppStart/LoginPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[RickAndMortyAppStart/LoginPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(RickAndMortyAppStart/LoginInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(RickAndMortyAppStart/LoginRouterInput));
    self.mockView = OCMProtocolMock(@protocol(RickAndMortyAppStart/LoginViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RickAndMortyAppStart/LoginModuleInput

#pragma mark - Тестирование методов RickAndMortyAppStart/LoginViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов RickAndMortyAppStart/LoginInteractorOutput

@end
