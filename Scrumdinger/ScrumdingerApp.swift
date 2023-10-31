//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Bogdan Madzhuga on 30.10.2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
