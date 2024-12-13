//
//  TollBarView.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

struct ToolBarView: View{
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
                Label("Edit", systemImage: "pencil")
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
        .padding()
    }
}

#Preview {
    ToolBarView()
}
