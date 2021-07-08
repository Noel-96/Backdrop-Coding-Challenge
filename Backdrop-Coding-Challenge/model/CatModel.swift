//
//  CatModel.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 06/07/2021.
//

import Foundation
import SwiftUI



struct CatModel: Codable, Hashable, Identifiable{
    var id: String
    var name: String
    var image: BreedImage
    
}
struct BreedImage: Codable , Hashable{
    let url: String
}
