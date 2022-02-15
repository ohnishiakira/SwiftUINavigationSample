//
//  SecondView.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

import SwiftUI

struct SecondView: View {
    @State private var direction: NavigationDirection?

    var body: some View {
        VStack {
            Text("Second View")
                .accessibilityIdentifier("heading")

            Button("Next") {
                direction = .push(destination: .third)
            }.accessibilityIdentifier("next")
        }.navigationBarItems($direction)
            .handleNavigation($direction)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
