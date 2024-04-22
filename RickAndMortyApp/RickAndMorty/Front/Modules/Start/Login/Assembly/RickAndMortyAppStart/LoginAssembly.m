//
//  RickAndMortyAppStart/LoginAssembly.m
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import "RickAndMortyAppStart/LoginAssembly.h"

#import "RickAndMortyAppStart/LoginViewController.h"
#import "RickAndMortyAppStart/LoginInteractor.h"
#import "RickAndMortyAppStart/LoginPresenter.h"
#import "RickAndMortyAppStart/LoginRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation RickAndMortyAppStart/LoginAssembly

- (RickAndMortyAppStart/LoginViewController *)viewStart/Login {
    return [TyphoonDefinition withClass:[RickAndMortyAppStart/LoginViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterStart/Login]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterStart/Login]];
                          }];
}

- (RickAndMortyAppStart/LoginInteractor *)interactorStart/Login {
    return [TyphoonDefinition withClass:[RickAndMortyAppStart/LoginInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterStart/Login]];
                          }];
}

- (RickAndMortyAppStart/LoginPresenter *)presenterStart/Login{
    return [TyphoonDefinition withClass:[RickAndMortyAppStart/LoginPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewStart/Login]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorStart/Login]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerStart/Login]];
                          }];
}

- (RickAndMortyAppStart/LoginRouter *)routerStart/Login{
    return [TyphoonDefinition withClass:[RickAndMortyAppStart/LoginRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewStart/Login]];
                          }];
}

@end
