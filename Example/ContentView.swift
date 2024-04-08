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
            Image(uiImage: isOn ? UIImage(named: "day")! : UIImage(named: "night")!)
                .resizable()
                .foregroundStyle(.tint)
                .ignoresSafeArea()
                .animation(.easeInOut, value: isOn)
           
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
