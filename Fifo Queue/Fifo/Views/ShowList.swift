//
//  ConnexionView.swift
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

struct ShowList: View {
    
    
    @State var ticketlist = [Ticket]()
    @State var token: String = ""
    @State var queueName: String

    
    var body: some View {
        
        VStack {

            List {
                Section(header: Text("Person in list") ){
                    ForEach(self.ticketlist) { ticket in
                        Text(ticket.token)
                    }
                    .onDelete(perform: delete)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
            .frame(height: 500.0)


            TextField("Ticket", text: $token)
            
            Button("Create a new ticket"){
                FireBaseMethods().createTicket(queueName: self.queueName, token: self.token)
                self.token = ""
            }
            
            Button("Delete ticket"){
//              FireBaseMethods().deleteTicket(ticketID: self.ticketlist[0].ticketID)
            }
            .padding(25.0)
        }
        .onAppear {
            FireBaseMethods().getTicketsFromAQueueName(queueName: self.queueName) { (result) in
                switch result {
                    case .success(let theResult):
                        self.ticketlist = theResult
                        print("SIZE---onAppear--------" + "\(self.ticketlist.count)")
                    case .failure(let err):
                        print(err.localizedDescription)
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {

        let index = offsets.map({$0})

        print(index.first!)
        
        
        print("ticketlist Size : ")
        print(ticketlist.count)
        
        print("index trying to erase: ")
        print(index.first!)
        
        print("ticket we erase")
        print(ticketlist[index.first!])
    
        FireBaseMethods().deleteTicket(ticketID: ticketlist[index.first!].ticketID)
        ticketlist.remove(atOffsets: offsets)

    }
    
    struct ConnexionView_Previews: PreviewProvider {
        static var previews: some View {
            ShowList(queueName: "")
        }
    }
}



