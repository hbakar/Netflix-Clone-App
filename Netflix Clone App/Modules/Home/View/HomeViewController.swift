//
//  HomeViewController.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableViewCell()
        setupTableView()
        configureNavigationBar()
        
        viewModel?.delegate = self
        
        let endpoint1 = Endpoint.trendingMovie
        viewModel?.fetchTrendingMovie(with: endpoint1)
        
        let heroHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 450))
        heroHeaderView.backgroundColor = .systemGreen
        homeTableView.tableHeaderView = heroHeaderView
        
        
    }
    
    private func setupTableViewCell() {
        let nibName = String(describing: HomeTableViewCell.self)
        let nib = UINib(nibName: nibName, bundle: .main)
        homeTableView.register(nib, forCellReuseIdentifier: nibName)
    }
    
    private func setupTableView(){
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    func configureNavigationBar()
    {
        //navigationController?.navigationBar.isHidden = true
  //      navigationController?.navigationBar.barTintColor = .white
    //    navigationController?.navigationBar.isTranslucent = true
        
       // navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
      //  navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
    }
}

extension HomeViewController: tableV {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func notify(_ event: HomeViewModelEvents) {
        switch event {
        case .didFetchTrendingMovieList:
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        case .fetchFailedTrendingMovieList(let error):
            print(error.localizedDescription)
        case .didFetchTrendingTVList:
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        case .fetchFailedTrendingTVs(let error):
            print(error.localizedDescription)
        case .didFetchPopularList:
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        case .fetchFailedPopularList(let error):
            print(error.localizedDescription)
        case .didFetchUpcomingList:
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        case .fetchFailedUpcomingList(let error):
            print(error.localizedDescription)
        case .didFetchTopRatedList:
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        case .fetchFailedTopRatedList(let error):
            print(error.localizedDescription)
        }
    }
}
