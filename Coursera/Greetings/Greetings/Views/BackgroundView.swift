
import SwiftUI

/// This is the background view which contains a linear gradient.
struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [
            .myBlue1,
            .myBlue2
        ], startPoint: .topLeading, endPoint: .bottomTrailing)
            .opacity(1)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
