//
//  ViewRouter.swift
//  Fifo
//
//  Created by Vincenzo Guida on 22/05/2020.
//  Copyright © 2020 GueTeam. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "login" {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
}
