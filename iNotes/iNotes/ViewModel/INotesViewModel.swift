//
//  INotesViewModel.swift
//  iNotes
//
//  Created by Avi Kasliwal on 28/09/22.
//

import Foundation
import SwiftUI

class INotesViewModel: ObservableObject {
    @Published var iNotes = [INote] ()
    
    func toggleIsPinned (for inote: INote) {
        if let idx = iNotes.firstIndex(of: inote) {
            iNotes [idx].isPinned.toggle ()
        }
    }
    
    func deleteINote (_ inote: INote) {
        if let idx = iNotes.firstIndex(of: inote) {
            iNotes.remove (at: idx)
        }
    }
    
    func addINote (_ inote: INote) {
        iNotes.insert(inote, at: 0)
    }
}
