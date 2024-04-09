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
           
            VStack {
                Spacer()
                
                VStack(alignment: isOn ? .leading : .trailing) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .border(.white, width: 5)
                    
                        HStack {
                            Text("Temperature")
                                .foregroundStyle(.white)
                                .font(.bold(.headline)())
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(isOn ? .red : .blue)
                        }
                }
                .frame(width: 300)
                .animation(.easeInOut, value: isOn)
                
                Spacer()
                Toggle(isOn: $isOn, label: {
                    Text("Toggle Light")
                        .foregroundStyle(.white)
                        .font(.bold(.headline)())
                })
                .padding(.bottom)
            }
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    ContentView()
}
