//
//  HomeAdmin.swift
//  FifoFrontEnd
//
//  Created by Vincenzo Guida on 15/05/2020.
//  Copyright © 2020 Vincenzo Guida. All rights reserved.
//

import SwiftUI

struct StartClientView: View {
    @State var clientname: String = ""
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        NavigationView{
            ZStack{
                
                Image("ClientBackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                
                
                
                VStack{
                    Text("FIFO")
                        .font(.system(size: 123, weight: .black))
                        .foregroundColor(Color("ClientOrange"))
                    Spacer()
                        .frame(width: 100)
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 47)
                            .frame(width: 352, height: 278)
                            .foregroundColor(Color("GrayAntra"))
                        
                        
                        VStack{
                            Text("Welcome")
                                .font(.system(size: 35, weight: .bold))
                                .foregroundColor(.white)
                            Text("Pronto a spassartela durante la fila? Inizia ora e cerca il posto più vicino a te")
                                .font(.system(size: 20, weight: .regular))
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Nome")
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(.white)
                                    TextField("Mario", text: $clientname)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(5.0)
                                        .padding(.bottom, 20)
                                }
                                
                                Button(action: {self.viewRouter.currentPage = "app"}) {
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.title)
                                        .foregroundColor(.black)
                                }
                                
                            }
                            
                            
                            
                        }.padding(.horizontal, 50)
                        
                    }.padding(.bottom, 50)
                    
                }
            }
            
        }
    }
}


struct StartClientView_Previews: PreviewProvider {
    static var previews: some View {
        StartClientView().environmentObject(ViewRouter())
    }
}
