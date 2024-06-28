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
            profileImageView.layer.cornerRadius = 80 / 2.0
            profileImageView.clipsToBounds = true
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
    }
    
    public func custom(with character: ResultResponse) {
        
        let profileURL = URL(string: character.image)!
        
        profileImageView.kf.setImage(with: profileURL)
    }
    
    override func prepareForReuse() {
        profileImageView = UIImageView()
    }
}
