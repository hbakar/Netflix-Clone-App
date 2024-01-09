//
//  HomeViewController.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableViewCell()
        setupTableView()
        
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
