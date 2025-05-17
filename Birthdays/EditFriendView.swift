//
//  EditFriendView.swift
//  Birthdays
//
//  Created by Scholar on 5/17/25.
//

import SwiftUI

struct EditFriendView: View {
    var friend: Friend
    @State private var newName: String
    @State private var newBirthday: Date
    @Environment(\.dismiss) private var dismiss
    
    init(friend: Friend) {
        self.friend = friend
        _newName = .init(initialValue: friend.name)
        _newBirthday = .init(initialValue: friend.birthday)
        }
    
    var body: some View {
        Form {
            TextField("Name", text: $newName)
            DatePicker("Birthday", selection: $newBirthday, displayedComponents: .date)
        }
        .navigationTitle("Edit \(friend.name)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    friend.name = newName
                    friend.birthday = newBirthday
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    EditFriendView(friend: Friend(name: "Test", birthday: Date.now))
}
