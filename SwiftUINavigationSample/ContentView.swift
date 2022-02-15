//
//  ContentView.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

import SwiftUI

struct ContentView: View {
    // TODO: タブをタップするとルートに戻ってほしい
    var body: some View {
        TabView {
            firstTab
        }
    }

    var firstTab: some View {
        NavigationView {
            FirstView()
        }.tabItem {
            Image(systemName: "1.square.fill")
            Text("Tab 1")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
