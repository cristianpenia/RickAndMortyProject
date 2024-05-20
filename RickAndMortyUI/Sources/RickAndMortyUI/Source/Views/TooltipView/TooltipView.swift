//
//  TooltipView.swift
//
//
//  Created by Cristian Peña Barrios on 20/05/24.
//

import UIKit

public class TooltipView: UIView {

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    public init(text: String) {
        super.init(frame: .zero)
        setupView()
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.8)
        layer.cornerRadius = 8
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    public func show(at point: CGPoint, in view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: point.x),
            bottomAnchor.constraint(equalTo: view.topAnchor, constant: point.y)
        ])
        
        alpha = 0
        transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }
    }
    
    public func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { _ in
            self.removeFromSuperview()
        }
    }
}
