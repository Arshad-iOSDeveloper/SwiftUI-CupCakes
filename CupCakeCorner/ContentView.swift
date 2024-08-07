//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Arshad Shaik on 31/07/24.
//

import SwiftUI

struct ContentView: View {
  @State private var order = Order()
  
    var body: some View {
      NavigationStack {
        Section {
          Form {
            Picker("Select Cake Type", selection: $order.type) {
              ForEach(Order.types.indices, id: \.self) {
                Text(Order.types[$0])
              }
            }
            
            Stepper("Number of Cakes are \(order.quantity)", value: $order.quantity, in: 3...20)
            
            Section {
              Toggle("Any Special Request", isOn: $order.specialRequestEnabled.animation())
              
              if order.specialRequestEnabled {
                Toggle("Add extra frosting", isOn: $order.extraFrosting)
                
                Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
              }
            }
            
            Section {
              NavigationLink("Delivery details") {
                AddressView(order: order)
              }
            }
            
          }
        }
        
        .navigationTitle("CupCake Corner")
      }
    }
}

#Preview {
    ContentView()
}
