//
//  Models.swift
//  Fifo
//
//  Created by Nicolas Lucchetta on 12/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//

import Foundation

struct Queue: Identifiable {
    var id =  UUID()      // This ID is created inside the app to allow th object be used in a List
    var queueID : String  // This ID will be the one saved in the FireBaseDatabase
    var name : String     // This will be the name of the list found in the database
    var email: String
    var tickets : [Ticket]?
}

struct Ticket: Identifiable {
    var id = UUID()       // This ID is created inside the app to allow th object be used in a List
    var ticketID : String // This ID will be the one saved in the FireBaseDatabase
    var token : String    // This will be the token of the ticket wich will help us to retrieve the due ticket
    var queueName : String  // This will be the Queue ID of the list in the wich we have to look for the token
}

