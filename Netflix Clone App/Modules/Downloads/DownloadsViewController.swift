//
//  DownloadsViewController.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit

final class DownloadsViewController: UIViewController {

    @IBOutlet weak var downloadedTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Downloads"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        setupTableView()
    }
    
    private func setupTableView(){
        downloadedTable.delegate = self
        downloadedTable.dataSource = self
    }

}

extension DownloadsViewController: tableV {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell()
        return cell
        
    }
}
