//
//  ModelForIntroductoryPage.swift
//  Plato
//
//  Created by wOOx Technology on 18/11/22.
//

import Foundation

struct ModelForIntroductoryPage {
    static let data: [IntroductoryPageData] = [
        IntroductoryPageData(mainImage: "Introductory-1", mainTitle: "Welcome to Plato !",
                             secondTitle: "Continue for secure and quality communication !",
                             buttonText: "Continue",
                             thirdText: "By continuing you agree to the terms of use",
                             pageNumber: 0),
        
        IntroductoryPageData(mainImage: "Introductory-2", mainTitle: "High Quality",
                             secondTitle: " Plato offers HD quality voice and video calls up to 15 people around the globe.",
                             buttonText: "Next",
                             thirdText: "",
                             pageNumber: 1),
        
        IntroductoryPageData(mainImage: "Introductory-3", mainTitle: "Share ",
                             secondTitle: "Plato allows you to share photos, documents, voice messages, location and share your memories in your status.",
                             buttonText: "NExt",
                             thirdText: "",
                             pageNumber: 3),
        
    ]
    
}

struct IntroductoryPageData {
    let mainImage: String
    let mainTitle: String
    let secondTitle: String
    let buttonText: String
    let thirdText: String
    let pageNumber: Int
}
