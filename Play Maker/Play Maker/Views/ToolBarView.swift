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
                // X Object
            } label: {
                Label("Defense Player", systemImage: "xmark.circle.fill")
            }
            Spacer()
            Button{
                // O Object
            } label: {
                Label("Offense Player", systemImage: "o.circle.fill")
            }
            Spacer()
            Button{
                // Pass Arrow (DASHED)
            } label: {
                Label("Pass Ball", systemImage: "arrow.left.arrow.right")
            }
            Spacer()
            Button{
                // Dribble Arrow (WIGGLY)
            } label: {
                Label("Dribble Ball", systemImage: "arrow.up.arrow.down.circle")
            }
            Spacer()
            Button{
                // Player Arrow (SOLID)
            } label: {
                Label("Player Move", systemImage: "arrow.trianglehead.swap")
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
