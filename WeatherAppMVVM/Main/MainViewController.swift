//
//  ViewController.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 05.05.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    var networkDelegate = NetworkDelegate()
    
    var mainViewModel: MainViewModelProtocol! {
        didSet {
            
        }
    }
    
    let tableView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstInitialization()
        setupConstaints()
        
    }

    private func firstInitialization() {
        view.backgroundColor = .white
        
        mainViewModel = MainViewModel()
        setupNavigationBar()
        
    }

    private func setupConstaints() {
        
    }
}

//MARK: -UISearchResultsUpdating
extension MainViewController: UISearchResultsUpdating  {
    private func setupNavigationBar() {
        self.navigationItem.title = "Weather App"
        self.navigationController?
            .navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

//MARK: -UITableViewDataSource
extension MainViewController: UITableViewDataSource,
                              UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
