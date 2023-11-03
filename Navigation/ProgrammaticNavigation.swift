//
//  ProgrammaticNavigation.swift
//  Navigation
//
//  Created by SCOTT CROWDER on 11/3/23.
//

import SwiftUI

struct ProgrammaticNavigation: View {
    @State private var path:[Int] = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                
                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You've selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigation()
}
