//
//  PlaceToolbarButtonsExactly.swift
//  Navigation
//
//  Created by SCOTT CROWDER on 11/3/23.
//

import SwiftUI

struct PlaceToolbarButtonsExactly: View {
    var body: some View {
        NavigationStack {
            List(1..<5) { i in
                Text("Item #\(i)")
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Agree") {
                        // do something
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        
                    }
                }
                
                ToolbarItemGroup(placement: .destructiveAction) {
                    Button("GB1") {}
                    Button("GB2") {}
                }
                
            }
        }
        
    }
}

#Preview {
    PlaceToolbarButtonsExactly()
}
