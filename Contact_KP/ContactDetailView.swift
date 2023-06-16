//
//  ContactDetailView.swift
//  Contact_KP
//
//  Created by Krunal Parmar on 2023-06-15.
//

import SwiftUI

struct ContactDetailView: View {
    var contact: ContactData // The selected contact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center)  {
                Text(contact.fullName)
                    .font(.largeTitle)
//                    .frame(maxWidth: .infinity, alignment: .center) // Alignment of name
                
                if contact.isFavorite {
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundColor(.yellow) // Display a yellow star for favourite contact
                } else {
                    Image(systemName: "star")
                        .font(.headline)
                        .foregroundColor(.gray) // Display unfilled star if contact is not a favourite
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom, 5)
            .overlay(Divider(), alignment: .bottom) // Horizontal line after name
            
            // Phone row
            ContactInfoRow(label: "Phone", value: contact.phone)
            
            // Email row
            ContactInfoRow(label: "Email", value: contact.email)
            
            // Address row (full address, including city and country)
            ContactInfoRow(label: "Address", value: contact.address)
            
            Spacer()
        }
        .padding()
        .foregroundColor(.black)
    }
}

struct ContactInfoRow: View {
    var label: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(label) // Left label color is black
                Spacer()
                Text(value)
                    .foregroundColor(.gray) // Right label color is gray
            }
            
            Divider() // Divider after each row
        }
        .padding(.vertical, 5)
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let contact = ContactData(id: 1, fullName: "John Doe", phone: "1234567890", email: "john.doe@gmail.com", address: "123 Main St, City, Country", isFavorite: true)
        ContactDetailView(contact: contact)
    }
}
