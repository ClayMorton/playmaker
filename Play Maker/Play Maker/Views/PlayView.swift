//
//  PlayView.swift
//  Play Maker
//
//  Created by Clay Morton on 12/10/24.
//

import SwiftUI

struct PlayView: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ToolBarView()
            Text("Play: \(name)")
                .font(.title)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    PlayView(name: "Sample Play")
}
