//
//  ExperimentService.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 07/07/2021.
//

import Foundation
enum ExperimentKey: String {
    case showIcon
}

protocol ExperimentServiceType {
    func experiment(for key: ExperimentKey) -> Bool
}

final class ExperimentService: ExperimentServiceType {
    func experiment(for key: ExperimentKey) -> Bool {
        // call api to get variant for the key
        return true
    }
}
