//
//  ContentView.swift
//  Example
//
//  Created by Daniel Torres on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    @State var isOn = false
    
    var body: some View {
        ZStack {
            if isOn {
                Image(uiImage: UIImage(named: "day")!)
                    .resizable()
                    .foregroundStyle(.tint)
            } else {
                Image(uiImage: UIImage(named: "night")!)
                    .resizable()
                    .foregroundStyle(.tint)
            }
           
            VStack{
                Spacer()
                Toggle(isOn: $isOn, label: {
                    Text("Toggle Light")
                        .foregroundStyle(.white)
                        .font(.bold(.headline)())
                })
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
