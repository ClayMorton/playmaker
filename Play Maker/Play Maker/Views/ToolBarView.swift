//
//  TollBarView.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

struct ToolBarView: View {
    @State private var selectedTool: PlayTool? = nil

    var body: some View {
        HStack {
            Button(action: { selectTool(.x) }) {
                Text("X")
                    .padding()
                    .background(selectedTool == .x ? Color.blue : Color.gray)
                    .cornerRadius(8)
            }
            Button(action: { selectTool(.o) }) {
                Text("O")
                    .padding()
                    .background(selectedTool == .o ? Color.blue : Color.gray)
                    .cornerRadius(8)
            }
            Button(action: { selectTool(.line) }) {
                Text("Line")
                    .padding()
                    .background(selectedTool == .line ? Color.blue : Color.gray)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
    
    private func selectTool(_ tool: PlayTool) {
        selectedTool = tool
    }
}
