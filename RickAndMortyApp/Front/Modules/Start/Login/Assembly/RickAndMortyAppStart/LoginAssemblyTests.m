//
//  RickAndMortyAppStart/LoginAssemblyTests.m
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "RickAndMortyAppStart/LoginAssembly.h"
#import "RickAndMortyAppStart/LoginAssembly_Testable.h"

#import "RickAndMortyAppStart/LoginViewController.h"
#import "RickAndMortyAppStart/LoginPresenter.h"
#import "RickAndMortyAppStart/LoginInteractor.h"
#import "RickAndMortyAppStart/LoginRouter.h"

@interface RickAndMortyAppStart/LoginAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) RickAndMortyAppStart/LoginAssembly *assembly;

@end

@implementation RickAndMortyAppStart/LoginAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.assembly = [[RickAndMortyAppStart/LoginAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Тестирование создания элементов модуля

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [RickAndMortyAppStart/LoginViewController class];
    NSArray *protocols = @[
                           @protocol(RickAndMortyAppStart/LoginViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly viewStart/Login];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [RickAndMortyAppStart/LoginPresenter class];
    NSArray *protocols = @[
                           @protocol(RickAndMortyAppStart/LoginModuleInput),
                           @protocol(RickAndMortyAppStart/LoginViewOutput),
                           @protocol(RickAndMortyAppStart/LoginInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly presenterStart/Login];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [RickAndMortyAppStart/LoginInteractor class];
    NSArray *protocols = @[
                           @protocol(RickAndMortyAppStart/LoginInteractorInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
													      
    // when
    id result = [self.assembly interactorStart/Login];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [RickAndMortyAppStart/LoginRouter class];
    NSArray *protocols = @[
                           @protocol(RickAndMortyAppStart/LoginRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly routerStart/Login];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
