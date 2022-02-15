//
//  CompleteView.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

import SwiftUI

struct CompleteView: View {
    @State var direction: NavigationDirection?

    var body: some View {
        VStack {
            Text("Complete View")
            Button("Back to Top") {
                direction = .backToRoot
            }
        }.navigationBarBackButtonHidden(true)
            .handleNavigation($direction)
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}
