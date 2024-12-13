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
            Spacer()
            ToolBarView()
        }
    }
}

#Preview {
    PlayView(name: "Sample Play")
}
