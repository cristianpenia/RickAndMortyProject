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
            contentTableView.register(CharacterTableViewCell.self,
                                      forCellReuseIdentifier: CharacterTableViewCell.identifier)
        }
    }
    
    
    // MARK: Properties
    
    var characters: [CharacterResultResponse] = [] {
        didSet {
            contentTableView.reloadData()
        }
    }
    
    var output: HomeViewOutput!
    
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let navigationController {
            navigationController.isNavigationBarHidden = true
        }
    }
    
    
    private func setup() {
        
        addViews()
    }
    
    private func addViews() {
        
        contentTableView = UITableView()
        
        view.addSubview(contentTableView)
        
        contentTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(80)
        }
        
        let tableFooterView = UIView()
        
        tableFooterView.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
        
        contentTableView.tableFooterView = tableFooterView
    }
}


// MARK: HomeViewInput

extension HomeViewController: HomeViewInput {
    
    func setupInitialState(with characters: [CharacterResultResponse]) {
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
        let cell = contentTableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier,
                                                        for: indexPath) as! CharacterTableViewCell
        
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
        
        output.didTapCharacterCell(character: characters[indexPath.row])
    }
}
