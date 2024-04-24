//
//  LoadingViewController.swift
//
//
//  Created by Cristian Pena TWW on 19/04/24.
//

import UIKit
import Lottie
import SnapKit

public class LoadingViewController: UIViewController {
    
    
    // Views
    
    var viewBackground: UIView! {
        didSet {
            viewBackground.backgroundColor = Color.viewControllerBackground
            viewBackground.layer.cornerRadius = 48
        }
    }
    
    var animationView: LottieAnimationView! {
        didSet {
            animationView.frame = view.bounds
            
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.animationSpeed = 0.74
        }
    }
    
    
    // Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.backgroundLine
        
        addViews()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        animationView.stop()
    }
    
    
    // Private Methods
    
    private func addViews() {
        
        addBackground()
        addLoadingAnimation()
    }
    
    private func addBackground() {
        
        viewBackground = UIView()
        
        view.addSubview(viewBackground)
        
        viewBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(6)
        }
    }
    
    private func addLoadingAnimation() {
        
        animationView = LottieAnimationView(name: Media.Lottie.loading, bundle: Bundle.module)
        
        viewBackground.addSubview(animationView)
        
        animationView.snp.makeConstraints { make in
            make.size.equalTo(260)
            make.center.equalToSuperview()
        }
        
        animationView.play()
    }
}
