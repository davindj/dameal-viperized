//
//  damealApp.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import SwiftUI

@main
struct DamealApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(
                    HomePresenter(homeUseCase: Injection.sharedInstance.resolve(HomeUseCase.self)!)
                )
        }
    }
}
