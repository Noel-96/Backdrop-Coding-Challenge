//
//  URLBuilder.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 08/07/2021.
//

import Foundation
struct URLBuilder {
//    static func build(_ urlString: String) -> URL {
//        let https = "https://"
//        if urlString.hasPrefix(https) {
//            return URL(string: urlString)!
//        }
//
//        return URL(string: (https + urlString))!
//    }

    static func buildListRequestURL() -> URL? {
        let comp = URLComponents(string: "https://api.thecatapi.com/v1/breeds?limit=20&order=Asc")
        return comp?.host == nil ? nil : comp?.url
    }
}
