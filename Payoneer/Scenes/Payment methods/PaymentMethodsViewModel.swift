//
//  PaymentMethodsViewModel.swift
//  Payoneer
//
//  Created by Mehmed Tukulic on 28. 4. 2021..
//

import Foundation

class PaymentMethodsViewModel{
    var paymentList: PaymentList!
    
}

extension PaymentMethodsViewModel {
    func getPaymentList(){
        
        PaymentWorker().getPaymentList { [weak self] (list) in
            self?.paymentList = list
        } failure: { (error) in
            print(error)
        }

    }
}
