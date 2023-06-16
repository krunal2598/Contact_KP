//
//  ContentView.swift
//  Contact_KP
//
//  Created by Krunal Parmar on 2023-06-15.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var contacts = DataModel.data
    
    var filteredContacts: [ContactData] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter { contact in
                contact.fullName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredContacts, id: \.id) { contact in
                NavigationLink(destination: ContactDetailView(contact: contact)) {
                    HStack {
                        Text(contact.fullName)
                            .font(.headline)
                        
                        Spacer()
                        
                        if contact.isFavorite {
                            Image(systemName: "star.fill")
                                .font(.headline)
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationBarTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        addRandomContact()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Reset") {
                        resetContacts()
                    }
                }
            }
            .overlay(
                VStack {
                    Spacer()
                    Text("Total Contacts: \(filteredContacts.count)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.bottom, 8)
                }
                .padding()
                , alignment: .bottom
            )
        }
        .padding()
    }
    
    func addRandomContact() {
        let randomContact = ContactData(id: DataModel.data.count + 1,
                                        fullName: "Random Contact",
                                        phone: "1234567890",
                                        email: "random.contact@gmail.com",
                                        address: "Random Address",
                                        isFavorite: false)
        contacts.append(randomContact)
    }
    
    func resetContacts() {
        contacts = DataModel.data
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
