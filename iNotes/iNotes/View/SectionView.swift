//
//  SectionView.swift
//  iNotes
//
//  Created by Avi Kasliwal on 28/09/22.
//

import Foundation
import SwiftUI

struct SectionView: View {
    @ObservedObject var iNotesVM: INotesViewModel
    var isPinnedSection: Bool = false
    
    var body: some View {
        Section {
            ForEach (iNotesVM.iNotes) { iNote in
                if isPinnedSection {
                    if iNote.isPinned {
                        INoteViewComponent (iNote: iNote)
                            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                Button(action: { iNotesVM.toggleIsPinned(for: iNote) }) {
                                    Label("Unpin Note", systemImage: "pin.slash")
                                }
                                .tint(Color(.systemIndigo))
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive, action: { iNotesVM.deleteINote(iNote) }) {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                } else {
                    if !iNote.isPinned {
                        INoteViewComponent (iNote: iNote)
                            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                Button(action: { iNotesVM.toggleIsPinned(for: iNote) }) {
                                    Label("Pin Note", systemImage: "pin.fill")
                                }
                                .tint(Color(.systemIndigo))
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive, action: { iNotesVM.deleteINote(iNote) }) {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
            }
            .onMove (perform: moveINote )
        } header: {
            if isPinnedSection {
                Label("Pinned iNotes", systemImage: "pin.fill")
            } else {
                Label("All Other iNotes", systemImage: "note")
            }
        }
        .headerProminence(.increased)
    }
    
    func moveINote (from source: IndexSet, to destination: Int) -> Void {
        iNotesVM.iNotes.move (fromOffsets: source, toOffset: destination)
    }
}
