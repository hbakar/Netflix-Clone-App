//
//  SearchViewController.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit

final class SearchViewController: UIViewController {
  
    @IBOutlet weak var searchTableView: UITableView!
    
    var viewModel: SearchViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCell()
        registerTableView()
        configureUI()
      
        viewModel?.delegate = self
        viewModel?.currentPage = 1
        let page = String(viewModel?.currentPage ?? 1)
        let endpoint = Endpoint.discover(page: page)
        viewModel?.fetchData(with: endpoint)
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Search"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func registerTableView() {
        searchTableView.dataSource = self
        searchTableView.delegate = self
    }
    
    private func registerTableViewCell() {
        let nibName = String(describing: SearchTableItemCell.self)
        let nib = UINib(nibName: nibName, bundle: .main)
        searchTableView.register(nib, forCellReuseIdentifier: nibName)
    }
}

extension SearchViewController: tableV {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.discoverList?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchTableItemCell.self), for: indexPath) as? SearchTableItemCell else { return UITableViewCell() }
        
        guard let list = viewModel?.discoverList?.results else { return UITableViewCell() }
        
        let model = list[indexPath.row]
        
        cell.prepareForDiscoverItem(with: TitleViewModel(titleName: model.original_title ?? model.original_name ?? "Unknown*", posterURL: model.poster_path ?? ""))
        return cell
    }
    
    
}

extension SearchViewController: SearchViewModelDelegate {
    func notify(_ event: SearchViewModelEvents) {
        switch event {
        case .didFetchSearchList:
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        case .fetchFailed(let error):
            print(error.localizedDescription)
        }
    }
}
