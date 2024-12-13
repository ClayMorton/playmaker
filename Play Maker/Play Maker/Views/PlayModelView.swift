//
//  PlayModelView.swift
//  Play Maker
//
//  Created by Clay Morton on 12/12/24.
//

import SwiftUI

struct PlayModelView: View {
    // @State var playModel: PlayModel
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("basketballCourt")
                .resizable()
                .scaledToFit()
                .padding()
        }
        .scaledToFit()
    }
}
