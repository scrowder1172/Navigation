//
//  SaveNavigationStackPath.swift
//  Navigation
//
//  Created by SCOTT CROWDER on 11/3/23.
//

import SwiftUI

@Observable
class HomogenousPathStore {
    var path: [Int] {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }
        
        // set path to empty array if url can't be found or loaded
        path = []
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

@Observable
class NavigationPathPathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        // set path to empty array if url can't be found or loaded
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct SavePathDetailView: View {
    var number: Int
    var body: some View {
        NavigationLink("Go to a Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct SaveNavigationStackPath: View {
    @State private var pathStore: NavigationPathPathStore = NavigationPathPathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            SavePathDetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    SavePathDetailView(number: i)
            }
        }
    }
}

#Preview {
    SaveNavigationStackPath()
}
