//
//  Main.swift
//  FBPN
//
//  Created by WX on 21/7/22.
//

import SwiftUI
import Firebase
import UserNotifications 

struct Main: View {
    @State var usrInput =  (String: "", title: "")
    @State var placeHolder: String = "Write something here..."
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Message")) {
                    TextEditor(text: $usrInput.title)
                       
                    }
                
                Section {
                    Button("Publish") {
                        print("\(usrInput)")
                    }
                    .accentColor(Color(CC.Firery))
                    
                    
                }
            }
            
            .navigationTitle("New Annoucement")
        }
    }
}



struct CC {
    static let DarkGray = "DarkGray"
    static let Firery = "Firery"
}
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
            .preferredColorScheme(.dark)
        
    }
}
