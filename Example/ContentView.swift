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
                TemperatureView(isOn: isOn)
                Spacer()
                ToggleDay(isOn: $isOn)
            }
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    ContentView()
}

struct TemperatureView: View {
    let isOn: Bool
    
    var body: some View {
        VStack(alignment: isOn ? .leading : .trailing) {
            Rectangle()
                .foregroundColor(.clear)
                .border(.white, width: 5)
            
            HStack {
                Text(isOn ? "Hot" : "Cold")
                    .foregroundStyle(.white)
                    .font(.bold(.headline)())
                
                if isOn {
                    Circle()
                        .frame(width: 40)
                        .foregroundStyle(.red)
                } else {
                    Circle()
                        .frame(width: 40)
                        .foregroundStyle(.blue)
                }
            }
        }
        .frame(width: 300)
        .animation(.easeInOut, value: isOn)
    }
}

struct ToggleDay: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn, label: {
            Text("Toggle Light")
                .foregroundStyle(.white)
                .font(.bold(.headline)())
        })
        .padding(.bottom)
    }
}
