//
//  MotherView.swift
//  FifoClient
//
//  Created by Vincenzo Guida on 22/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//

import SwiftUI

struct MotherView : View {
     @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
          VStack {
                      if viewRouter.currentPage == "login" {
                          StartClientView()
                      } else if viewRouter.currentPage == "app" {
                          ClientTabBarView()
                        .transition(.scale)
                      }
                  }
          }
}

struct MotherView_Previews : PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
