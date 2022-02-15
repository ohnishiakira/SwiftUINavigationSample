//
//  CartView.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

import SwiftUI

struct CartView: View {
    var dismissAction: NavigationHandler.DismissAction?

    @State var direction: NavigationDirection?

    var body: some View {
        VStack {
            Text("cart")
            Button("Go Order") {
                direction = .dismiss(direction: .push(destination: .order))
            }
        }.handleNavigation($direction, dismissAction: dismissAction)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
