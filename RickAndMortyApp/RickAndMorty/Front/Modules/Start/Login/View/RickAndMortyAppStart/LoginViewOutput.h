//
//  RickAndMortyAppStart/LoginViewOutput.h
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RickAndMortyAppStart/LoginViewOutput <NSObject>

/**
 @author Cristian Peña

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

@end
