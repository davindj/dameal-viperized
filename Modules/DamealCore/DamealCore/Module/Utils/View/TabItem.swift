//
//  TabItem.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import SwiftUI

public struct TabItem: View {
    var imageName: String
    var title: String

    public init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }

    public var body: some View {
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
