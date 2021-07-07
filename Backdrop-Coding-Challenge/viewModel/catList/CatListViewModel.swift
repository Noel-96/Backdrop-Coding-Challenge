//
//  CatListViewModel.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 07/07/2021.
//

import Foundation
import SwiftUI
import Combine

final class CatListViewModel: ObservableObject,  UnidirectionalDataFlowType  {
    
    @Published private(set) var repositories: [CatModel] = []
    @Published var isErrorShown = false
    @Published var errorMessage = ""
    @Published private(set) var shouldShowIcon = false
    
    enum Input {
        case onAppear
    }
    
    typealias InputType = Input
    
    
    func apply(_ input: Input) {
        switch input {
        case .onAppear: onAppearSubject.send(())
        }
    }
    
    private var cancellables: [AnyCancellable] = []
    
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    
    private let responseSubject = PassthroughSubject<[CatModel], Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    private let trackingSubject = PassthroughSubject<TrackEventType, Never>()
    
  
    
}
