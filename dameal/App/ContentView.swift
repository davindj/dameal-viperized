//
//  ContentView.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homePresenter: HomePresenter

    var body: some View {
        TabView {
            NavigationView {
                HomeView(presenter: homePresenter)
            }.tabItem {
                TabItem(imageName: "house", title: "Home")
            }
            NavigationView {
                Text("Favorite Page")
            }.tabItem {
                TabItem(imageName: "heart", title: "Favorite")
            }
            NavigationView {
                Text("About Page")
            }.tabItem {
                TabItem(imageName: "person.crop.circle", title: "about")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
