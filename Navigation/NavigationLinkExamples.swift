//
//  NavigationLinkExamples.swift
//  Navigation
//
//  Created by SCOTT CROWDER on 11/3/23.
//

import SwiftUI

struct NavigationLinkExamples: View {
    var body: some View {
//        NavigationStack {
//            NavigationLink("Simple") {
//                SimpleNavigationLinkExample()
//            }
//            NavigationLink("Dynamic") {
//                DynamicNavigationLinkExample()
//            }
//            NavigationLink("Advance") {
//                AdvancedNavigationLinkExample()
//            }
//        }
        AdvancedNavigationLinkExample()
    }
}

struct SimpleNavigationLinkExample: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                Text("Detail View")
            }
        }
    }
}

struct DynamicNavigationLinkExample: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                DetailView(number: 556)
            }
        }
        NavigationStack {
            List(0..<1000) { i in
                NavigationLink("Tap Me #\(i)") {
                    DetailView(number: i)
                }
            }
        }

    }
}

struct DetailView: View {
    var number: Int
    
    var body: some View {
         Text("Detail View: \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view #\(number)")
    }
}

struct AdvancedNavigationLinkExample: View {
    var body: some View {
        NavigationStack {
            List(0..<100) {i in
                NavigationLink("Select \(i)", value: i)
                NavigationLink("Go to Detail View", value: "Detail")
                NavigationLink("Get Info On User", value: "Robert Smith")
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
            .navigationDestination(for: Student.self) {student in
                Text("Welcome, \(student.name)")
            }
            .navigationDestination(for: String.self) {text in
                AdvancedDetailView(text: text)
            }
        }
    }
}

struct Student: Hashable {
    var uuid:UUID = UUID()
    var name: String
    var age: Int
}

struct AdvancedDetailView: View {
    let text: String
    var body: some View {
        Text("You are viewing the \(text)")
    }
    
    init(text: String) {
        self.text = text
        print("Display: \(text)")
    }
}

#Preview {
    NavigationLinkExamples()
    //AdvancedNavigationLinkExample()
}
