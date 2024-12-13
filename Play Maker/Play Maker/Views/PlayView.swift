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
            HStack(alignment: .center) {
                Text("\(name)")
                    .font(.headline)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 3)
                OptionsBarView()
            }
            // Court area in the middle
            PlayModelView()
                .frame(maxWidth: .infinity, alignment: .center) // Expand to take available space

            // Toolbar at the bottom
            ToolBarView()
        }
        .background(Color.white) // Ensure proper background color
    }
}

#Preview {
    PlayView(name: "Sample Play")
}
