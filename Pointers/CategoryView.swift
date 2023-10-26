//
//  CategoryView.swift
//  Pointers
//
//  Created by Julia Gurbanova on 26.10.2023.
//

import SwiftUI

struct CategoryView: View {
    let category: Category
    let columns: [GridItem] = [.init(.adaptive(minimum: 100, maximum: 200))]

    let selection: (String) -> Void

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(category.items, id: \.self) { item in
                    Button {
                        selection(item)
                    } label: {
                        ItemView(item: item)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .navigationTitle(category.id)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let categories = Bundle.main.decode([Category].self, from: "Items.json")
        CategoryView(category: categories[0]) { _ in }
    }
}

