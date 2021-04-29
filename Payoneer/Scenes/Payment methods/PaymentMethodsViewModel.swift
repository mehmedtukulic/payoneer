//
//  PaymentMethodsViewModel.swift
//  Payoneer
//
//  Created by Mehmed Tukulic on 28. 4. 2021..
//

import Foundation

class PaymentMethodsViewModel{
    var paymentList: PaymentList!
    
    //List of available payment methods
    var paymentOptions: Box<[PaymentOption]> = Box([])
    
    //Error message shown in toast
    var errorMessage: Box<String> = Box("")
    
    init() {
        getPaymentList()
    }
}

extension PaymentMethodsViewModel {
    
    func getPaymentList(){
        PaymentWorker().getPaymentList {  [weak self] (list) in
            
            //Dispatch to main thread after urlSession task executed
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
