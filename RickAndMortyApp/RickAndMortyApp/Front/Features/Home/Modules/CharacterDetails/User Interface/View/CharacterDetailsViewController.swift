//
//  CharacterDetailsViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 14/11/24.
//  
//

import UIKit
import SnapKit
import Kingfisher
import RickAndMortyUI

class CharacterDetailsViewController: BaseViewController {
    

    // MARK: - Outlet
    
    private var contentBackView: UIView! {
        didSet {
            contentBackView.backgroundColor = Color.gray
            contentBackView.layer.cornerRadius = 12
        }
    }
    
    private var profileImageView: UIImageView! {
        didSet {
            profileImageView.contentMode = .scaleAspectFill
            profileImageView.layer.masksToBounds = false
            profileImageView.layer.borderWidth = 1.0
            profileImageView.layer.borderColor = UIColor.clear.cgColor
            profileImageView.layer.cornerRadius = 200 / 2.0
            profileImageView.clipsToBounds = true
        }
    }
    
    private var nameLabel: UILabel! {
        didSet {
            nameLabel.textColor = .black
            nameLabel.textAlignment = .center
        }
    }
    

    // MARK: - Property

    var output: CharacterDetailsViewOutput!
    
    fileprivate var character: CharacterResultResponse? {
        didSet {
            let profileURL = URL(string: character!.image)!
            
            profileImageView.kf.setImage(with: profileURL)
            nameLabel.text = character?.name
        }
    }
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        output.viewIsReady()
    }


    // MARK: - Setup
    
    private func setup() {
        contentBackView = UIView()
        
        view.addSubview(contentBackView)
        
        contentBackView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide).inset(16)
        }
        
        profileImageView = UIImageView()
        
        contentBackView.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.top.equalTo(contentBackView.snp.top).inset(16)
            make.centerX.equalToSuperview()
        }
        
        nameLabel = UILabel()
        
        contentBackView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    
    // MARK: - Other
}


// MARK: CharacterDetailsViewInput

extension CharacterDetailsViewController: CharacterDetailsViewInput {
    
    func setUpInitialState(character: CharacterResultResponse) {
        self.character = character
    }

    func moduleInput() -> CharacterDetailsModuleInput {
        return output as! CharacterDetailsModuleInput
    }
}
