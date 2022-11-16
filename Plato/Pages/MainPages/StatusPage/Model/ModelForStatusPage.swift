//
//  ModelForStatusPage.swift
//  Plato
//
//  Created by wOOx Technology on 16/11/22.
//

import Foundation


struct ModelForStatusPage {
    
    static let sectionName: [String] = [
        "Recently Updates",
        "Viewed Updates"
    ]
    
    static let recentlyUpdates: [RecentlyUpdates] = [
        RecentlyUpdates(profileImage: "RecentUpdates", numberOfStatus: 4, name: "Arlene McCoy", time: "Today, 4:17 Pm "),
        RecentlyUpdates(profileImage: "RecentUpdates", numberOfStatus: 12, name: "Savannah Nguyen", time: "Today, 2:50 Pm"),
        RecentlyUpdates(profileImage: "RecentUpdates", numberOfStatus: 1, name: "Darlene Robertson", time: "Today, 1:22 Pm "),
        RecentlyUpdates(profileImage: "RecentUpdates", numberOfStatus: 18, name: "Wade Warren", time: "Today, 4:17 Pm "),
    ]
    
    static let viewdUpdates: [ViewdUpdates] = [
        ViewdUpdates(profileImage: "ViewsUpdates", name: "Albert Flores", time: "Today, 4:17 Am"),
        ViewdUpdates(profileImage: "ViewsUpdates", name: "Cameron Williamson", time: "Today, 6:27 Am "),
        ViewdUpdates(profileImage: "ViewsUpdates", name: "Kristin Watson", time: "Today, 6:17 Am "),
        ViewdUpdates(profileImage: "ViewsUpdates", name: "Jacob Jones", time: "Today, 5:52 Am "),
        ViewdUpdates(profileImage: "ViewsUpdates", name: "Esther Howard", time: "Today, 1:26 Pm "),
        ViewdUpdates(profileImage: "ViewsUpdates", name: "Floyd Miles", time: "Yesterday, 6:49 Pm "),
        ViewdUpdates(profileImage: "ViewsUpdates", name: "Wade Warren", time: "Yesterday, 4:41 Pm "),
    ]
    
    
    
    
    
    
}

struct RecentlyUpdates {
    let profileImage: String
    let numberOfStatus: Int
    let name: String
    let time: String
}

struct ViewdUpdates {
    let profileImage: String
    let name: String
    let time: String
}
