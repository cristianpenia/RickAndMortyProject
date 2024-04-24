//
//  File.swift
//
//
//  Created by Cristian Peña Barrios on 23/04/24.
//

import UIKit
import Combine
import SnapKit

public class CharacterView: UIView {
    
    
    // MARK: Views
    
    private var profileImageView: UIImageView! {
        didSet {
            profileImageView.contentMode = .scaleAspectFill
            profileImageView.layer.cornerRadius = 190 / 2
            profileImageView.clipsToBounds = true
        }
    }
    
    private var nameTitleLabel: UILabel! {
        didSet {
            nameTitleLabel.text = "Nombre"
            nameTitleLabel.textColor = .gray
        }
    }
    
    private var nameLabel: UILabel!
    
    
    // MARK: Properties
    
    private var cancellables: Set<AnyCancellable> = []
    
    public var viewModel: CharacterViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    
    // MARK: Private Methods
    
    private func setupView() {
        
        backgroundColor = .clear
        
        addImageView()
        addLabels()
    }
    
    private func addImageView() {
        profileImageView = UIImageView()
        
        addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(190)
            make.top.equalToSuperview().inset(80)
            make.centerX.equalToSuperview()
        }
    }
    
    private func addLabels() {
        nameTitleLabel = UILabel()
        
        addSubview(nameTitleLabel)
        
        nameTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(profileImageView.snp.bottom).offset(40)
        }
        
        nameLabel = UILabel()
        
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(nameTitleLabel.snp.bottom).offset(4)
        }
    }
    
    
    private func bindViewModel() {
        viewModel?.$character
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] character in
                self?.nameLabel.text = character.username
                self?.loadImage(from: character.profilePictureURL)
            })
            .store(in: &cancellables)
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.profileImageView.image = image
            }
        }.resume()
    }
}
