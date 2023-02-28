import SwiftUI

struct SpiritView: View {
    @EnvironmentObject var detector: MotionDetector
    @State var invertTurn: Bool = false
    
    let range = Double.pi
    var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack {
                    Rectangle()
                        .frame(width: .infinity, height: 1)
                        .foregroundColor(
                            (Int(rad2deg(detector.roll)) == 0) ? (Color.green) : (Color.red)
                        )
                    Rectangle()
                        .frame(width: 200, height: 1)
                        .padding()
                        .scaledToFit()
                        .rotationEffect(
                            invertTurn ? (.radians(range - detector.roll)) : (.radians(detector.roll))
                        )
                }
                .frame(width: geo.size.width, height: geo.size.height / 2)
                VStack {
                    Text("Roll: \(rad2deg(detector.roll))")
                    
                    Form {
                        Section {
                            Toggle("Invert", isOn: $invertTurn)
                        }
                    }
                    .cornerRadius(7)
                    .padding()
                }
                .frame(width: geo.size.width, height: geo.size.height / 2)
                .offset(y: geo.size.height / 2)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25) {
                detector.start()
            }
        }
        .onDisappear() {
            detector.stop()
        }
    }
}
