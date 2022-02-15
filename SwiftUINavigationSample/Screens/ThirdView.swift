//
//  ThirdView.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

import SwiftUI

struct ThirdView: View {
    @State private var direction: NavigationDirection?

    var body: some View {
        VStack {
            Text("Third View")
        }.navigationBarItems($direction)
            .handleNavigation($direction)
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
