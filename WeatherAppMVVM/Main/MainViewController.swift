//
//  ViewController.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 05.05.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    lazy var navBarHeight = self.navigationController?.navigationBar.frame.maxY ?? 0.0
    
    lazy var tempView = WeatherDescriptionView(
        frame: .zero,
        "Температура сейчас:",
        "")
    let minTempView = WeatherDescriptionView(
        frame: .zero,
        "Минимальная температура:",
        "")
    let maxTempView = WeatherDescriptionView(
        frame: .zero,
        "Максимальная температура:",
        "")
    let feelsLikeView = WeatherDescriptionView(
        frame: .zero,
        "Ощущается скорее как:",
        "")
    
    var networkDelegate = NetworkDelegate()
    
    var mainViewModel: MainViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel = MainViewModel()

        setupUI()
        setupConstaints()
        
    }

    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.308493793, green: 0.5243448615, blue: 0.8447265029, alpha: 1)
        
        setupNavigationBar()
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addSubview(tempView)
        view.addSubview(minTempView)
        view.addSubview(maxTempView)
        view.addSubview(feelsLikeView)
    }

    private func setupConstaints() {
        tempView.snp.makeConstraints { [unowned self] make in
            make.top.equalTo(
                view.snp_topMargin).inset(10)
            make.leading.equalToSuperview().inset(20)
            make.width
                .equalTo(view.frame.width * 0.35)
            make.height
                .equalTo(view.frame.width * 0.25)
        }
        
        minTempView.snp.makeConstraints { [unowned self] make in
            make.top.equalTo(
                view.snp_topMargin).inset(10)
            make.trailing.equalToSuperview()
                .inset(20)
            make.width
                .equalTo(view.frame.width * 0.35)
            make.height
                .equalTo(view.frame.width * 0.25)
        }

        maxTempView.snp.makeConstraints { [unowned self] make in
            make.top.equalTo(
                tempView.snp_bottomMargin)
            .inset(-20)
            make.leading.equalToSuperview().inset(20)
            make.width
                .equalTo(view.frame.width * 0.35)
            make.height
                .equalTo(view.frame.width * 0.25)
        }
        
        feelsLikeView.snp.makeConstraints { [unowned self] make in
            make.top.equalTo(
                tempView.snp_bottomMargin)
            .inset(-20)
            make.trailing.equalToSuperview().inset(20)
            make.width
                .equalTo(view.frame.width * 0.35)
            make.height
                .equalTo(view.frame.width * 0.25)
        }
    }
    

}

//MARK: -UISearchResultsUpdating, NavBar
extension MainViewController: UISearchResultsUpdating  {
    private func setupNavigationBar() {
        self.navigationItem.title = "Weather App"
        
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance
            .titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance
            .largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar
            .standardAppearance = navBarAppearance
        navigationController?.navigationBar
            .scrollEdgeAppearance = navBarAppearance
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

