//
//  FirstView.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

import SwiftUI

struct FirstView: View {
    @State var direction: NavigationDirection?

    var body: some View {
        VStack {
            Text("First View")
                .accessibilityIdentifier("heading")

            Button("Next") {
                direction = .push(destination: .second)
            }.accessibilityIdentifier("next")
        }.navigationBarItems($direction)
            .handleNavigation($direction)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
