//
//  NavigationBarItems.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

import SwiftUI

struct NavigationBarItems: ViewModifier {
    @Binding var navigationDirection: NavigationDirection?

    func body(content: Content) -> some View {
        content
            .toolbar {
                HStack {
                    Button(action: { navigationDirection = .present(destination: .search) }) {
                        Image(systemName: "magnifyingglass")
                    }.accessibilityIdentifier("nav-search")

                    Button(action: { navigationDirection = .present(destination: .favorites) }) {
                        Image(systemName: "heart")
                    }.accessibilityIdentifier("nav-favorites")

                    Button(action: { navigationDirection = .present(destination: .cart) }) {
                        Image(systemName: "cart")
                    }.accessibilityIdentifier("nav-cart")
                }
            }
    }
}

extension View {
    func navigationBarItems(_ direction: Binding<NavigationDirection?>) -> some View {
        modifier(NavigationBarItems(navigationDirection: direction))
    }
}
