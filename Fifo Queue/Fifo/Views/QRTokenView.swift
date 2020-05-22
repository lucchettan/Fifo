//
//  QRTokenView.swift
//  Fifo
//
//  Created by Vincenzo Guida on 20/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//

import SwiftUI

struct QRTokenView: View {
    var body: some View {
        ZStack{
            Color("GrayLight")
            .edgesIgnoringSafeArea(.all)
            Image("Ticket")
                .edgesIgnoringSafeArea(.all)
                .padding(.bottom, 400)
        }
    }
}

struct QRTokenView_Previews: PreviewProvider {
    static var previews: some View {
        QRTokenView()
    }
}
