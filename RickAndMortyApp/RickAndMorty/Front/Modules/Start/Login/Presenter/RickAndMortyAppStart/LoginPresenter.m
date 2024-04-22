//
//  RickAndMortyAppStart/LoginPresenter.m
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import "RickAndMortyAppStart/LoginPresenter.h"

#import "RickAndMortyAppStart/LoginViewInput.h"
#import "RickAndMortyAppStart/LoginInteractorInput.h"
#import "RickAndMortyAppStart/LoginRouterInput.h"

@implementation RickAndMortyAppStart/LoginPresenter

#pragma mark - Методы RickAndMortyAppStart/LoginModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы RickAndMortyAppStart/LoginViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

#pragma mark - Методы RickAndMortyAppStart/LoginInteractorOutput

@end
