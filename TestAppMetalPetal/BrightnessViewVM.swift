import Foundation
import Combine
import MetalPetal

class BrightnessViewVM: ObservableObject {

    @Published var sliderValue: Float = 0.0
    
    private var defaultImage: UIImage = UIImage(named: "testImage")!
    private var renderContext = try! MTIContext(device: MTLCreateSystemDefaultDevice()!)

    func filter() throws -> CGImage {
        guard let inputImage = self.defaultImage.cgImage else {
            throw NSError(domain: "MissingInputImage", code: 0, userInfo: nil)
        }
        let imageFromCGImage = MTIImage(cgImage: inputImage, isOpaque: true)
        let filter = MTIBrightnessFilter()
        filter.brightness = sliderValue
        filter.inputImage = imageFromCGImage
        guard let outputImage = filter.outputImage else {
            throw NSError(domain: "Cannot conver to output", code: 0, userInfo: nil)
        }
        return try self.renderContext.makeCGImage(from: outputImage)
    }
}
