//
//  catmed_f2App.swift
//  catmed_f2
//
//  Created by Eli Grealish on 23/07/2021.
//

import SwiftUI

@main
struct catmed_f2App: App {
    var body: some Scene {
        WindowGroup {
            HomeTabView().environmentObject(MainViewModel())
        }
    }
}
