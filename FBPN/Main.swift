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
    @State private var usrInput: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("", text: $usrInput)
                Button("Publish") {
                    // action code here dumbass
                }
            }
        }
        .navigationTitle("Add annoucement")
        
    }
}



struct CC {
    static let DarkGray = "Gray"
    static let firery = "Fire"
}
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
            .preferredColorScheme(.dark)
    }
}
