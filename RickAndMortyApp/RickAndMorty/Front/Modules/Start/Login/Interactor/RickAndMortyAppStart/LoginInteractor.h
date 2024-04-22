//
//  RickAndMortyAppStart/LoginInteractor.h
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import "RickAndMortyAppStart/LoginInteractorInput.h"

@protocol RickAndMortyAppStart/LoginInteractorOutput;

@interface RickAndMortyAppStart/LoginInteractor : NSObject <RickAndMortyAppStart/LoginInteractorInput>

@property (nonatomic, weak) id<RickAndMortyAppStart/LoginInteractorOutput> output;

@end
