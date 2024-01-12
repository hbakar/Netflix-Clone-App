//
//  DownloadsViewController.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit

final class DownloadsViewController: UIViewController {

    @IBOutlet weak var downloadedTable: UITableView!
    
    var viewModel: DownloadsListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupTableViewCell()
        setupTableView()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Downloads"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupTableView() {
        downloadedTable.delegate = self
        downloadedTable.dataSource = self
    }
    
    private func setupTableViewCell() {
        let nibName = String(describing: DownloadsTableItemCell.self)
        let nib = UINib(nibName: nibName, bundle: .main)
        downloadedTable.register(nib, forCellReuseIdentifier: nibName)
    }
    
}

extension DownloadsViewController: tableV {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.downloadsList?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = viewModel?.downloadsList?.results?[indexPath.row],let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DownloadsTableItemCell.self), for: indexPath) as? DownloadsTableItemCell else { return UITableViewCell()
        }
        
        cell.prepareForDownloadsItem(with: TitleViewModel(titleName: model.original_title ?? model.original_name ?? "Unknown*", posterURL: model.poster_path ?? ""))
        return cell
    }
}
