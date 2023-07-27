import SwiftUI
import UIKit

extension Image {
    init(cgImage: CGImage) {
        self.init(uiImage: UIImage(cgImage: cgImage))
    }
}
