//
//  PaymentMethodViewCell.swift
//  Payoneer
//
//  Created by Mehmed Tukulic on 29. 4. 2021..
//

import UIKit

class PaymentMethodViewCell: UICollectionViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 12
    }
    
    func setup(model: PaymentOption){
        titleLabel.text = model.label
        logoImageView.load(urlString: model.links.logo, replacement: "cardIcon")
    }

}

    
