//
//  PaymentMethodsViewModel.swift
//  Payoneer
//
//  Created by Mehmed Tukulic on 28. 4. 2021..
//

import Foundation

class PaymentMethodsViewModel{
    var paymentList: PaymentList!
    var paymentOptions: Box<[PaymentOption]> = Box([])
    
    var errorMessage: Box<String> = Box("")
}

extension PaymentMethodsViewModel {
    
    func getPaymentList(){
        PaymentWorker().getPaymentList {  [weak self] (list) in
            //Need to dispatch to main thread after url session task execution
            DispatchQueue.main.async {
                self?.paymentList = list
                self?.paymentOptions.value = list.networks.applicable
            }
            
        } failure: { (error) in
            print(error)
            
            DispatchQueue.main.async {
                self.errorMessage.value = error
            }
        }
    }
}
