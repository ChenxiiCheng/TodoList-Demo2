//
//  TodoItemModel.swift
//  PraceticeTodoList
//
//  Created by chenxi cheng on 4/8/23.
//

import Foundation

struct TodoItemModel: Identifiable, Codable {
    let id: String
    let title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
