//
//  ContentView.swift
//  iExpense
//
//  Created by Avi Kasliwal on 25/09/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses ()
    
    @State private var isAddExpenseShown = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.id) { item in
                    Text (item.name)
                }
                .onDelete(perform: removeExpense)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    isAddExpenseShown = true
                } label : {
                    Text ("Add Expense")
                }
            }
            .sheet(isPresented: $isAddExpenseShown) {
                AddExpeneView(expenses: expenses)
            }
        }
    }
    
    func removeExpense (at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
