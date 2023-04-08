//
//  AddView.swift
//  PraceticeTodoList
//
//  Created by chenxi cheng on 4/8/23.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var textField: String = ""
    
    let btnColor = Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))
    
    var body: some View {
        VStack(spacing: 15) {
            TextField("Type something here...", text: $textField)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 12)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Button {
                listViewModel.onSave(title: textField)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("save".uppercased())
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(btnColor)
                    .cornerRadius(10)
                    .shadow(color: Color.purple, radius: 2, y: 1)
            }

            
            Spacer()
        }
        .padding()
        .navigationTitle("Add an item 🖋")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
