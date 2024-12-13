//
//  OptionsBarView.swift
//  Play Maker
//
//  Created by Clay Morton on 12/12/24.
//

import SwiftUI

struct OptionsBarView: View{
    var body: some View{
        HStack(alignment: .center){
            Button{
                // save button logic goes here
            } label: {
                Label("Save", systemImage: "square.and.arrow.down")
            }
            Spacer()
            Button{
                // edit button logic goes here
            } label: {
                Label("Edit", systemImage: "pencil.tip.crop.circle")
            }
            Spacer()
            Button{
                // This is the logic for animating the play
            } label: {
                Label("Play", systemImage: "play")
            }
            Spacer()
            Button{
                // delete button logic connector
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
        .padding(.horizontal, 25) // Padding inside the HStack
        .padding(.vertical, 10) // Padding inside the HStack (around words)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2)) // Light gray background
        )
        .padding(.horizontal, 16) // Padding outside the box
        .padding(.vertical, 3)
    }
}

#Preview {
    ToolBarView()
}

