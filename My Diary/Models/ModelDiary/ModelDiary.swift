//
//  ModelDiary.swift
//  My Diary
//
//  Created by Dima on 05.04.2023.
//

import Foundation

// MARK: - Data model for save notes from NoteViewController to MainViewController
class ModelDiary {
    
    // Properties
    static let shared = ModelDiary()
    let defaults = UserDefaults.standard
    
    // Struct
    struct Note: Codable {
        var title: String
        var date: String
        var description: String
    }
    
    // Array + Encode, Decode data
    var noteArray: [Note] {
        get {
            if let data = defaults.value(forKey: "note") as? Data {
                do {
                    let note = try PropertyListDecoder().decode([Note].self, from: data)
                    return note
                }
                catch {
                    return [Note]()
                }
            } else {
                return [Note]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "note")
            }
        }
    }
    
    // Save
    func saveNote(title: String, date: String, description: String) {
        let note = Note(title: title, date: date, description: description)
        noteArray.insert(note, at: 0)
    }
    
    // Delete
    func deleteNote(index: Int) {
        noteArray.remove(at: index)
    }
    
    // Update
    func updateNote(index: Int, title: String, date: String, description: String) {
        var noteArray = self.noteArray
        let newNote = Note(title: title, date: date, description: description)
        noteArray[index] = newNote
        saveNoteArray(noteArray: noteArray)
    }
    
    func saveNoteArray(noteArray: [ModelDiary.Note]) {
        if let data = try? PropertyListEncoder().encode(noteArray) {
            defaults.set(data, forKey: "note")
        }
    }


}
