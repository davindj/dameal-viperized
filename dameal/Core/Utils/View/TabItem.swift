//
//  TabItem.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import SwiftUI

struct TabItem: View {
    var imageName: String
    var title: String

    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(title)
        }
    }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        TabItem(
            imageName: "house", title: "home"
        )
    }
}
