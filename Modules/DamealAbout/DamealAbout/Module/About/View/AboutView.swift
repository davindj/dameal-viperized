//
//  AboutView.swift
//  dameal
//
//  Created by Davin Djayadi on 24/01/23.
//

import SwiftUI
import DamealCore

public struct AboutView: View {
    public init() {}
    public var body: some View {
        ZStack {
            AppBackground()
            content
        }.navigationBarTitle(
            Text("About"),
            displayMode: .automatic
        )
    }
}

extension AboutView {
    var content: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Spacer().frame(height: 40)
            VStack {
                Image("davin-djayadi")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                    .cornerRadius(40)
                Text("Davin Djayadi")
                    .font(.largeTitle)
                    .bold()
                Text("A passionate programmer who enjoy creating cool and wonderful ideas into reality. Currently I'm focusing on mobile & web development.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            Spacer().frame(height: 40)
            VStack {
                LinkButton(
                    title: "GH - Github",
                    link: "https://github.com/davindj",
                    bgColor: Color.init(hex: 0x35128B)
                )
                Spacer().frame(height: 20)
                LinkButton(
                    title: "IG - Instagram",
                    link: "https://www.instagram.com/pindavin",
                    bgColor: Color.init(hex: 0xC73E78)
                )
                Spacer().frame(height: 20)
                LinkButton(
                    title: "IN - LinkedIn",
                    link: "https://id.linkedin.com/in/davin-djayadi",
                    bgColor: Color.init(hex: 0x31719E)
                )
            }
            Spacer()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
