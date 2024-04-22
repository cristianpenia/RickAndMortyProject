//
//  RickAndMortyAppStart/LoginAssembly_Testable.h
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import "RickAndMortyAppStart/LoginAssembly.h"

@class RickAndMortyAppStart/LoginViewController;
@class RickAndMortyAppStart/LoginInteractor;
@class RickAndMortyAppStart/LoginPresenter;
@class RickAndMortyAppStart/LoginRouter;

/**
 @author Cristian Peña

 Extension, который делает приватные методы фабрики открытыми для тестирования. 
 */
@interface RickAndMortyAppStart/LoginAssembly ()

- (RickAndMortyAppStart/LoginViewController *)viewStart/Login;
- (RickAndMortyAppStart/LoginPresenter *)presenterStart/Login;
- (RickAndMortyAppStart/LoginInteractor *)interactorStart/Login;
- (RickAndMortyAppStart/LoginRouter *)routerStart/Login;

@end
