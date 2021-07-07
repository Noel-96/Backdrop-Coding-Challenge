//
//  APIService.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 07/07/2021.
//

import Foundation
import Combine

protocol APIServiceType {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}
