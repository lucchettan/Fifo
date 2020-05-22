//
//  TicketView.swift
//  FifoClient
//
//  Created by Vincenzo Guida on 21/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        ZStack{
        Color("GrayLight")
        .edgesIgnoringSafeArea(.all)
            VStack{
                Text("2")
                .font(.system(size: 172, weight: .black))
                .foregroundColor(.black)
                Text("PEOPLE TO GO")
                .font(.system(size: 35, weight: .black))
                .foregroundColor(.black)
                HStack{
                    Image(systemName: "clock")
                    Text("21:00 - 21:15")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
