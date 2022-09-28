//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Avi Kasliwal on 25/09/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID ()
    let name: String
    let type: String
    let amount: Double
}
