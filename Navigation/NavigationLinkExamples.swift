//
//  NavigationLinkExamples.swift
//  Navigation
//
//  Created by SCOTT CROWDER on 11/3/23.
//

import SwiftUI

struct NavigationLinkExamples: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                Text("Detail View")
            }
        }
    }
}

#Preview {
    NavigationLinkExamples()
}
