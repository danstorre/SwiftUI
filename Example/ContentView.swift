//
//  ContentView.swift
//  Example
//
//  Created by Daniel Torres on 4/8/24.
//

import SwiftUI

class DayAndNight: ObservableObject {
    private lazy var day = UIImage(named: "day")!
    private lazy var night = UIImage(named: "night")!
    @Published private(set) var image: UIImage = UIImage(named: "day")!
    
    func updateLight(isOn: Bool) {
        image = isOn ? day : night
    }
}


struct ContentView: View {
    @StateObject var vm: DayAndNight = DayAndNight()
    @State var tempText: String = "Cold"
    @State var isOn = false
    
    var body: some View {
        ZStack {
            Image(uiImage: vm.image)
                .resizable()
                .foregroundStyle(.tint)
                .ignoresSafeArea()
                .animation(.easeInOut, value: vm.image)
           
            VStack {
                Spacer()
                TemperatureView(text: tempText, isOn: isOn)
                Spacer()
                ToggleDay(isOn: $isOn)
            }
            .padding(.horizontal)
            .onChange(of: isOn) { _, newValue in
                tempText = newValue ? "Hot!" : "Cold"
                vm.updateLight(isOn: newValue)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct TemperatureView: View {
    let text: String
    let isOn: Bool
    
    var body: some View {
        VStack(alignment: isOn ? .leading : .trailing) {
            Rectangle()
                .foregroundColor(.clear)
                .border(.white, width: 5)
            
            HStack {
                Text(text)
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
