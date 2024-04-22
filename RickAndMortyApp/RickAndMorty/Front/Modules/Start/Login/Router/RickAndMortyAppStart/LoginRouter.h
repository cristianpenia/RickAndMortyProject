//
//  RickAndMortyAppStart/LoginRouter.h
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import "RickAndMortyAppStart/LoginRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface RickAndMortyAppStart/LoginRouter : NSObject <RickAndMortyAppStart/LoginRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
