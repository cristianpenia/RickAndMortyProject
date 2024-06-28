//
//  HomeHomeViewInput.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 23/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

protocol HomeViewInput: AnyObject {
    func setupInitialState(with characters: [ResultResponse])
    func showLoading()
    func hideLoading()
}