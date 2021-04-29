//
//  PaymentList.swift
//  Payoneer
//
//  Created by Mehmed Tukulic on 28. 4. 2021..
//

import Foundation

struct PaymentList: Codable {
    let identification: Identification
    let networks: Networks
    let payment: Payment
    
    enum CodingKeys: String, CodingKey {
        case identification,networks,payment
    }
    
    struct Identification: Codable {
        let longId: String
        let shortId: String
        let transactionId: String
        
        enum CodingKeys: String, CodingKey {
            case longId,shortId,transactionId
        }
    }
    
    struct Networks: Codable {
        let applicable: [PaymentOption]
        
        enum CodingKeys: String, CodingKey {
            case applicable
        }
    }
    
    struct Payment: Codable {
        let reference: String
        let amount: Double
        let currency: String

        enum CodingKeys: String, CodingKey {
            case reference,amount,currency
        }
    }
    
}

struct PaymentOption: Codable {
    let code: String
    let label: String
    let method: String
    let links: Link
    
    enum CodingKeys: String, CodingKey {
        case code,label,method,links
    }
    
    struct Link: Codable {
        let logo: String
        
        enum CodingKeys: String, CodingKey {
            case logo
        }
    }
}


