//
//  ImageLoader.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 06/07/2021.
//

import Foundation
import SwiftUI
import Combine

class ImageProvider: ObservableObject {
    @Published var image = UIImage(named: "Loading_Default_Picture")!
    private var cancellable: AnyCancellable?
    private let imageLoader = ImageLoader()

    func loadImage(url: URL) {
        self.cancellable = imageLoader.publisher(for: url)
            .sink(receiveCompletion: { failure in
            print(failure)
        }, receiveValue: { image in
            self.image = image
        })
    }
}
