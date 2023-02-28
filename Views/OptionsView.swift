import SwiftUI
import CoreMotion

struct OptionsView: View {
    private let motion = CMMotionManager()
    var body: some View {
        Form {
            Section {
                VStack {
                    HStack {
                        Text("Bubble")
                            .font(Font.largeTitle)
                        VStack {
                            Spacer()
                            Text("v1.0")
                                .font(Font.body.monospaced())
                        }
                    }
                    .padding()
                    HStack {
                        Text("TheRedSpecial 2023")
                            .font(Font.callout.monospaced())
                        Spacer()
                        Link("GitHub", destination: URL(string: "https://github.com/theredspecial0")!)
                            .font(Font.callout)
                    }
                }
            }
            
            Section("Motion Support") {
                Text(
                    (motion.isDeviceMotionAvailable) ? ("Device motion is available on your device") : ("Device motion is not available on your device")
                )
                Text(
                    (motion.isGyroAvailable) ? ("Gyroscope is available on your device") : ("Gyroscope is not available on your device")
                )
                Text(
                    (motion.isMagnetometerAvailable) ? ("Magnetometer is available on your device") : ("Magnetometer is not available on your device")
                )
                Link("Learn More", destination: URL(string: "https://developer.apple.com/support/required-device-capabilities/")!)
            }
            
            Section {
                VStack {
                    Link("View Source", destination: URL(string: "https://github.com/theredspecial0/bubbleapp")!)
                }
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
