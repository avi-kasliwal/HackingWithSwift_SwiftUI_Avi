//
//  Expenses.swift
//  iExpense
//
//  Created by Avi Kasliwal on 25/09/22.
//

import Foundation

class Expenses : ObservableObject {
    @Published var items = [ExpenseItem] () {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init () {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // .self => tell swift that i am reffering to that array type itself
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
            }
        }
        
        items = []
    }
}
