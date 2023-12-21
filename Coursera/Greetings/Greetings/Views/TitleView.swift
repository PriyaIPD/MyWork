
import SwiftUI
import TipKit

/// This is the title view of the app which
///  displays a title, a substitle, which randomly changes on tap
///  and we have colorful disc which rotates on tap and
///  that is amazing.
struct TitleView: View {

    @State private var subtitle: LocalizedStringKey = "Exploring iOS Programming"
    
    private var greetingsTip = GreetingsTip()
    
    var body: some View {
        HStack {
            GreetingsTextView(subtitle: $subtitle)
                .popoverTip(greetingsTip)
            
            Spacer()
            
            RotatableCircleView()
            
        }
    }
}

#Preview {
    VStack {
        TitleView()
        Spacer()
    }
    .padding()
}
