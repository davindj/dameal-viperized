//
//  LinkButton.swift
//  dameal
//
//  Created by Davin Djayadi on 24/01/23.
//

import SwiftUI
import DamealCore

struct LinkButton: View {
    var title: String
    var link: String
    var bgColor: Color

    var body: some View {
        Button(title) {
            guard let urlLink = URL(string: link) else { return }
            UIApplication.shared.open(urlLink)
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(bgColor)
        .cornerRadius(10)
        .padding(.horizontal, 40)
        .foregroundColor(.white)
    }
}

struct LinkButton_Previews: PreviewProvider {
    static var previews: some View {
        LinkButton(
            title: "GH - Github",
            link: "https://github.com/davindj",
            bgColor: Color.init(hex: 0x35128B)
        )
    }
}
