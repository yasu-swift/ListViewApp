//
//  TaskFiles.swift
//  ListViewApp
//
//  Created by 高橋康之 on 2020/09/06.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

struct Task: Identifiable {
    var id = String()
    var taskItem = String()
    
}

class TaskList: ObservableObject {
    
      @Published var tasks = [Task]()
}


class namesList: ObservableObject {
    
    @Published var names:[String] = ["米沢", "川田", "磯辺", "渋谷", "加藤",]
    
}
