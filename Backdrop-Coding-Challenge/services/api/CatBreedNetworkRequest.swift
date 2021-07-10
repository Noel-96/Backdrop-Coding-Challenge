//
//  CatBreedNetworkRequest.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 08/07/2021.
//

import Foundation
import Combine
final class CatBreedNetworkRequest{
    private var dataTask: URLSessionTask?
    private let backgroundQueue = DispatchQueue(
        label: "NetworkRequest.queue",
        qos: .background
    )
    
    deinit {
        self.dataTask?.cancel()
    }
    
    func fetchListSignal() -> AnyPublisher<[CatModel], APIServiceError> {
        guard let url = URLBuilder.buildListRequestURL() else {
            return Fail(
                error: APIServiceError.invalidRequestURL
            ).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("7d5a7390-46dd-44d1-973b-a531bc07b6f2", forHTTPHeaderField: "x-api-key")
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            // 1. Foundation's URLSession now has dataTask `Publisher`
            .map { $0.data }
            // 2. we retrieve `data` from the Publisher's `Output` tuple
            .mapError(APIServiceError.mappedFromRawError)
            // 3. catch and map error that the dataTask `Publisher` emits
            .decode(type: [CatModel].self, decoder: JSONDecoder())
            // 4. Decode #3 data into array of `CatModel` model
            .mapError(APIServiceError.jsonDecoderError)
            // 5. catch and map error from JSONDecoder
            .subscribe(on: self.backgroundQueue)
            // process on background/private queue
            .receive(on: DispatchQueue.main)
            // send result on main queue
            
            //we use AnyPublisher to hide implementation details to outside, hence "type-erased"
            .eraseToAnyPublisher()
    }
}
