//
//  WeatherDescriptionView.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 06.05.2022.
//

import Foundation
import UIKit
import SnapKit

class WeatherDescriptionView: UIView {
    
    let mainLabel = UILabel()
    let tempLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(frame: CGRect,
                     _ description: String,
                     _ temp: String) {
        self.init(frame: frame)
        firstInit()
        setupLabels(description,
                    temp)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func firstInit() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        
    }
    
    private func setupLabels(_ decription: String,
                            _ temp: String) {
        self.addSubview(mainLabel)
        self.addSubview(tempLabel)
        
        mainLabel.text = decription
        tempLabel.text = "\(temp) градусов С"
        
        mainLabel.font = .systemFont(ofSize: 15, weight: .medium)
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .center
        
        tempLabel.font = .systemFont(ofSize: 15, weight: .medium)
        tempLabel.numberOfLines = 0
        tempLabel.textAlignment = .center
    }
    

    
    private func setupConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.trailing
                .leading.equalToSuperview()
                .inset(5)
            make.top
                .equalToSuperview().inset(10)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.trailing
                .leading.equalToSuperview()
                .inset(5)
            make.top
                .equalTo(
                    mainLabel.snp
                        .bottomMargin).inset(-20)
        }
    }
}
