//
//  WeatherAdditionalView.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 06.05.2022.
//

import Foundation
import SnapKit

class WeatherAdditionalView: UIView {
    let stackView = UIStackView()
    
    let imageView = UIImageView(image: UIImage(named: "clouds"))
    let descriptionLabel = UILabel()
    let humidityLabel = UILabel()
    let pressureLabel = UILabel()
    let windLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        firstInit()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func firstInit() {
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
        addSubviews()
        setupStackView()
        setupLabels()
    }
    

}

//MARK: -Add subviews
extension WeatherAdditionalView {
    private func addSubviews() {
        self.addSubview(imageView)
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(humidityLabel)
        stackView.addArrangedSubview(pressureLabel)
        stackView.addArrangedSubview(windLabel)
    }
    
    private func setupLabels() {
        descriptionLabel.text = "Выберите город"
        humidityLabel.text = "Выберите город"
        windLabel.text = "Выберите город"
        pressureLabel.text = "Выберите город"
        
        descriptionLabel.font = .systemFont(ofSize: 13)
        humidityLabel.font = .systemFont(ofSize: 13)
        windLabel.font = .systemFont(ofSize: 13)
        pressureLabel.font = .systemFont(ofSize: 13)
        
        descriptionLabel.numberOfLines = 0
        humidityLabel.numberOfLines = 0
        windLabel.numberOfLines = 0
        pressureLabel.numberOfLines = 0
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 5
    }
}

//MARK: -Constraints
extension WeatherAdditionalView {
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.height.width
                .equalTo(50)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
                .inset(10)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading
                .equalTo(imageView.snp.trailingMargin)
                .offset(15)
            make.trailing.equalToSuperview().offset(-5)
            make.top.bottom.equalToSuperview()
        }
        
    }
}
