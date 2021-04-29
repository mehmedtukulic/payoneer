//
//  UICell+Extra.swift
//  Payoneer
//
//  Created by Mehmed Tukulic on 29. 4. 2021..
//

import Foundation
import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}


extension UICollectionReusableView {
    static var id: String {
        return String(describing: self)
    }
}
