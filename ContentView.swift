import SwiftUI

struct ContentView: View {
    @StateObject private var motionDetector = MotionDetector(updateInterval: 0.01)
    var body: some View {
        TabView {
            SpiritView()
                .environmentObject(motionDetector)
                .tabItem {
                    VStack {
                        Image(systemName: "camera.metering.none")
                    }
                }
            
            LevelView()
                .environmentObject(motionDetector)
                .tabItem {
                    VStack {
                        Image(systemName: "arrow.up.and.down.and.arrow.left.and.right")
                    }
                }
            
            OptionsView()
                .tabItem {
                    VStack {
                        Image(systemName: "info")
                    }
                }
        }
    }
}
