//
//  INoteViewComponent.swift
//  iNotes
//
//  Created by Avi Kasliwal on 28/09/22.
//

import SwiftUI

struct INoteViewComponent: View {
    var iNote: INote
    
    var body: some View {
        VStack (spacing: 20) {
            HStack {
                Text (iNote.title)
                
                Spacer ()
                
                Text (iNote.date.formatted(date: .abbreviated, time: .omitted))
            }
            
            HStack {
                Text (iNote.content)
                
                Spacer ()
            }
        }
        .padding (.all)
        .background (Material.ultraThin)
        .clipShape (RoundedRectangle (cornerRadius: 25))
    }
}

struct INoteViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        INoteViewComponent(iNote: INote(title: "Title", content: "Some Text", date: Date.now))
            .preferredColorScheme(.dark)
    }
}
