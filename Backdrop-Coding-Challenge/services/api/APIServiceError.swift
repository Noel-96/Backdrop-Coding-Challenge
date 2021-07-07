//
//  APIServiceError.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 07/07/2021.
//

import Foundation

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}
