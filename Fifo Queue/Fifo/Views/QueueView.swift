//
//  QueueView.swift
//  Fifo
//
//  Created by Nicolas Lucchetta on 12/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//

import SwiftUI

struct QueueView: View {
    @State var Tickets = [Ticket]()
//    @State var Queue : Queue
    var body: some View {
        VStack {
            Text("Fifo")
        }
    }
}

struct QueueView_Previews: PreviewProvider {
    static var previews: some View {
        QueueView()
    }
}


