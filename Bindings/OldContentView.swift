//
//  ContentView.swift
//  Bindings
//
//  Created by Paul Inventado on 6/16/22.
//

import SwiftUI

struct OldContentView: View {
    @State var name: String = "Julia"
    @State var address: String = "800 N State College"
    @StateObject var user: User = User(name: "Paul", password: "1234")
    @StateObject var globalUser = User(name: "Paul", password: "1234")
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $name)
                //TextField("Name", text: $password)
                Text(user.name)
                Text(user.password)
                Text("Paul")
                Text(address)
                NavigationLink(destination: OldInformation(text: $name, address: $address, myUser: user)) {
                    Text("Information")
                }
            }
        }.environmentObject(globalUser)
    }
}

struct OldInformation: View {
    @Binding var text: String
    @Binding var address: String
    @ObservedObject var myUser: User
    @EnvironmentObject var globalUser: User
    var body: some View {
        VStack{
            Text(text)
            Text(address)
            Text(myUser.password)
            OldViewX(myUserX: myUser)
        }
    }
}

struct OldViewX: View {
    @ObservedObject var myUserX: User
    @EnvironmentObject var globalUser: User
    var body: some View {
        VStack{
            
            Text(myUserX.password)
        }
    }
}

/*
 // I commented this out because we are using the User struct from ContentView.swift
 // The code is the same
 class User : ObservableObject {
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
    
    var name: String
    @Published var password: String
}
 */

struct OldContentView_Previews: PreviewProvider {
    static var previews: some View {
        OldContentView()
    }
}
