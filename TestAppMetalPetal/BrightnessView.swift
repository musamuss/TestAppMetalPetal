import SwiftUI
import Combine

struct BrightnessView: View {

    @StateObject private var data = BrightnessViewVM()

    var body: some View {
        VStack {
            switch Result(catching: {
                try data.filter()
            }) {
            case .success(let image):
                Image(cgImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)
            case .failure(let error):
                Text(error.localizedDescription)
            }

            Text(String(format: "Slider Value: %.2f", data.sliderValue * 100))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            Slider(value: $data.sliderValue ,in: 0...1, step: 0.01)
                .padding(.horizontal)
        }
    }
}

struct BrightnessView_Previews: PreviewProvider {
    static var previews: some View {
        BrightnessView()
    }
}


