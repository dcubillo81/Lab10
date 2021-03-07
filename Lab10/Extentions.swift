//
//  Extentions.swift
//  Lab10
//
//  Created by Daniel Cubillo on 6/3/21.
//

import Foundation
import SwiftUI

// String URL -> UImage
extension String{
    func load() -> UIImage {
        // try catch
        do {
            //string to url
            guard let url = URL(string: self) else { return UIImage() }
            //url to data
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch  {
            return UIImage(systemName: "multiply.circle") ?? UIImage()
        }
    }
}

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}
