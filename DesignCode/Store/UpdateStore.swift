//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Rob Fazio on 10/21/19.
//  Copyright © 2019 Rob Fazio. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    
    @Published var updates: [Update]
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}
