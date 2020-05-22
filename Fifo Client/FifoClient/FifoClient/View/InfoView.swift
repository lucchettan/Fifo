//
//  InfoView.swift
//  FifoClient
//
//  Created by Vincenzo Guida on 21/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
 @State private var showingSheet = false

   

    var body: some View {
        ZStack{
            Color("GrayLight")
              .edgesIgnoringSafeArea(.all)
            VStack{
            ZStack{
                Image("SorbilloTemplate")
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
                }
            }
                VStack{
                    RoundedRectangle(cornerRadius: 16)
                    .frame(width: 256, height: 56)
                    .foregroundColor(Color.white)
                    RoundedRectangle(cornerRadius: 16)
                    .frame(width: 256, height: 56)
                    .foregroundColor(Color.white)
                    RoundedRectangle(cornerRadius: 16)
                    .frame(width: 256, height: 56)
                    .foregroundColor(Color.white)
                    
                }
                
              Button(action: {
                    self.showingSheet = true
                }) {
                    Text("Show Action Sheet")
                }
                .actionSheet(isPresented: $showingSheet) {
                    ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
                }
            
            }
        }
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
