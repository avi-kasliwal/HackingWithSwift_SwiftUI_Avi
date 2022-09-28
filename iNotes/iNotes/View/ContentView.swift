//
//  ContentView.swift
//  iNotes
//
//  Created by Avi Kasliwal on 27/09/22.
//

import SwiftUI

struct Note: Identifiable {
    var id = UUID ()
    var title: String
    var body: String
    var date: Date
    var isPinned: Bool
}

struct MySection: Identifiable {
    var id = UUID ()
    let header: String
    let icon: String
}

struct ContentView: View {
    @State private var userName = "Avi"
    var sections = [MySection (header: "Pinned iNotes", icon: "pin"), MySection(header: "All iNotes", icon: "note")]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (sections) { section in
                    Section {
                        ForEach (1..<6) { _ in
                            NoteItem()
                        }
                    } header: {
                        Label(section.header, systemImage: section.icon)
                    }
                    .headerProminence(.increased)
                }
            }
            .navigationTitle("iNotes - \(userName)")
            .listStyle(.plain)
            .toolbar {
                Button ("ADD NOTE") {
                    print ("clicked")
                }
            }
        }
    }
}

struct NoteItem: View {
    var body: some View {
        VStack (spacing: 20) {
            HStack {
                Text ("Note Title")
                    .font(.headline)
                    .fontWeight(.bold)

                Spacer ()
                
                Text ("\(Date.now.formatted(date: .abbreviated, time: .omitted))")
            }
            
            HStack {
                Text (String(repeating: "Text body for note ", count: Int.random(in: 1...5)))
                
                Spacer ()
            }
        }
        .padding(.all)
        .background (Material.ultraThickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
