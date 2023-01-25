//
//  ActivityIndicator.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
    public init () {}

    public func makeUIView(
        context: UIViewRepresentableContext<ActivityIndicator>
    ) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    public func updateUIView(
        _ uiView: UIActivityIndicatorView,
        context: UIViewRepresentableContext<ActivityIndicator>
    ) {
        uiView.startAnimating()
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
