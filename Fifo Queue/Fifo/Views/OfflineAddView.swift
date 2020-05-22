//
//  OfflineAddView.swift
//  Fifo
//
//  Created by Vincenzo Guida on 20/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//

import SwiftUI

struct OfflineAddView: View {
    @State var nametable: String = ""
        @State var cellnumber: String = ""
    var body: some View {
        ZStack{
            Color("GrayLight")
            .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Numero Persone")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
                HStack{
                    Image("Plus")
                    Text("5")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.black)
                    Image("Plus")
                }
                Text("Nome tavolo")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
                TextField("Mario", text: $nametable)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                Text("Numero di telefono")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
                TextField("123 456 7890", text: $cellnumber)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: HomeView()) {
                                   HStack {
                                       Text("Aggiungi")
                                       .font(.system(size: 23, weight: .bold))
                                       .foregroundColor(.white)
                                    
                                     
                                           
                                   }
                                   .padding()
                                   .frame(width: 209, height: 59)
                                   .foregroundColor(.white)
                                   .background(Color("ClientBlue"))
                                   .cornerRadius(15)
                }
            
                
            }.padding()
        }
    }
}

struct OfflineAddView_Previews: PreviewProvider {
    static var previews: some View {
        OfflineAddView()
    }
}
