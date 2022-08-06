//
//  ExpenseItem.swift
//  iExpennse
//
//  Created by Swapnil on 21/06/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id =  UUID()
    let name: String
    let type: String
    let amount: Double
}
