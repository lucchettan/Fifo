//
//  TileRow.swift
//  FifoClient
//
//  Created by Vincenzo Guida on 21/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//

import SwiftUI

struct TileRow: View {
    var body: some View {
        ZStack(alignment: .bottom){
            RoundedRectangle(cornerRadius: 19)
            .frame(width: 313, height: 144)
            .foregroundColor(Color("GrayAntra"))
            Rectangle()
            .frame(width: 313, height: 45)
                .foregroundColor(Color.white)
            HStack{
                Image("Sorbillo")
                    .frame(width: 60, height: 60)
                .clipShape(Circle())
                VStack(alignment: .leading){
                    Text("Gino e Toto Sorbillo")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                    Text("Ristorante")
                    .font(.system(size: 18, weight: .thin))
                    .foregroundColor(.white)
                }
            }.padding(.bottom, 60)
            
          
            
            Button(action: {print("jello")}) {
                                                HStack {
                                                                              Text("Prenota")
                                                                              .font(.system(size: 14, weight: .semibold))
                                                                              .foregroundColor(.white)
                                                                          }
                                                                         
                                                                          .frame(width: 120, height: 30)
                                                                          .foregroundColor(.white)
                                                                          .background(Color("ClientOrange"))
                                                                          .cornerRadius(30)
                                           }.buttonStyle(PlainButtonStyle())
            
            
        }
    }
}

struct TileRow_Previews: PreviewProvider {
    static var previews: some View {
        TileRow()
    }
}
