//
//  RickAndMortyAppStart/LoginPresenter.h
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import "RickAndMortyAppStart/LoginViewOutput.h"
#import "RickAndMortyAppStart/LoginInteractorOutput.h"
#import "RickAndMortyAppStart/LoginModuleInput.h"

@protocol RickAndMortyAppStart/LoginViewInput;
@protocol RickAndMortyAppStart/LoginInteractorInput;
@protocol RickAndMortyAppStart/LoginRouterInput;

@interface RickAndMortyAppStart/LoginPresenter : NSObject <RickAndMortyAppStart/LoginModuleInput, RickAndMortyAppStart/LoginViewOutput, RickAndMortyAppStart/LoginInteractorOutput>

@property (nonatomic, weak) id<RickAndMortyAppStart/LoginViewInput> view;
@property (nonatomic, strong) id<RickAndMortyAppStart/LoginInteractorInput> interactor;
@property (nonatomic, strong) id<RickAndMortyAppStart/LoginRouterInput> router;

@end
