import MetalPetal

struct CustomBrightnessFilter {
    private static let convolutionKernel = MTIRenderPipelineKernel(
        vertexFunctionDescriptor: .passthroughVertex,
        fragmentFunctionDescriptor: MTIFunctionDescriptor(
            name: "imageBrightness",
            in: .main
        )
    )
    static func apply(to image: MTIImage, brightness: Float = 1.0) -> MTIImage {
        return convolutionKernel.apply(
            to: [image], parameters: ["brightness": brightness],
            outputDimensions: image.dimensions,
            outputPixelFormat: .rgba32Float
        )
    }
}
