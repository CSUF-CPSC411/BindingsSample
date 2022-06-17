//
//  ContentView.swift
//  Bindings
//
//  Created by Paul Inventado on 6/16/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var globalUser = User(name: "Paul", password: "1234")
    var body: some View {
        HStack {
            NavigationView {
                VStack {
                    TextField("Name", text: $globalUser.name)
                    TextField("Name", text: $globalUser.password)
                    Text(globalUser.name)
                    Text(globalUser.password)
                    Text("Paul")
                    // Text(address)
                    NavigationLink(destination: Information()) {
                        Text("Information")
                    }
                }
                Information()

            }.environmentObject(globalUser)
        }
    }
}

struct Information: View {
    @EnvironmentObject var globalUser: User
    var body: some View {
        VStack {
            Text(globalUser.password)
            ViewX()
        }
    }
}

struct ViewX: View {
    @EnvironmentObject var globalUser: User
    var body: some View {
        VStack {
            Text(globalUser.password)
        }
    }
}

class User: ObservableObject {
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }

    var name: String
    @Published var password: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
