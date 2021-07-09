//
//  CatList2ViewModel.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 08/07/2021.
//

import Combine
import Foundation
import SwiftUI

final class CatListViewModel: ObservableObject{
    
    private var networkRequest = CatBreedNetworkRequest()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var isLoading = true
    @Published var errorMessage = ""
    @Published var models = [CatModel]()
    
    
 
    func fetchList() {
        self.networkRequest.fetchListSignal()

            .receive(on: DispatchQueue.main) // specify that we want to receive publisher on main thread scheduler (for UI ops)

            .mapError { APIServiceError.mappedFromRawError($0) } // map any error signal from `fetchListSignal` Publisher

            .sink(receiveCompletion: { [weak self] (completion) in // completion will be trigger eventually (at the end of signal chain)
                defer { self?.isLoading = false } // finalize `isLoading` state
                
                switch completion {
                case .failure(let error):
                    // map error message value to `errorMessage` that will trigger `objectWillChange` signal
                    let errorMessage = error.message
                    self?.errorMessage = errorMessage
                    print(errorMessage)
                case .finished:
                    break
                }
                
            }, receiveValue: { [weak self] items in
                // map response value to `models` that will trigger `objectWillChange` signal
                self?.models = items
            })

            // `Stores this type-erasing cancellable instance in the specified collection.` that we will
            // cancel later on `deinit`
            // reference: https://www.apeth.com/UnderstandingCombine/start/startpublishandsubscribe.html
            .store(in: &self.cancellables)
    }
}

