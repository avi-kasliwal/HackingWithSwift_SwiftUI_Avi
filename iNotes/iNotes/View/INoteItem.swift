//
//  INote.swift
//  iNotes
//
//  Created by Avi Kasliwal on 27/09/22.
//

import SwiftUI

struct INote: View {
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
