//
//  ContentView.swift
//  Example
//
//  Created by Daniel Torres on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    @State var temp = "Hot"
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
                TemperatureView(temp: temp, isOn: isOn)
                Spacer()
                ToggleDay(isOn: $isOn)
            }
            .padding(.horizontal)
            .onChange(of: isOn) { oldValue, newValue in
                temp = newValue ? "Hot" : "Cold"
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct TemperatureView: View {
    let temp: String
    let isOn: Bool
    
    var body: some View {
        VStack(alignment: isOn ? .leading : .trailing) {
            Rectangle()
                .foregroundColor(.clear)
                .border(.white, width: 5)
            
            HStack {
                Text(temp)
                    .foregroundStyle(.white)
                    .font(.bold(.headline)())
                Circle()
                    .frame(width: 40)
                    .foregroundStyle(isOn ? .red : .blue)
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
