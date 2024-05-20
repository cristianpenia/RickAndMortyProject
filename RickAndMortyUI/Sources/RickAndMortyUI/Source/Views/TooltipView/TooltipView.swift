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
        backgroundColor = .clear
        layer.cornerRadius = 8
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        let path = createTooltipPath(in: rect)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.gray.withAlphaComponent(0.7).cgColor
        layer.insertSublayer(shapeLayer, at: 0)
    }
    
    private func createTooltipPath(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        let cornerRadius: CGFloat = 0.0 // Ajusta el radio de la esquina para darle la forma redondeada
        let pointerSize: CGFloat = 10.0 // Ajusta el tamaño del puntero para que apunte hacia arriba

        path.move(to: CGPoint(x: rect.midX - pointerSize, y: rect.minY + pointerSize)) // Mueve el puntero hacia abajo

        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY)) // Agrega el puntero hacia arriba

        path.addLine(to: CGPoint(x: rect.midX + pointerSize, y: rect.minY + pointerSize)) // Agrega el puntero hacia abajo

        path.addArc(withCenter: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + pointerSize + cornerRadius), radius: cornerRadius, startAngle: CGFloat(3 * Double.pi / 2), endAngle: CGFloat(0), clockwise: true)

        path.addArc(withCenter: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi / 2), clockwise: true)

        path.addArc(withCenter: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: CGFloat(Double.pi / 2), endAngle: CGFloat(Double.pi), clockwise: true)

        path.addArc(withCenter: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + pointerSize + cornerRadius), radius: cornerRadius, startAngle: CGFloat(Double.pi), endAngle: CGFloat(3 * Double.pi / 2), clockwise: true)

        path.close()
        
        return path
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

