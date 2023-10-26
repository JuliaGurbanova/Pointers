//
//  ContentView.swift
//  Pointers
//
//  Created by Julia Gurbanova on 26.10.2023.
//

import SwiftUI

struct ContentView: View {
    let categories = Bundle.main.decode([Category].self, from: "Items.json")
    let columns: [GridItem] = [.init(.adaptive(minimum: 100, maximum: 200))]

    @State private var selectedItems = [" "]

    var body: some View {
        VStack(spacing: 0) {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(categories) { category in
                            NavigationLink(value: category) {
                                ItemView(item: category.id)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding([.bottom, .horizontal])
                }
                .navigationTitle("Pointers")
                .navigationDestination(for: Category.self) { category in
                    CategoryView(category: category, selection: select)
                }
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(selectedItems, id: \.self) { item in
                        Button {
                            remove(item)
                        } label: {
                            ItemView(item: item)
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("Remove \(item)")
                        .accessibilityHidden(item == " ")
                    }
                }
                .padding()
            }
            .background(.black.opacity(0.05))
            .shadow(radius: 3)
        }
    }

    func select(_ item: String) {
        if selectedItems.contains(item) {
            remove(item)
        } else {
            if selectedItems.first == " " {
                selectedItems = [item]
            } else {
                selectedItems.append(item)
            }
        }
    }

    func remove(_ item: String) {
        if let index = selectedItems.firstIndex(of: item) {
            selectedItems.remove(at: index)

            if selectedItems.isEmpty {
                selectedItems = [" "]
            }
        }
    }
}

#Preview {
    ContentView()
}
