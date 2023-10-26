//
//  Category.swift
//  Pointers
//
//  Created by Julia Gurbanova on 26.10.2023.
//

import Foundation

struct Category: Decodable, Hashable, Identifiable {
    var id: String
    var items: [String]
}
