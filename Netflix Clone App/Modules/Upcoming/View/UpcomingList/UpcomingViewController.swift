//
//  UpcomingViewController.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit
import SVProgressHUD

final class UpcomingViewController: UIViewController {
    
    @IBOutlet weak var upComingTableView: UITableView!
    
    var viewModel: UpcomingViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show()
        configureUI()
        setupTableViewCell()
        setupTableView()
        
        viewModel?.currentPage = 1
        let currentPage: String = String(viewModel?.currentPage ?? 1)
        viewModel?.delegate = self
        let endpoint = Endpoint.upcoming(page: currentPage)
        viewModel?.fetchUpcoming(with: endpoint)
        SVProgressHUD.dismiss()
    }
    
    private func setupTableView() {
        upComingTableView.delegate = self
        upComingTableView.dataSource = self
    }
    
    private func setupTableViewCell() {
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
        return viewModel?.upcomingList?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let model = viewModel?.upcomingList?.results?[indexPath.row],let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleTableViewCell.self), for: indexPath) as? TitleTableViewCell else { return UITableViewCell() }
        
        cell.prepareForUpcomingItem(with: TitleViewModel(titleName: model.original_title ?? model.original_name ?? "Unknown*", posterURL: model.poster_path ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailViewController = DetailViewController(nibName: String(describing: DetailViewController.self), bundle: .main)
        
        self.modalPresentationStyle = .pageSheet
        self.modalTransitionStyle = .crossDissolve
        self.present(detailViewController,animated: true)
    }
}

extension UpcomingViewController: UpcomingViewModelDelegate {
    func notify(_ event: UpcomingViewModelEvents) {
        switch event {
        case .didFetchUpcoming:
            
            print(viewModel?.upcomingList?.results ?? [])
            DispatchQueue.main.async {
                self.upComingTableView.reloadData()
            }
        case .fetchFailedUpcoming(let error):
            print(error.localizedDescription)
        }
    }
}
