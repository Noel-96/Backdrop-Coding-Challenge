//
//  Extensions.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 09/07/2021.
//

import Foundation
import SwiftUI

extension UIImage {
    var jpeg: Data? { jpegData(compressionQuality: 1) }  // QUALITY min = 0 / max = 1
    var png: Data? { pngData() }
}

extension Data {
    var uiImage: UIImage? { UIImage(data: self) }
}
