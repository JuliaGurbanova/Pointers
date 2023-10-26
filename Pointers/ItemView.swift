//
//  ItemView.swift
//  Pointers
//
//  Created by Julia Gurbanova on 26.10.2023.
//

import SwiftUI

struct ItemView: View {
    var item: String

    var body: some View {
        VStack {
            Image(item)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(.rect(cornerRadius: 5))
                .shadow(radius: 3)

            Text(item)
        }
    }
}

#Preview {
    ItemView(item: "Happy")
}
