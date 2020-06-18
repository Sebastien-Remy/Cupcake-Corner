//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Sebastien REMY on 16/06/2020.
//  Copyright © 2020 MonkeyDev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var order = Order()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        // Old code due to a swift bug!
                        // ForEach(0..<Order.types.count, id: \.self) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }

                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }

                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
