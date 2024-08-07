//
//  AddressView.swift
//  CupCakeCorner
//
//  Created by Arshad Shaik on 06/08/24.
//

import SwiftUI

struct AddressView: View {
  @Bindable var order: Order
  
  var body: some View {
    Form {
      Section {
        TextField("Name", text: $order.name)
        TextField("Street Address", text: $order.streetAddress)
        TextField("City", text: $order.city)
        TextField("Zip", text: $order.zip)
      }
      
      Section {
        NavigationLink("Check Out") {
          CheckOutView(order: order)
        }
        .disabled(order.validAddress == false)
      }
    }
    .navigationTitle("Delivery Details")
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  AddressView(order: Order())
}
