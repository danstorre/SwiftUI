//
//  ExampleApp.swift
//  Example
//
//  Created by Daniel Torres on 4/8/24.
//

import SwiftUI

@main
struct ExampleApp: App {
    @StateObject var vm = TemperatureViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(vm: vm)
        }
    }
}
