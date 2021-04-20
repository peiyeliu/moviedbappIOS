//
//  LoadDemo.swift
//  HW9_Movie
//
//  Created by PYL on 4/19/21.
//

import SwiftUI
import ActivityIndicatorView
struct LoadDemo: View {
    @State private var showLoadingIndicator = true

    var body: some View {
        Text("hello world")
    }
}

struct LoadDemo_Previews: PreviewProvider {
    static var previews: some View {
        LoadDemo()
    }
}
