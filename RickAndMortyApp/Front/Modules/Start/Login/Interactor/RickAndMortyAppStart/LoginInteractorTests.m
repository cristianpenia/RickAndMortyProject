//
//  RickAndMortyAppStart/LoginInteractorTests.m
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RickAndMortyAppStart/LoginInteractor.h"

#import "RickAndMortyAppStart/LoginInteractorOutput.h"

@interface RickAndMortyAppStart/LoginInteractorTests : XCTestCase

@property (nonatomic, strong) RickAndMortyAppStart/LoginInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation RickAndMortyAppStart/LoginInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[RickAndMortyAppStart/LoginInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RickAndMortyAppStart/LoginInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RickAndMortyAppStart/LoginInteractorInput

@end
