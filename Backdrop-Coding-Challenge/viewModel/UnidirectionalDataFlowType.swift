//
//  UnidirectionalDataFlowType.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 07/07/2021.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType
    
    func apply(_ input: InputType)
}
