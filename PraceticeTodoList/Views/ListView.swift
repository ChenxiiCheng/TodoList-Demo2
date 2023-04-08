//
//  ListView.swift
//  PraceticeTodoList
//
//  Created by chenxi cheng on 4/8/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    private func onTap(item: TodoItemModel) {
        listViewModel.updateCompletion(item: item)
    }
    
    private func onDelete(indexSet: IndexSet) {
        listViewModel.deleteItem(indexSet: indexSet)
    }
    
    private func onMove(from: IndexSet, to: Int) {
        listViewModel.moveItem(from: from, to: to)
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(listViewModel.todoList) { item in
                    todoItem(item: item)
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)
            }
            .listStyle(.plain)
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

extension ListView {
    private func todoItem(item: TodoItemModel) -> some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
                .strikethrough(item.isCompleted ? true : false)
            Spacer()
        }
        // 使用contentShape来设置整个视图的响应区域
        // 将contentShape设置为一个Rectangle来覆盖整个行
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeInOut) {
                onTap(item: item)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
