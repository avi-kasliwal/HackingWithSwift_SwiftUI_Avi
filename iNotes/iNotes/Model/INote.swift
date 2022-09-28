//
//  INote.swift
//  iNotes
//
//  Created by Avi Kasliwal on 28/09/22.
//

import Foundation

struct INote: Identifiable, Hashable, Codable {
    var id = UUID ()
    var title: String
    var content: String
    var date: Date
    var isPinned: Bool = false
}
