//
//  OrderView.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

import SwiftUI

struct OrderView: View {
    @State var direction: NavigationDirection?

    var body: some View {
        VStack {
            Text("Order View")

            Button("Order") {
                direction = .push(destination: .complete)
            }
        }.handleNavigation($direction)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
