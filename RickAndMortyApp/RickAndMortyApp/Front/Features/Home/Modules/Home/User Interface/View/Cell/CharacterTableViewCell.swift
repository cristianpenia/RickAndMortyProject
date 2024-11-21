//
//  CharacterTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 26/06/24.
//

import UIKit
import SnapKit
import Kingfisher
import RickAndMortyUI

class CharacterTableViewCell: UITableViewCell {
    
    
    // MARK: Views
    
    var contentBackView: UIView! {
        didSet {
            contentBackView.backgroundColor = Color.gray
            contentBackView.layer.cornerRadius = 20
        }
    }
    
    var profileImageView: UIImageView! {
        didSet {
            profileImageView.contentMode = .scaleAspectFill
            profileImageView.layer.masksToBounds = false
            profileImageView.layer.borderWidth = 1.0
            profileImageView.layer.borderColor = UIColor.clear.cgColor
            profileImageView.layer.cornerRadius = 70 / 2.0
            profileImageView.clipsToBounds = true
        }
    }
    
    var nameLabel: UILabel! {
        didSet {
            nameLabel.textColor = .black
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        contentBackView = UIView()
        
        addSubview(contentBackView)
        
        contentBackView.snp.makeConstraints { make in
            make.size.equalTo(114)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        profileImageView = UIImageView()
        
        contentBackView.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(70)
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        nameLabel = UILabel()
        
        contentBackView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top)
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    public func custom(with character: CharacterResultResponse) {
        
        let profileURL = URL(string: character.image)!
        
        profileImageView.kf.setImage(with: profileURL)
        
        nameLabel.text = character.name
    }
    
    override func prepareForReuse() {
        nameLabel.text = ""
    }
}
