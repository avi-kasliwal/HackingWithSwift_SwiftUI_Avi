//
//  ContentView.swift
//  iNotes
//
//  Created by Avi Kasliwal on 28/09/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var iNotesVM = INotesViewModel ()
    @State private var isAddSheetShown = false
    
    var body: some View {
        NavigationStack {
            List {
                // Section 1
                SectionView(iNotesVM: iNotesVM, isPinnedSection: true)
                
                
                // Section 2
                SectionView(iNotesVM: iNotesVM, isPinnedSection: false)
            }
            .listStyle(.plain)
            .navigationTitle("📕 iNotes - Avi")
            .toolbar {
                EditButton ()
                
                Button {
                    isAddSheetShown.toggle ()
                } label: {
                    Label("Add Note", systemImage: "note.text.badge.plus")
                }
            }
            .sheet(isPresented: $isAddSheetShown) {
                AddINote(iNotesVM: iNotesVM)
            }
        }
    }
    
    func moveINote (from source: IndexSet, to destination: Int) -> Void {
        iNotesVM.iNotes.move (fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
