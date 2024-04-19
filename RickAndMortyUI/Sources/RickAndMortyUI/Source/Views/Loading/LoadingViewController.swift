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
            viewBackground.layer.cornerRadius = 36
        }
    }
    
    var animationView: LottieAnimationView! {
        didSet {
            animationView.frame = view.bounds
            
            // 3. Set animation content mode
            animationView.contentMode = .scaleAspectFit
            
            // 4. Set animation loop mode
            animationView.loopMode = .loop
            
            // 5. Adjust animation speed
            animationView.animationSpeed = 0.74
        }
    }
    
    
    // Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.background
        
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
            make.edges.equalToSuperview().inset(24)
        }
    }
    
    private func addLoadingAnimation() {
        
        animationView = LottieAnimationView(name: Media.Lottie.loading, bundle: Bundle.module)
        
        view.addSubview(animationView)
        
        animationView.snp.makeConstraints { make in
            make.size.equalTo(260)
            make.center.equalToSuperview()
        }
        
        // 6. Play animation
        animationView.play()
    }
}
