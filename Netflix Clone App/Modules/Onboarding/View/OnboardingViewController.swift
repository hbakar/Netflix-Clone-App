//
//  OnboardingViewController.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 11.01.2024.
//

import UIKit

final class OnboardingViewController: UIViewController, collectionV {
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            
            if currentPage == 3 {
                DispatchQueue.main.async {
                    let backgroundImageView = UIImageView(frame: self.view.bounds)
                           backgroundImageView.image = UIImage(named: "o4")
                           backgroundImageView.contentMode = .scaleAspectFill
                }
            }
        }
    }
    
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: OnboardingViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionCell()
        setupCollection()
        viewModel?.delegate = self
        viewModel?.getData()
        pageControl.numberOfPages = viewModel?.slideList.count ?? 0
    }
    
    private func setupCollectionCell() {
        let nibName = String(describing: OnboardingCell.self)
        let nib = UINib(nibName: nibName, bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    private func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.slideList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = viewModel?.slideList[indexPath.row],let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: OnboardingCell.self), for: indexPath) as? OnboardingCell else {return UICollectionViewCell()}
        
        cell.prepareforOnboardItem(with: model)
        return cell
    }
    
    @IBAction func btnSignInClicked(_ sender: Any) {
        let mainViewController = MainTabController()
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: true, completion: nil)
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

extension OnboardingViewController: OnboardingViewModelDelegate {
    
    func notify(_ event: OnboardingViewModelEvent) {
        switch event {
        case .didFetchOnboardingList:
            
            DispatchQueue.main.async {
             
                self.collectionView.reloadData()
                // UserDefaults.standard.set(true, forKey: "onboardAcildiMi")
                
                /*
                 DispatchQueue.main.async {
                 let mainViewController = MainTabController()
                 mainViewController.modalPresentationStyle = .fullScreen
                 self.present(mainViewController, animated: true, completion: nil)
                 }
                 */
            }
        case .fetchFailed(let error):
            print(error.localizedDescription)
        }
    }
}
