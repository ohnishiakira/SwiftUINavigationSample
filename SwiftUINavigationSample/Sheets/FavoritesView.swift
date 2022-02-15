//
//  FavoritesView.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

import SwiftUI

struct FavoritesView: View {
    var dismissAction: NavigationHandler.DismissAction?

    @State var direction: NavigationDirection?

    var body: some View {
        VStack {
            Text("Favorite View")
                .accessibilityIdentifier("heading")
            Button("Go Product") {
                direction = .dismiss(direction: .push(destination: .product(id: 1)))
            }
        }.handleNavigation($direction, dismissAction: dismissAction)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
