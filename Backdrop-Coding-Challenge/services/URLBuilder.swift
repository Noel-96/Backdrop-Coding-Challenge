//
//  URLBuilder.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 08/07/2021.
//

import Foundation
struct URLBuilder {
    static func buildListRequestURL() -> URL? {
        let comp = URLComponents(string: "https://api.thecatapi.com/v1/breeds")
        return comp?.host == nil ? nil : comp?.url
    }
}
