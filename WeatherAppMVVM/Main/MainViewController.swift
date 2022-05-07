//
//  ViewController.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 05.05.2022

import SnapKit

class MainViewController: UIViewController {
    
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
    
    let weatherAdditionalView = WeatherAdditionalView()
    
    var mainViewModel: MainViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel = MainViewModel(weatherModel: nil)

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
        view.addSubview(weatherAdditionalView)
    }

    private func setupConstaints() {
        tempView.snp.makeConstraints { [unowned self] make in
            make.top.equalTo(
                view.snp_topMargin).inset(10)
            make.leading.equalToSuperview()
                .inset(30)
            make.width
                .equalTo(view.frame.width * 0.35)
            make.height
                .equalTo(view.frame.width * 0.25)
        }
        
        minTempView.snp.makeConstraints { [unowned self] make in
            make.top.equalTo(
                view.snp_topMargin).inset(10)
            make.trailing.equalToSuperview()
                .inset(30)
            make.width
                .equalTo(view.frame.width * 0.35)
            make.height
                .equalTo(view.frame.width * 0.25)
        }

        maxTempView.snp.makeConstraints { [unowned self] make in
            make.top.equalTo(
                tempView.snp_bottomMargin)
            .inset(-20)
            make.leading.equalToSuperview()
                .inset(30)
            make.width
                .equalTo(view.frame.width * 0.35)
            make.height
                .equalTo(view.frame.width * 0.25)
        }
        
        feelsLikeView.snp.makeConstraints { [unowned self] make in
            make.top.equalTo(
                tempView.snp_bottomMargin)
            .inset(-20)
            make.trailing.equalToSuperview()
                .inset(30)
            make.width
                .equalTo(view.frame.width * 0.35)
            make.height
                .equalTo(view.frame.width * 0.25)
        }
        
        weatherAdditionalView.snp.makeConstraints { [unowned self] make in
            make.top.equalTo(
                feelsLikeView.snp_bottomMargin).offset(20)
            make.leading
                .trailing.equalToSuperview().inset(20)
            make.height.equalTo(view.frame.height * 0.2)
        }
    }
    
    private func setWeatherViews(city: String?) {
        tempView.tempLabel.text = mainViewModel.currentTemp
        minTempView.tempLabel.text = mainViewModel.minTemp
        maxTempView.tempLabel.text = mainViewModel.maxTemp
        feelsLikeView.tempLabel.text = mainViewModel.tempFeelsLike
        self.navigationItem.title = city ?? "Weather app"
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
        mainViewModel
            .fetchWeather(
                city: searchController
                    .searchBar.text) { [unowned self] city in
                        self.setWeatherViews(city: city)
        }
    }
}

