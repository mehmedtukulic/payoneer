//
//  UIImage+Extra.swift
//  Payoneer
//
//  Created by Mehmed Tukulic on 29. 4. 2021..
//

import Foundation
import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func load(urlString: String, replacement: String) {
        
        if let image = imageCache.object(forKey: urlString as NSString) {
            self.image = image as? UIImage
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: (URL(string: urlString)!)) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self.image = image
                    }
                } else {
                    self.image = UIImage(named: replacement)
                }
            } else {
                self.image = UIImage(named: replacement)
            }
        }
    }

}
