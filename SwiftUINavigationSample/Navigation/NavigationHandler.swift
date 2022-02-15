//
//  NavigationHandler.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

import Foundation
import SwiftUI

// original: https://obscuredpixels.com/abstracting-navigation-in-swiftui

enum NavigationDirection: Equatable {
    case back
    case backToRoot
    case push(destination: NavigationDestination)
    case present(destination: NavigationDestination)
    indirect case dismiss(direction: NavigationDirection?)

    static func == (lhs: NavigationDirection, rhs: NavigationDirection) -> Bool {
        switch (lhs, rhs) {
        case (.back, .back):
            return true
        default:
            return false
        }
    }
}

enum NavigationDestination {
    case first, second, third
    case product(id: Int), order, complete
    case favorites, cart, search
}

enum NavigationStyle {
    case push, present
}

class ViewFactory {
    @ViewBuilder
    func makeView(
        _ destination: NavigationDestination,
        dismissAction: NavigationHandler.DismissAction? = nil
    ) -> some View {
        switch destination {
        case .first:
            FirstView()
        case .second:
            SecondView()
        case .third:
            ThirdView()
        case .product(let id):
            ProductView(id: id)
        case .order:
            OrderView()
        case .complete:
            CompleteView()
        case .favorites:
            FavoritesView(dismissAction: dismissAction)
        case .cart:
            CartView(dismissAction: dismissAction)
        case .search:
            Text("Search View")
        }
    }
}

struct NavigationHandler: ViewModifier {
    typealias DismissAction = (NavigationDirection?) -> Void
    @Environment(\.presentationMode) var presentation

    @Binding var navigationDirection: NavigationDirection?

    var dismissAction: DismissAction?

    @State private var destination: NavigationDestination?

    @State private var sheetActive = false
    @State private var linkActive = false

    let viewFactory = ViewFactory()

    func body(content: Content) -> some View {
        content
            // present
            .background(
                EmptyView()
                    .sheet(isPresented: $sheetActive) {
                        buildDestination(destination) { direction in
                            navigationDirection = direction
                        }
                    }
            )
            // push
            .background(
                NavigationLink(destination: buildDestination(destination), isActive: $linkActive) {
                    EmptyView()
                }
            )
            .onChange(of: navigationDirection) { direction in
                switch direction {
                case .push(let destination):
                    self.destination = destination
                    linkActive = true
                case .present(let destination):
                    self.destination = destination
                    sheetActive = true
                case .back:
                    presentation.wrappedValue.dismiss()
                case .backToRoot:
                    NavigationUtil.popToRootView()
                case .dismiss(let direction):
                    presentation.wrappedValue.dismiss()
                    DispatchQueue.main.async {
                        dismissAction?(direction)
                    }
                case .none:
                    break
                }

                navigationDirection = nil
            }
    }

    @ViewBuilder
    private func buildDestination(
        _ destination: NavigationDestination?,
        dismissAction: NavigationHandler.DismissAction? = nil
    ) -> some View {
        if let destination = destination {
            viewFactory.makeView(destination, dismissAction: dismissAction)
        } else {
            EmptyView()
        }
    }
}

extension View {
    func handleNavigation(
        _ direction: Binding<NavigationDirection?>,
        dismissAction: NavigationHandler.DismissAction? = nil
    ) -> some View {
        modifier(
            NavigationHandler(navigationDirection: direction, dismissAction: dismissAction)
        )
    }
}
