//
//  AppBackground.swift
//  dameal
//
//  Created by Davin Djayadi on 23/01/23.
//

import SwiftUI

public struct AppBackground: View {
    public init () {}
    public var body: some View {
        Color.init(hex: 0xececFb).ignoresSafeArea()
    }
}

struct AppBackground_Previews: PreviewProvider {
    static var previews: some View {
        AppBackground()
    }
}
