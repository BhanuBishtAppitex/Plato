//
//  ModelForMessages.swift
//  Plato
//
//  Created by wOOx Technology on 15/11/22.
//

import Foundation

struct ModelForMessagesPage {
    static let profileImage: [String] = [
        "messagesProfileImage-1",
        "messagesProfileImage-2",
        "messagesProfileImage-3",
        "messagesProfileImage-4",
        "messagesProfileImage-5",
        "messagesProfileImage-6",
        "messagesProfileImage-7",
        "messagesProfileImage-8",
    ]
    static let nameText: [String] = [
        "Ariana Gray",
        "Kristin Watson",
        "Cameron Williamson",
        "Jacob Jones",
        "Esther Howard",
        "Floyd Miles",
        "Wade Warren",
        "Savannah Nguyen",
    ]
    static let isSeen: [Bool] = [
        false,
        false,
        false,
        false,
        true,
        true,
        true,
        true,
        
    ]

    static let lastMessage: [LastMessage] = [
        LastMessage.Text, 
        LastMessage.Video,
        LastMessage.Image,
        LastMessage.Text, 
        LastMessage.Video,
        LastMessage.Video,
        LastMessage.Text, 
        LastMessage.Text, 
    ]
    static let messagesText: [String] = [
        "How are you ?",
        "na",
        "Image",
        "Send it quickly ⏩",
        "na",
        "na",
        "Why not ? 🙄",
        "Browse recordings of end to end user.....",
    ]
    static let timeText: [String] = [
        "4:42",
        "2:28",
        "Yesterday",
        "7/11/2022",
        "na",
        "na",
        "na",
        "na",
    ]
    static let notificationText: [String] = [
        "2",
        "7",
        "3",
        "1",
        "na",
        "na",
        "na",
        "na",
    ]
    
}

enum LastMessage {
    case Text
    case Video
    case Image
    
}
