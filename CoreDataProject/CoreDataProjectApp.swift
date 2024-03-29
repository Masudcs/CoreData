//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Md. Masud Rana on 2/12/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
