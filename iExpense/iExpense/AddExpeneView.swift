//
//  AddExpeneView.swift
//  iExpense
//
//  Created by Avi Kasliwal on 25/09/22.
//

import SwiftUI

struct AddExpeneView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    let types = ["Biz", "Food", "Travel", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField ("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach (types, id: \.self) { type in
                        Text (type)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "INR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Expense")
            .toolbar {
                Button("Save") {
                    let expense = ExpenseItem(name: name, type: type, amount: amount)
                    
                    expenses.items.append(expense)
                    
                    dismiss()
                }
            }
        }
    }
}

struct AddExpeneView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpeneView(expenses: Expenses())
    }
}
