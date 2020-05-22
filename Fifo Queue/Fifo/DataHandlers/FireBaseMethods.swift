//  FireBaseMethods.swift
//  Fifo
//
//  Created by Nicolas Lucchetta on 12/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//
//
import Foundation
import Firebase
import FirebaseFirestore
import UIKit

struct FireBaseMethods {
        
    func getTicketFromAToken(token: String, completion: @escaping (Result<Ticket, Error>) -> ()) {
    /* Instanciate a variable for our fireBase Database */
        let fireStoreDB = Firestore.firestore()
    /* Instanciate temporary variables for the ticket attributes. */
        var ticketID = ""
        var queueName = ""

    /* Call the database for the collection "queue" and check the one with that match with the queue ID we send */        fireStoreDB.collection("Ticket").whereField("token", isEqualTo: token).addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                /* if a snapshot is found we are going to treat each of the documents founded */
                if snapshot?.isEmpty != true && snapshot != nil {
                    /* For each document found in the collection we set the temporary variable with the attribute we need from the document. */
                    for document in snapshot!.documents {
                        if let documentid = document.documentID as? String {
                            ticketID  = documentid
                        }
                        if let QueueName = document.get("queueName") as? String {
                            queueName = QueueName
                        }
                        /* Once we have all of his elements, we create a new Ticket object and add it to the array. */
                        let ticket = Ticket(ticketID: ticketID, token: token, queueName: queueName)
                        DispatchQueue.main.async {
                            completion(.success(ticket))
                        }
                    }
                }
            }
        }
    }
    
   
    /*------------ QET A QUEUE WITH ALL ITS TICKETS INSIDE THANKS TO A QUEUENAME ------------*/
    func getAQueueFromAToken(token: String, completion: @escaping (Result<Queue, Error>) -> ()){
    /* Instanciate a variable for our fireBase Database */
        let fireStoreDB = Firestore.firestore()
    /* Instanciate temporary variables for the ticket attributes. */
        var ticketID = ""
        var queueName = ""
    /* Call the database for the collection "queue" and check the one with that match with the queue ID we send */       fireStoreDB.collection("ticket").whereField("token", isEqualTo: token).addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                /* if a snapshot is found we are going to treat each of the documents founded */
                if snapshot?.isEmpty != true && snapshot != nil {
                    /* For each document found in the collection we set the temporary variable with the attribute we need from the document. */
                    for document in snapshot!.documents {
                        if let documentid = document.documentID as? String {
                            ticketID  = documentid
                        }
                        if let QueueName = document.get("queueName") as? String {
                            queueName = QueueName
                        }
                        /* Once we have all of his elements, we create a new Ticket object and add it to the array. */
                        let ticket = Ticket(ticketID: ticketID, token: token, queueName: queueName)
                        /* Instanciate temporary variables for the queue attributes. */
                        var queueID : String = ""
                        var name : String = ""
                        var email : String = ""
                            
                        /* Call the database for the collection "post" and check for the results in the completion */
                        fireStoreDB.collection("Queue").whereField("queueName", isEqualTo: queueName).addSnapshotListener { (snapshot, error) in
                            if error != nil {
                                print(error?.localizedDescription)
                            } else {
                                /* if a snapshot is found we are going to treat each of the documents founded */
                                if snapshot?.isEmpty != true && snapshot != nil {
                                    /* For each document found in the collection we set the temporary variable with the attribute we need from the document. */
                                    for document in snapshot!.documents {
                                        if let documentid = document.documentID as? String {
                                            queueID  = documentid
                                        }
                                        if let Name = document.get("queueName") as? String {
                                            name = Name
                                        }
                                        if let Email = document.get("email") as? String {
                                            email = Email
                                        }
                                        /* Once we have all of his elements, we create a new Queue object */
                                        var queue = Queue(queueID: queueID, queueName: name, email: email)
                                        
                                        var token = ""
                                        var ticketID = ""
                                        var ticketsToAdd = [Ticket]()
                                        
                                        /*  And start fulfiling it of Tickets. */
                                        fireStoreDB.collection("Ticket").whereField("queueName", isEqualTo: queueName).addSnapshotListener{ (snapshot, error) in
                                            if snapshot?.isEmpty != true && snapshot != nil {
                                                /* For each document found in the collection we set the temporary variable with the attribute we need from the document. */
                                                ticketsToAdd.removeAll(keepingCapacity: false)

                                                for document in snapshot!.documents {
                                                    if let documentid = document.documentID as? String {
                                                        ticketID  = documentid
                                                    }
                                                    if let Token = document.get("token") as? String {
                                                        token = Token
                                                    }
                                                    /* Once we have all of his elements, we create a new Ticket object and add it to the array. */
                                                    let ticketToAdd = Ticket(ticketID: ticketID, token: token, queueName: queueName)
                                                    ticketsToAdd.append(ticketToAdd)
                                                }
                                                /* Once all tickets have been searched for we add the array of tickets to our queue*/
                                                queue.tickets = ticketsToAdd
                                            }
                                        }
                                        DispatchQueue.main.async {
                                            /* When all the document from the snapshot are treated we complete the function with the fulfilled array. */
                                            completion(.success(queue))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    /*------------ QET A QUEUE WITH ALL ITS TICKETS INSIDE THANKS TO A QUEUENAME ------------*/
    func getAQueueFromAQueueName(queueName: String, completion: @escaping (Result<Queue, Error>) -> ()){
        /* Instanciate a variable for our fireBase Database */
            let fireStoreDB = Firestore.firestore()
        
        /* Instanciate temporary variables for the queue attributes. */
            var queueID : String = ""
            var name : String = ""
            var email : String = ""
        
        /* Call the database for the collection "post" and check for the results in the completion */
           fireStoreDB.collection("queue").whereField("queueName", isEqualTo: queueName).addSnapshotListener { (snapshot, error) in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    /* if a snapshot is found we are going to treat each of the documents founded */
                    if snapshot?.isEmpty != true && snapshot != nil {
                        /* For each document found in the collection we set the temporary variable with the attribute we need from the document. */
                        for document in snapshot!.documents {
                            if let documentid = document.documentID as? String {
                                queueID  = documentid
                            }
                            if let Name = document.get("queueName") as? String {
                                name = Name
                            }
                            if let Email = document.get("email") as? String {
                                email = Email
                            }
                            /* Once we have all of his elements, we create a new Queue object */
                            var queue = Queue(queueID: queueID, queueName: name, email: email)
                            
                            var token = ""
                            var ticketID = ""
                            var ticketsToAdd = [Ticket]()
                            
                            /*  And start fulfiling it of Tickets. */
                            fireStoreDB.collection("Ticket").whereField("queueName", isEqualTo: queueName).addSnapshotListener{ (snapshot, error) in
                                if snapshot?.isEmpty != true && snapshot != nil {
                                    ticketsToAdd.removeAll(keepingCapacity: false)
                                    /* For each document found in the collection we set the temporary variable with the attribute we need from the document. */
                                    for document in snapshot!.documents {
                                        if let documentid = document.documentID as? String {
                                            ticketID  = documentid
                                        }
                                        if let Token = document.get("token") as? String {
                                            token = Token
                                        }
                                        /* Once we have all of his elements, we create a new Ticket object and add it to the array. */
                                        let ticketToAdd = Ticket(ticketID: ticketID, token: token, queueName: queueName)
                                        ticketsToAdd.append(ticketToAdd)
                                    }
                                    /* Once all tickets have been searched for we add the array of tickets to our queue*/
                                    queue.tickets = ticketsToAdd
                                }
                            }
                            DispatchQueue.main.async {
                                /* When all the document from the snapshot are treated we complete the function with the fulfilled array. */
                                    completion(.success(queue))
                            }
                        }
                    }
                }
            }
        }
    
    func getTicketsFromAQueueName(queueName: String, completion: @escaping (Result<[Ticket], Error>) -> ()){
    /* Instanciate a variable for our fireBase Database */
        let fireStoreDB = Firestore.firestore()
    /* Instanciate temporary variables for the ticket attributes. */
        var token = ""
        var ticketID = ""
        var queue = ""
        var ticketsToAdd = [Ticket]()
                                        
   /*  And start fulfiling it of Tickets. */
        fireStoreDB.collection("Ticket").whereField("queueName", isEqualTo: queueName).order(by: "creation").addSnapshotListener{ (snapshot, error) in
            if snapshot?.isEmpty != true && snapshot != nil {
                 ticketsToAdd.removeAll(keepingCapacity: false)
    /* For each document found in the collection we set the temporary variable with the attribute we need from the document. */
                for document in snapshot!.documents {
                    if let documentid = document.documentID as? String {
                        ticketID  = documentid
                    }
                    if let Token = document.get("token") as? String {
                        token = Token
                    }
                    if let QueueNme = document.get("queueName") as? String {
                        queue = QueueNme
                    }
    /* Once we have all of his elements, we create a new Ticket object and add it to the array. */
                    let ticketToAdd = Ticket(ticketID: ticketID, token: token, queueName: queue)
                    ticketsToAdd.append(ticketToAdd)
                }
            /* Once all tickets have been searched for we add the array of tickets to our queue*/
            }
            DispatchQueue.main.async {
                /* When all the document from the snapshot are treated we complete the function with the fulfilled array. */
                completion(.success(ticketsToAdd))
            }
        }
    }
    
    
    /* --------CREATE A TICKET--------- */
    func createTicket(queueName: String, token: String){
            //instanciate our DB
        let fireStoreDatabase = Firestore.firestore()
            //instanciate an empty firebase reference that we will use to add a file in our DB
        var fireStoreReference: DocumentReference? = nil
            
    /* -----We create key pair values:  [field : content, postedBy : Auth.auth().currentUser! etc etc]
                This way we define our object into our DB with the arguments
                and we cast it as [string: any] to fit with firestore compliance   */
        let firePost : [String: Any] = ["queueName" : queueName, "token" : token, "creation" : Date()]

        fireStoreReference = fireStoreDatabase.collection("Ticket").addDocument(data: firePost, completion: {(error) in
            if error != nil {
                // self.alertMessage(title: "Error", message: "issue with : \(error?.localizedDescription ?? "Error")")
            } else {
                
            }
        })
        print(fireStoreReference.debugDescription)
    }
    
        /* --------CREATE A QUEUE-------- */
        func createQueue(queue: Queue){
            //instanciate our DB
            let fireStoreDatabase = Firestore.firestore()
            //instanciate an empty firebase reference that we will use to add a file in our DB
            var fireStoreReference: DocumentReference? = nil
/* -------- We create key pair values:  [field : content, postedBy : Auth.auth().currentUser! etc etc]
              This way we define our object into our DB with the arguments
              and we cast it as [string: any] to fit with firestore compliance   */
            let firePost : [String: Any] = ["queueName" : queue.queueName, "email" : queue.email]

            fireStoreReference = fireStoreDatabase.collection("Queue").addDocument(data: firePost, completion: {(error) in
                if error != nil {
//                    self.alertMessage(title: "Error", message: "issue with : \(error?.localizedDescription ?? "Error")")
                } else {
                  
                }
            })
            print(fireStoreReference.debugDescription)
        }
    
    
        func deleteTicket(ticketID: String){
            //instanciate our DB
            
            print("--------DELETING------")
            let fireStoreDatabase = Firestore.firestore()
                   
            fireStoreDatabase.collection("Ticket").document(ticketID).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
        }
    
    
    
    
    
    
    
        /*---------CONNEXION--------*/
    func signIn(email: String, queueName: String,password: String) {
            if queueName != "" && password != ""  && email != ""{
                Auth.auth().signIn(withEmail: email, password: password) {(authData, error) in
                    if error != nil {
                        //  swift ui aler -> alertMessage(title: "Error", message: error?.localizedDescription ?? "Error try again")
                    } else {
                       //  swift ui aler ->  self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    }
                }
            } else {
               //  swift ui aler ->  alertMessage(title: "Missing Field", message: "Please fill in both field correctly")
            }
        }
        func signUp(email: String,password: String) {
            if password != ""  && email != "" {
                Auth.auth().createUser(withEmail: email, password: password) {(authData, error) in
                    if error != nil {
                        // firebase should take care of it
                        // uiKit alert ->  self.alertMessage(title: "Error", message: error?.localizedDescription ?? "Error try again")
                    } else {
                        // UIKit alert -> self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    }
                }
            } else {
                 // swift ui alert -> alertMessage(title: "Missing Field", message: "Please fill in both field correctly")
            }
        }
}








// Func to download image from the database wich we will probably never need but we never kno

//    func loadImage(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
//        let imageRef = Storage.storage().reference(forURL: url)
//        imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
//            if let error = error {
//                print("\(error)")
//            }
//            if let data = data {
//                completion(.success(data))
//            } else { return }
//        }
//    }


//func getTicketsFromAQueueName(queueName: String, completion: @escaping (Result<[Ticket], Error>) -> ()){
//    /* Instanciate a variable for our fireBase Database */
//    let fireStoreDB = Firestore.firestore()
//
//    var token = ""
//    var ticketID = ""
//    var ticketsToAdd = [Ticket]()
//
//    fireStoreDB.collection("ticket").whereField("QueueName", isEqualTo: queueName).addSnapshotListener{ (snapshot, error) in
//        if snapshot?.isEmpty != true && snapshot != nil {
//            /* For each document found in the collection we set the temporary variable with the attribute we need from the document. */
//            for document in snapshot!.documents {
//                if let documentid = document.documentID as? String {
//                    ticketID  = documentid
//                }
//                if let Token = document.get("token") as? String {
//                    token = Token
//                }
//                /* Once we have all of his elements, we create a new Ticket object and add it to the array. */
//                let ticketToAdd = Ticket(ticketID: ticketID, token: token, QueueName: queueName)
//                ticketsToAdd.append(ticketToAdd)
//            }
//            DispatchQueue.main.async {
//                completion(.success(ticketsToAdd))
//            }
//        }
//    }
//}

