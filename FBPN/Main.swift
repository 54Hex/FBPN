//
//  Main.swift
//  FBPN
//
//  Created by WX on 21/7/22.
//

import SwiftUI

struct Main: View {
    
    @Binding var announcements: [Announcement]
    @State var sheetPresented = false
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(announcements) { announcement in
                    let announcementIndex = announcements.firstIndex(of: announcement)!
                    
                    NavigationLink(destination: AnnoucementDetailView(annoucement: $announcements[announcementIndex])) {
                        Image(systemName: announcement.icon)
                        
                        HStack() {
                            Text(announcement.icon)
                                .foregroundColor(Color(CC.Firery))
                                .bold()
                            Text(announcement.title)
                                .font(.system(size: 22))
                                .bold()
                                
                            
                            ForEach(announcement.tag, id: \.rawValue) { type in
                                Image(systemName: type.getSymbolName())
                            }
                        }
                        
                    }
                }
                // edit & delete
                //                    .onDelete { offsets in
                //                        announcements.remove(atOffsets: offsets)
                //                    }.onMove { source, destination in
                //                        announcements.move(fromOffsets: source, toOffset: destination)
                //                    }
            }
            .navigationTitle("Announcements")
            .navigationBarItems(trailing: Button(action: {
                sheetPresented = true
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(Color(CC.Firery))
            }))
        }.sheet(isPresented: $sheetPresented) {
            NewAnnoucementView_(announcements: announcements)
        }
    }
}





struct CC {
    static let DarkGray = "DarkGray"
    static let Firery = "Firery"
}


