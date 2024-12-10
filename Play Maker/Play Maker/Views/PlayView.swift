import SwiftUI

struct PlayView: View {
    var playName: String?
    @State private var playData: PlayData?

    var body: some View {
        VStack {
            if let playData = playData {
                // Display play details
                Text("Play: \(playData.name)")
                    .font(.title)
                    .padding()
                
                // The rest of the play view goes here: Court, objects, and animation buttons
                // Example:
                Button("Save Play") {
                    // Save logic
                    PersistenceManager.shared.savePlay(play: playData)
                }
                // Add other buttons like Edit, Delete, Play etc.
            } else {
                Text("Loading Play...")
                    .font(.title)
                    .padding()
            }
        }
        .onAppear {
            if let name = playName {
                loadPlay(name: name)
            }
        }
    }

    private func loadPlay(name: String) {
        if let loadedPlay = PersistenceManager.shared.loadPlay(name: name) {
            self.playData = loadedPlay
        } else {
            print("Failed to load play with name \(name)")
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(playName: "Sample Play")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

