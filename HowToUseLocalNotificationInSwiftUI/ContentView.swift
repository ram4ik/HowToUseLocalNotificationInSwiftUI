//
//  ContentView.swift
//  HowToUseLocalNotificationInSwiftUI
//
//  Created by ramil on 05.08.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var notificationManager = LocalNotificationManager()
    
    @State var showFootnote = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    withAnimation {
                        self.showFootnote.toggle()
                        self.notificationManager.sendNotifications(title: "SwifUI", subTitle: "Awesome notification", body: "SwiftUI ROCKS!", launchIn: 5)
                    }
                }, label: {
                    Text("Show Notification")
                })
                
                if showFootnote {
                    Text("Notification will arrive in 5 seconds")
                        .font(.footnote)
                }
            }.navigationBarTitle("Local Notification", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
