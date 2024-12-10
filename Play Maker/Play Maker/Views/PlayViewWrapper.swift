//
//  PlayViewWrapper.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

struct PlayViewWrapper: View {
    var playName: String?

    var body: some View {
        PlayView(playName: playName)
    }
}

struct PlayViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        PlayViewWrapper(playName: "Sample Play")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
