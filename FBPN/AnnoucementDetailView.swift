//
//  AnnoucementDetailView.swift
//  FBPN
//
//  Created by WX on 22/7/22.
//

import SwiftUI

struct AnnoucementDetailView: View {
    
    
    @Binding var annoucement: Announcement
    
    var body: some View {
            ScrollView {
               
                VStack {
                    ForEach(annoucement.tag, id: \.rawValue) { tag in
                        Label(tag.rawValue, systemImage: tag.getSymbolName())
                            .padding(10)
                            .background(Color(CC.Firery))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    .offset(x: -100)
                    
                    ZStack {
                        Text(annoucement.description)
                            .font(.system(size: 22))
                            .padding()
                            .overlay( RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(CC.DarkGray), lineWidth: 5))
                        
                        Text(annoucement.name)
                            .font(.system(size: 18))
                            .padding(10)
                            .background(.blue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .offset(y: 300)
                        
                        
                    }
                    .navigationTitle(annoucement.title)
                }
               
            }
            
        }
        
    }


struct AnnoucementDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        AnnoucementDetailView(annoucement: .constant(Announcement(title: "Something", icon: "", description: """
                                            very cool, right?
                                            
                                            Here's some info
                                               
                                            Category icons
                                                English: book
                                                Math: skew
                                                Science: testtube.2
                                                MT: globe
                                                Misc: speaker.badge.exclamationmark
                                                Important: exclamationmark.bubble.fill
                                            """, name: "By: Administrator", tag: [.Important])))
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.dark)
    }
}
