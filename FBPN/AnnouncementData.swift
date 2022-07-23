//
//  AnnouncementData.swift
//  FBPN
//
//  Created by WX on 22/7/22.
//

import Foundation
import SwiftUI

class AnnouncementData: ObservableObject {
    @Published var announcements: [Announcement] = [] {
        didSet {
            save()
        }
    }
    init() {
        load()
    }
    
    let sampleAnnouncements = [Announcement(title: "Something", icon: "", description: """
                                        very cool, right?
                                        
                                        Here's some info
                                           
                                        Category icons
                                            English: book
                                            Math: skew
                                            Science: testtube.2
                                            MT: globe
                                            Misc: speaker.badge.exclamationmark
                                            Important: exclamationmark.bubble.fill
                                        """, name: "By Administrator", tag: [.Important])]
    
    
    func getArchiveURL() -> URL {
        let plistName = "Announcement.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName)
    }
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedAnnouncements = try? propertyListEncoder.encode(announcements)
        try? encodedAnnouncements?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalAnnouncements: [Announcement]!
        
        if let retrievedAnnouncementsData = try? Data(contentsOf: archiveURL),
           let decodedAnnouncements = try? propertyListDecoder.decode(Array<Announcement>.self, from: retrievedAnnouncementsData) {
            finalAnnouncements = decodedAnnouncements
        } else {
            finalAnnouncements = sampleAnnouncements
        }
        announcements = finalAnnouncements
    }
}


