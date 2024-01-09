//
//  UpcomingViewController.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit

final class UpcomingViewController: UIViewController {
    
    @IBOutlet weak var upComingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableViewCell()
        setupTableView()
        
        configureUI()
    }
    
    private func setupTableView() {
        upComingTableView.delegate = self
        upComingTableView.dataSource = self
    } 
    
    private func setupTableViewCell() {
        let nibName = String(describing: TitleTableViewCell.self)
        let nib = UINib(nibName: nibName, bundle: .main)
        upComingTableView.register(nib, forCellReuseIdentifier: nibName)
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    
}

extension UpcomingViewController: tableV {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}
