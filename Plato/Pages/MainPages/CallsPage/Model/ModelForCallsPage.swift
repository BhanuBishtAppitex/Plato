//
//  ModelForCallsPage.swift
//  Plato
//
//  Created by wOOx Technology on 16/11/22.
//

import Foundation

struct ModelForCallsPage {
    static let mainImage: String = "messagesProfileImage-1"
    static let nameText: [String] = [
        "Savannah Nguyen",
        "Annette Black",
        "Brooklyn Simmons",
        "Robert Fox",
        "Wade Warren",
        "Jane Cooper"
    ]
    static let callIndicatorImage: [CallIndicator] = [
        .Incoming,
        .Outgoing,
        .Outgoing,
        .Incoming,
        .Incoming,
        .Incoming
    ]
    static let timeText: [String] = [
        "Today, 4:45 Pm",
        "Today, 3:53 Pm",
        "Today, 3:42 Pm",
        "Today, 2:51 Pm",
        "Today, 2:01 Pm",
        "Today, 1:38 Pm"
    ]
    static let righSideCallIndicator: [RightSideCallIndicator] = [
        .VideCall,
        .VideCall,
        .PhoneCall,
        .PhoneCall,
        .VideCall,
        .VideCall
    ]
}


enum CallIndicator {
    case Incoming
    case Outgoing
}

enum RightSideCallIndicator {
    case VideCall
    case PhoneCall
}
