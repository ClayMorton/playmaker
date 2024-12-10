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
        PlayView(name: playName)
    }
}
