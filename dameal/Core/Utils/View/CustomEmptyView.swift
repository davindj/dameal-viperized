//
//  CustomEmptyView.swift
//  dameal
//
//  Created by Davin Djayadi on 23/01/23.
//

import SwiftUI

struct CustomEmptyView: View {
    var image: String
    var title: String

    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 200)

            Text(title)
                .font(.system(.body, design: .rounded))
        }
    }
}

struct CustomEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CustomEmptyView(
            image: "",
            title: "Home"
        )
    }
}
