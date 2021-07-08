//
//  APIServiceError.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 07/07/2021.
//

import Foundation

enum APIServiceError: Error {
    case invalidRequestURL
    case mappedFromRawError(Error)
    case jsonDecoderError(Error)
}


extension APIServiceError {
    var message: String {
        switch self {
        case .invalidRequestURL:
            return "Invalid request URL"
        case .mappedFromRawError(let error),
             .jsonDecoderError(let error):
            return error.localizedDescription
        }
    }
}

extension APIServiceError: LocalizedError {
    var localizedDescription: String {
        return "[ERROR] \(self.message)"
    }
}
