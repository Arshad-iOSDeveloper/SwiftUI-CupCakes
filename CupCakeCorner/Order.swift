//
//  Order.swift
//  CupCakeCorner
//
//  Created by Arshad Shaik on 06/08/24.
//

import Foundation

@Observable
class Order: Codable {
  
  enum CodingKeys: String, CodingKey {
      case _type = "type"
      case _quantity = "quantity"
      case _specialRequestEnabled = "specialRequestEnabled"
      case _extraFrosting = "extraFrosting"
      case _addSprinkles = "addSprinkles"
      case _name = "name"
      case _city = "city"
      case _streetAddress = "streetAddress"
      case _zip = "zip"
  }
  
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Blueberry"]
  
  var type = 0
  var quantity = 3
  
  var specialRequestEnabled = false {
    didSet {
      if !specialRequestEnabled {
        extraFrosting = false
        addSprinkles = false
      }
    }
  }
  var extraFrosting = false
  var addSprinkles = false
  
  // Address View Details
  var name = ""
  var streetAddress = ""
  var city = ""
  var zip = ""
  
  // Enable and Disable Check out in Address Details
  var validAddress: Bool {
    if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
      return false
    }
    
    return true
  }
  
  // Checkout View Details
  // Cake cost calculation
  var cost: Decimal {
    // $2 per cake
    var cost = Decimal(quantity) * 2
    
    // complicated cakes cost more
    cost += Decimal(type) / 2
    
    // $1/cake for extra frosting
    if extraFrosting {
      cost += Decimal(quantity)
    }
    
    // $0.50/cake for sprinkles
    if addSprinkles {
      cost += Decimal(quantity) / 2
    }
    
    return cost
  }
}

