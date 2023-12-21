
import SwiftUI

/// This is the data model of the messages
/// that will appear in the app.
/// It contains a test string and a color.
/// Moreover it conforms to the identifiable protocol.
struct DataItemModel: Identifiable {
    let id = UUID()
    let text: LocalizedStringKey
    let color: Color
}
