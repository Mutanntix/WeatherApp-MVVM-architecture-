//
//  UIViewController + Extension.swift
//  WeatherAppMVVM
//
//  Created by Мурад Чеерчиев on 06.05.2022.
//

import Foundation
import UIKit

extension UIViewController {

    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
