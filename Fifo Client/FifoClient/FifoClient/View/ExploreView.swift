//
//  ExploreView.swift
//  FifoClient
//
//  Created by Vincenzo Guida on 21/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//

import SwiftUI

struct ExploreView: View {
     init() {
           // To remove only extra separators below the list:
           UITableView.appearance().tableFooterView = UIView()
           UITableView.appearance().backgroundColor = UIColor.clear
           // To remove all separators including the actual ones:
           UITableView.appearance().separatorStyle = .none
           UITableViewCell.appearance().backgroundColor = UIColor.clear
       }

       var body: some View {
       
           ZStack{
               Color("GrayLight")
               .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
//           Text("Esplora")
//           .font(.system(size: 24, weight: .bold))
//               .foregroundColor(Color.black)
         
           List{
               ForEach(1..<10){item in
              
                    TileRow()
            
            
              
             
                }
               }
               
           }
        }
           
       }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
