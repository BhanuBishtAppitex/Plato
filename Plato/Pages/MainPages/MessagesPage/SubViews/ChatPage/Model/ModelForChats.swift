//
//  ModelForChats.swift
//  Plato
//
//  Created by wOOx Technology on 17/11/22.
//

import Foundation


struct ModelForChats {
    static let messages: [Messages] = [
        Messages(messageText: "Hi", timeText: "12:45 Pm", sender: .Other),
        Messages(messageText: "Hey ", timeText: "12:45 Pm", sender: .User),
        Messages(messageText: "SUP !", timeText: "12:45 Pm", sender: .User),
        Messages(messageText: "Nothing", timeText: "12:46 Pm", sender: .Other),
        Messages(messageText: "I mailed you images to color correct. Are they done ?", timeText: "12:46 Pm", sender: .Other),
        Messages(messageText: "No ! one of them was crypted, so can you share it again ?", timeText: "12:46 Pm", sender: .User),
    ]
}


struct Messages {
    let messageText: String
    let timeText: String
    let sender: Sender
}

enum Sender {
    case User
    case Other
}
