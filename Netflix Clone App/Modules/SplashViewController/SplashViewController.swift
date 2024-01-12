//
//  SplashViewController.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 10.01.2024.
//

import UIKit

final class SplashViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
       
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        self.logoImage.alpha = 0
        setAnimation()
    }
    

}

extension SplashViewController {
    
    
    private func setAnimation() {
        
        UIView.animate(withDuration: 0.8,animations: {
            
            self.logoImage.alpha = 0.3
            
        }, completion: { (true) in
          
            UIView.animate(withDuration: 0.8,animations: {
                
                self.logoImage.alpha = 0.5
                self.logoImage.image = UIImage(named: "netflix-logo-action2")
            }, completion: { (true) in
              
                UIView.animate(withDuration: 0.8, animations: {
                    
                    self.logoImage.alpha = 1
                    self.logoImage.image = UIImage(named: "netflix-logo-action3")
                    
                }, completion: { (true) in
                    
                    UIView.animate(withDuration: 0.8, animations: {
                        
                        self.logoImage.transform = CGAffineTransform(scaleX: 10, y: 10)
                        self.view.backgroundColor = .primaryColor
                  
                    }, completion: { (true) in
                        self.logoImage.alpha = 0
                        self.view.backgroundColor = .primaryColor
                        
                        let onboardingViewController = OnboardingViewController(nibName: String(describing: OnboardingViewController.self), bundle: .main)
                        
                        onboardingViewController.viewModel = OnboardingViewModel()
                        
                       self.navigationController?.show(onboardingViewController, sender: nil)
                        
                    })
                    
                })
                
            })
            
        })
    }
}
