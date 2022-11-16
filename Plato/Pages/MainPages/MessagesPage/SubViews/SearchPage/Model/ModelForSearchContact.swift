//
//  ModelForSearchContact.swift
//  Plato
//
//  Created by wOOx Technology on 16/11/22.
//

import Foundation

struct ModelForSearchContact {
    static let categoryString: [String] = [
        "Plato Contacts",
        "Other Contacts"
    ]
    static let platoContact: [PlatoContacts] = [
        PlatoContacts(nameText: "Savannah Nguyen", statusText: "On my way"),
        PlatoContacts(nameText: "Annette Black", statusText: "Available"),
        PlatoContacts(nameText: "Brooklyn Simmons", statusText: "Busy"),
        PlatoContacts(nameText: "Robert Fox", statusText: "Available"),
        PlatoContacts(nameText: "Wade Warren", statusText: "Working"),
        PlatoContacts(nameText: "Jane Cooper", statusText: "Busy"),
    ]
    static let otherContact: [OtherContacts] = [
        OtherContacts( nameText: "Marshall Clayton"),
        OtherContacts( nameText: "Marshall Clayton"),
        OtherContacts( nameText: "Marshall Clayton"),
        OtherContacts( nameText: "Marshall Clayton"),
        OtherContacts( nameText: "Marshall Clayton"),
        OtherContacts( nameText: "Marshall Clayton"),
        OtherContacts( nameText: "Marshall Clayton"),
        OtherContacts( nameText: "Marshall Clayton"),
        OtherContacts( nameText: "Marshall Clayton"),
        OtherContacts( nameText: "Marshall Clayton"),
    ]
    
}

struct PlatoContacts {
    static let profileImage: String = "SearchContactProfile"
    var nameText: String
    var statusText: String
}

struct OtherContacts {
    static let profileImage: String = "SearchContactProfile"
    var nameText: String
    
}

