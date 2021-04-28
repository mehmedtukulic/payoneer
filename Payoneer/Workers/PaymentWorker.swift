//
//  PaymentWorker.swift
//  Payoneer
//
//  Created by Mehmed Tukulic on 28. 4. 2021..
//

import Foundation

class PaymentWorker{
    
    func getPaymentList(success: @escaping (PaymentList) -> Void, failure: @escaping (String)  -> Void){
        
        //Create request
        let session = URLSession.shared
        let url = URL(string: "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/lists/listresult.json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            
            
            if let response = response as? HTTPURLResponse {
                let statusCode = response.statusCode
                
                if statusCode >= 200 && statusCode < 400 {
                    do {
                        //data is not in json format, so wee need to parse it to json data
                        let jsonObject = try JSONSerialization.jsonObject(with: data!, options: [])
                        let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
                        
                        // parse result
                        let decoder = JSONDecoder()
                        let object = try decoder.decode(PaymentList.self, from: jsonData)
                        success(object)
                    } catch {
                        failure("Parsing Error")
                    }
                } else {
                    failure("Server Error with code : \(statusCode)")
                }
            } else {
                failure("Client Error")
            }
        }
        
        task.resume()
    }
    
}
