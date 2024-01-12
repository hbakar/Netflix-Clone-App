//
//  DetailViewController.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 12.01.2024.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewCell()
        setupTableView()
    }
    
    private func setupTableView() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
    
    private func setupTableViewCell() {
        let nibName = String(describing: DetailItemCell.self)
        let nib = UINib(nibName: nibName, bundle: .main)
        detailTableView.register(nib, forCellReuseIdentifier: nibName)
    }
}

extension DetailViewController: tableV {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailItemCell.self), for: indexPath) as? DetailItemCell else { return UITableViewCell()
            
        }
        
        
        cell.delegate = self
        cell.indexPath = indexPath
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 527
    }
}

extension DetailViewController: DetailItemCellDelegate {
    
    func didClickedCloseButton() {
        self.dismiss(animated: true)
    }
}
