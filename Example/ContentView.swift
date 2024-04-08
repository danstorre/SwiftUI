//
//  ContentView.swift
//  Example
//
//  Created by Daniel Torres on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: "day")!)
                .resizable()
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
