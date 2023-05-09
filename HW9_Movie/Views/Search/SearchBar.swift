//
//  SearchBar.swift
//  HW9_Movie
//
//  Created by pyl on 5/9/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        TextField("Search", text: $text)
            .padding(7)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 10)
    }
}
