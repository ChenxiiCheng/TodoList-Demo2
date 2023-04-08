//
//  ListViewModel.swift
//  PraceticeTodoList
//
//  Created by chenxi cheng on 4/8/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var todoList: [TodoItemModel] = [] {
        didSet {
            saveEncodedTodoList()
        }
    }
    
    let todoListKey = "this_is_todolist_key"
    
    init () {
        getTodoList()
    }
    
    private func saveEncodedTodoList() {
        if let encodedData = try? JSONEncoder().encode(self.todoList) {
            UserDefaults.standard.set(encodedData, forKey: todoListKey)
        }
    }
    
    private func getTodoList() {
        guard let encodedData = UserDefaults.standard.data(forKey: todoListKey) else { return }
        guard let decodedTodoList = try? JSONDecoder().decode([TodoItemModel].self, from: encodedData) else { return }
        self.todoList.append(contentsOf: decodedTodoList)
    }
    
    func updateCompletion(item: TodoItemModel) {
        if let index = self.todoList.firstIndex(where: { $0.id == item.id }) {
            self.todoList[index].isCompleted.toggle()
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        self.todoList.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        self.todoList.move(fromOffsets: from, toOffset: to)
    }
    
    func onSave(title: String) {
        let newTodoItem = TodoItemModel(title: title)
        self.todoList.append(newTodoItem)
    }
}
