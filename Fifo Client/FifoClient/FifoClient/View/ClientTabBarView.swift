//
//  ContentView.swift
//  FloatingTabbar
//
//  Created by Puspank Kumar on 16/05/20.
//  Copyright © 2020 Puspank Kumar. All rights reserved.
//

import SwiftUI

struct ClientTabBarView: View {
    
    @State var selected = 0
    
    var body: some View {
   
        ZStack(alignment: .bottom){
            VStack{
                if self.selected == 0{
                    ExploreView()
                }
                else if self.selected == 1{
                    TicketView()
                }
            }
            FloatingTabbar(selected: self.$selected)
        }
  
    }
}

struct FloatingTabbar: View {
    @Binding var selected: Int
  
    
    var body: some View {
        
        HStack{
          
            HStack {
                    Button(action: {
                         self.selected = 0
                     }) {
                         Image("Esplora")
                             .foregroundColor(self.selected == 0 ? Color("ClientOrange") : .gray)
                             .padding(.horizontal)
                     }
                    
                     
                     Button(action: {
                         self.selected = 1
                         
                     }) {
                         Image("TicketIcon")
                             .foregroundColor(self.selected == 1 ? Color("ClientOrange") : .gray)
                             .padding(.horizontal)
                     }

                     
                
            }
        .background(RoundedRectangle(cornerRadius: 30)
        .frame(width: 255, height: 60)
        .foregroundColor(Color.white)
        .shadow(radius: 10))
       
      
    
        
        }
    }
}

struct ClientTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ClientTabBarView()
    }
}
