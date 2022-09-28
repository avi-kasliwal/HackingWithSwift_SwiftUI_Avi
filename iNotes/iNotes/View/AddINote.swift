//
//  AddINote.swift
//  iNotes
//
//  Created by Avi Kasliwal on 28/09/22.
//

import SwiftUI

struct AddINote: View {
    @ObservedObject var iNotesVM: INotesViewModel
    
    @State private var title = ""
    @State private var content = ""
    @State private var isPinned = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("iNote Title", text: $title)
                } header: {
                    Label("Title", systemImage: "highlighter")
                        .labelStyle(.titleAndIcon)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                
                Section {
                    TextField("iNote Text", text: $content)
                } header: {
                    Label("Content", systemImage: "pencil.and.outline")
                        .labelStyle(.titleAndIcon)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                
                Section {
                    Toggle("Pin iNote", isOn: $isPinned)
                } header: {
                    Label("Pin", systemImage: "pin")
                        .labelStyle(.titleAndIcon)
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
            .navigationTitle("Add New iNote")
            .toolbar {
                Button {
                    if title != "", content != "" {
                        iNotesVM.addINote(INote(title: title, content: content, date: Date.now, isPinned: isPinned))
                        
                        dismiss ()
                    } else {
                        print ("Some important field is missing")
                    }
                } label: {
                    Label("Save", systemImage: "tray.and.arrow.down.fill")
                }

            }
        }
    }
}

struct AddINote_Previews: PreviewProvider {
    static var previews: some View {
        AddINote(iNotesVM: INotesViewModel())
            .preferredColorScheme(.dark)
    }
}
