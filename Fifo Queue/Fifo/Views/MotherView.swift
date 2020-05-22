//
//  MotherView.swift
//  Fifo
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
                          StartView()
                      } else if viewRouter.currentPage == "app" {
                          TabBarView()
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
