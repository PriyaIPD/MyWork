
import Foundation
import TipKit

struct GreetingsTip: Tip {
    var title: Text {
        Text("Click on text and disc")
    }
    var message: Text? {
        Text("Text will be randomly generated and observe nice animations!")
    }
    var asset: Image? {
        Image(systemName: "figure.walk.motion")
    }
    
}
