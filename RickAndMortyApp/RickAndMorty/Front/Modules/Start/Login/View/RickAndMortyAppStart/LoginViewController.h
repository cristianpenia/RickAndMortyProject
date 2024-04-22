//
//  RickAndMortyAppStart/LoginViewController.h
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RickAndMortyAppStart/LoginViewInput.h"

@protocol RickAndMortyAppStart/LoginViewOutput;

@interface RickAndMortyAppStart/LoginViewController : UIViewController <RickAndMortyAppStart/LoginViewInput>

@property (nonatomic, strong) id<RickAndMortyAppStart/LoginViewOutput> output;

@end
