//
//  HomeHomeViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 23/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit
import RickAndMortyUI

class HomeViewController: BaseViewController {
    
    
    // MARK: Views
    
    var contentTableView: UITableView! {
        didSet {
            contentTableView.dataSource = self
            contentTableView.delegate = self
            contentTableView.separatorStyle = .none
            contentTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "CharacterTableViewCell")
        }
    }
    
    
    // MARK: Properties
    
    var characters: [ResultResponse] = [] {
        didSet {
            contentTableView.reloadData()
        }
    }
//    private var characterView = CharacterView()
    
//    private var viewModel: CharacterViewModel?
    var output: HomeViewOutput!
    
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        
        output.viewIsReady()
        
//        test()
    }
    
    private func addViews() {
        
        contentTableView = UITableView()
        
        view.addSubview(contentTableView)
        
        contentTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.size.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
            
//    private func test() {
//        
//        view.addSubview(characterView)
//        
//        characterView.frame = view.bounds
//        
//        let url = URL(string: "https://static.wikia.nocookie.net/rick-y-morty-espanol/images/4/4f/Rick_Sánchez_Joven.jpg/revision/latest/scale-to-width/360?cb=20231130231801&path-prefix=es")
//        
//        let characterModel = Character(profilePictureURL: url!, username: "Rick Sanchez", description: "Viejo loco")
//        
//        viewModel = CharacterViewModel(character: characterModel)
//        
//        characterView.viewModel = viewModel
//    }
}


// MARK: HomeViewInput

extension HomeViewController: HomeViewInput {
    
    func setupInitialState(with characters: [ResultResponse]) {
        self.characters = characters
    }
    
    func showLoading() {
        showViewLoading()
    }
    
    func hideLoading() {
        hideViewLoading()
    }
}


// MARK: UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentTableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as! CharacterTableViewCell
        
        let character = characters[indexPath.row]
        
        cell.custom(with: character)
        
        return cell
    }
}


// MARK: UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contentTableView.deselectRow(at: indexPath, animated: true)
    }
}
