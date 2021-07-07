//
//  TrackerService.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 07/07/2021.
//

import Foundation
enum TrackEventType {
    case listView
}

protocol TrackerType {
    func log(type: TrackEventType)
}

final class TrackerService: TrackerType {
    
    func log(type: TrackEventType) {
        // do something
    }
}
