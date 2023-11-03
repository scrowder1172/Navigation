//
//  NavigationStackReturnToRootView.swift
//  Navigation
//
//  Created by SCOTT CROWDER on 11/3/23.
//

import SwiftUI

struct RandomNumberView: View {
    var number: Int
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct NavigationStackReturnToRootView: View {
    @State private var path: [Int] = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            RandomNumberView(number: 0)
                .navigationDestination(for: Int.self) {i in
                    RandomNumberView(number: i)
                }
        }
    }
}

struct GoHomeRandomNumberView: View {
    var number: Int
    @Binding var path: [Int]
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                }
            }
    }
}

struct GoHomeNavigationView: View {
    @State private var path: [Int] = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            GoHomeRandomNumberView(number: 0, path: $path)
                .navigationDestination(for: Int.self) {i in
                    GoHomeRandomNumberView(number: i, path: $path)
                }
        }
    }
}

struct GoHomeRandomNumberViewNavPath: View {
    var number: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct GoHomeNavigationViewNavPath: View {
    @State private var path: NavigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            GoHomeRandomNumberViewNavPath(number: 0, path: $path)
                .navigationDestination(for: Int.self) {i in
                    GoHomeRandomNumberViewNavPath(number: i, path: $path)
                }
        }
    }
}

#Preview {
    GoHomeNavigationViewNavPath()
}
