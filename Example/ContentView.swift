//
//  ContentView.swift
//  Example
//
//  Created by Daniel Torres on 4/8/24.
//

import SwiftUI

class TemperatureViewModel: ObservableObject {
    @Published private(set) var temp = "Cold"
    
    func updateTemperature(isDay: Bool) {
        temp = isDay ? "Hot" : "Cold"
    }
}

struct ContentView: View {
    @ObservedObject var vm: TemperatureViewModel
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
                TemperatureView(temp: vm.temp, isOn: isOn)
                    .animation(.spring, value: isOn)
                Spacer()
                ToggleDay(isOn: $isOn)
            }
            .padding(.horizontal)
            .onChange(of: isOn) { _, newValue in
                vm.updateTemperature(isDay: newValue)
            }
        }
        
    }
}

#Preview {
    ContentView(vm: TemperatureViewModel())
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
