//
//  PrimaryUIButton.swift
//
//
//  Created by Cristian Peña Barrios on 26/06/24.
//

import UIKit

public class PrimaryUIButton: BaseUIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        
        self.layer.cornerRadius = 12
        self.backgroundColor = Color.green
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }
}
