//
//  EditNavigationBarTitle.swift
//  Navigation
//
//  Created by SCOTT CROWDER on 11/3/23.
//

import SwiftUI

struct EditNavigationBarTitle: View {
    @State private var navBarTitle: String = "Hello, World!"
    var body: some View {
        NavigationStack {
            Text("You can change the title bar text if you click the little arrow.")
                .navigationTitle($navBarTitle)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Print the title bar title") {
                        print(navBarTitle)
                    }
                }
        }
        
    }
}

#Preview {
    EditNavigationBarTitle()
}
