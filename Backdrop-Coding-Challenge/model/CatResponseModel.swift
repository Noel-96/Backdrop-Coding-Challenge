//
//  CatResponseModel.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 06/07/2021.
//

import Foundation
struct CatResponseModel : Hashable, Codable, Identifiable{
    var id: ObjectIdentifier
    
    static func == (lhs: CatResponseModel, rhs: CatResponseModel) -> Bool {
        <#code#>
    }
    
    
    var results: [Result]
}
