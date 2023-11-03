//
//  NavigationBarCustomization.swift
//  Navigation
//
//  Created by SCOTT CROWDER on 11/3/23.
//

import SwiftUI

struct NavigationBarCustomization: View {
    @State private var showNavigationBar: Bool = true
    
    var body: some View {
        
        Button(showNavigationBar ? "Hide Nav Bar" : "Show Nav Bar") {
            showNavigationBar.toggle()
        }
        
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Inline title example")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar(showNavigationBar ? .visible : .hidden, for: .navigationBar)
        }
    }
}

#Preview {
    NavigationBarCustomization()
}
