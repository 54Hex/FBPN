//
//  NewAnnoucementView .swift
//  FBPN
//
//  Created by WX on 22/7/22.
//

import SwiftUI

struct NewAnnoucementView_: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var announcements: [Announcement]
    @State var announcement = Announcement(title: "", icon: "", description: "", name: "",
                                           tag: [.Important])
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Header")) {
                    TextField("Annoucement Title",text: $announcement.title)
                        .keyboardType(.default)
                    HStack {
                        Image(systemName: announcement.icon)
                        TextField("Icon", text: $announcement.icon)
                            .autocapitalization(.none)
                    }
                }
                
                Section(header: Text("Message")) {
                    TextEditor(text: $announcement.description)
                        .keyboardType(.default)
                    TextField("Insert name here", text: $announcement.name)
                }
                
                
                Section(header: Text("Pick Category")) {
                    Picker("Category", selection: $announcement.tag[0]) {
                        Text("English")
                            .tag(Tag.English)
                        Text("Math")
                            .tag(Tag.Math)
                        Text("Mother Tongue")
                            .tag(Tag.MT)
                        Text("Science")
                            .tag(Tag.Science)
                        Text("Miscellaneous")
                            .tag(Tag.Misc)
                        Text("Important")
                            .tag(Tag.Important)
                        
                    }.pickerStyle(MenuPickerStyle())
                }
                
                Section {
                    Button("Publish") {
                        //                        print("\(usrInput)")
                        presentationMode.wrappedValue.dismiss()
                        
                    }
                    .foregroundColor(Color(CC.Firery))
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.blue)
                    
                    
                }
                
            }
            .navigationTitle("New Announcement")
        }
        
    }
    
}

enum Tag: String, Codable {
    case English = "English"
    case Math = "Math"
    case Science = "Science"
    case MT = "Mother Tongue"
    case Misc = "Miscellaneous"
    case Important = "Important"
    
    func getSymbolName() -> String {
        switch self {
            
        case.English:
            return "book"
        case .Math:
            return "skew"
        case .Science:
            return "testtube.2"
        case .MT:
            return "globe"
        case .Misc:
            return "speaker.badge.exclamationmark"
        case .Important:
            return "exclamationmark.bubble.fill"
            
        }
    }
}

struct Announcement: Identifiable, Equatable, Codable {
    var id = UUID()
    var title: String
    var icon: String
    var description: String
    var name: String
    var tag: [Tag]
}


