//
//  CheckoutView.swift
//  Cupcake Corner
//
//  Created by Sebastien REMY on 18/06/2020.
//  Copyright © 2020 MonkeyDev. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order: Order
       
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)

                    Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)

                    Button("Place Order") {
                        // place the order
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
