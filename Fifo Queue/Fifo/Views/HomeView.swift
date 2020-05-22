//
//  FirstView.swift
//  Fifo
//
//  Created by Nicolas Lucchetta on 12/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//

import SwiftUI
import Foundation
import Firebase
import FirebaseFirestore
import UIKit

struct HomeView: View {
    
    @State var queue = Queue(queueID: "", queueName: "", email: "", tickets: [Ticket]())
    @State var nameField = ""
    var body: some View {
        NavigationView{
            VStack {
                Text("Fifo")
                Spacer()
                Text("Create your queue!")

                TextField("Name of queue", text: $nameField)
                Spacer()
                
                NavigationLink(destination: ShowList(queueName: self.nameField)){
                    Text("Create a queue")
                }
                .padding(25.0)
                .simultaneousGesture(TapGesture().onEnded{
                    print("namefield is : ")
                    print(self.nameField)
                    self.queue.queueName = self.nameField
                    FireBaseMethods().createQueue(queue: self.queue)
                })
            }
        }
    }
}


struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
