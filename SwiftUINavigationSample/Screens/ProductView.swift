//
//  ProductView.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

import SwiftUI

struct ProductView: View {
    var id: Int

    var body: some View {
        Text("Product View id: \(id)")
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(id: 1)
    }
}
