//
//  TollBarView.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

struct ToolBarView: View {
    @State private var selectedTool: ToolType? = .defense

    var body: some View {
        HStack(alignment: .center) {
            ToolButton(label: "Defense", systemImage: "xmark.circle.fill", tool: .defense, selectedTool: $selectedTool)
            Spacer()
            ToolButton(label: "Offense", systemImage: "o.circle.fill", tool: .offense, selectedTool: $selectedTool)
            Spacer()
            ToolButton(label: "Pass", systemImage: "arrow.left.arrow.right", tool: .pass, selectedTool: $selectedTool)
            Spacer()
            ToolButton(label: "Dribble", systemImage: "arrow.up.arrow.down.circle", tool: .dribble, selectedTool: $selectedTool)
            Spacer()
            ToolButton(label: "Run", systemImage: "arrow.trianglehead.swap", tool: .playerMove, selectedTool: $selectedTool)
            Spacer()
            ToolButton(label: "Remove", systemImage: "eraser.fill", tool: .deletePath, selectedTool: $selectedTool)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
        )
        .padding(.horizontal, 16)
    }
}

enum ToolType {
    case defense, offense, pass, dribble, playerMove, deletePath
}

struct ToolButton: View {
    let label: String
    let systemImage: String
    let tool: ToolType
    @Binding var selectedTool: ToolType?

    var body: some View {
            Button {
                selectedTool = tool
            } label: {
                VStack(spacing: 4) { // VStack to arrange icon and text vertically
                    Image(systemName: systemImage)
                        .font(.headline) // Adjust icon size
                    Text(label)
                        .font(.footnote) // Adjust text size
                }
                .padding()
                .frame(maxWidth: .infinity) // Ensure buttons take equal space
                .background(selectedTool == tool ? Color.blue.opacity(0.2) : Color.clear)
                .cornerRadius(8)
                .foregroundColor(.blue)
            }
        }
}


#Preview {
    ToolBarView()
}
