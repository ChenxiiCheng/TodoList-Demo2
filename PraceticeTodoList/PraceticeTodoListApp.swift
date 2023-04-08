//
//  PraceticeTodoListApp.swift
//  PraceticeTodoList
//
//  Created by chenxi cheng on 4/8/23.
//

import SwiftUI

@main
struct PraceticeTodoListApp: App {
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
