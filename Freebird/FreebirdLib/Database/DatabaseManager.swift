//
//  Untitled.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/9/25.
//

import SQLite3

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let dbURL : URL
    private var db : OpaquePointer?
    
    private init(){
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if sqlite3_open(dbURL.path, &db) == SQLITE_OK {
            print("Database opened or created at \(dbURL.path)")
            createTables()
        }else{
            print("Failed to open database")
        }
    }
    
    private func createTables() {
        let createTableSQL = """
            CREATE TABLE IF NOT EXISTS teMeetUpCategory (
                MeetUpCategoryID INTEGER PRIMARY KEY AUTOINCREMENT,
                Name TEXT NOT NULL,
                DttmCreatedUTC TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
                DttmModifiedUTC TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
                CreatedBy TEXT NOT NULL DEFAULT '',
                ModifiedBy TEXT NOT NULL DEFAULT ''
            );

            CREATE TABLE IF NOT EXISTS tbMeetUps (
                MeetUpID INTEGER PRIMARY KEY AUTOINCREMENT,
                Name TEXT NOT NULL DEFAULT '',
                Latitude REAL NOT NULL DEFAULT 0.0,
                Longitude REAL NOT NULL DEFAULT 0.0,
                Country TEXT NOT NULL DEFAULT '',
                STATE TEXT NOT NULL DEFAULT '', -- blank if not in use
                ZipCode INTEGER NOT NULL DEFAULT 0,
                Address TEXT NOT NULL DEFAULT '',
                EventCategory INTEGER NOT NULL DEFAULT 0,
                DttmStartUTC TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
                DttmEndUTC TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
                CreatedBy TEXT NOT NULL DEFAULT '',
                ModifiedBy TEXT NOT NULL DEFAULT ''
            );

            CREATE TABLE IF NOT EXISTS tbUsers (
                UserID INTEGER PRIMARY KEY AUTOINCREMENT,
                FirstName TEXT NOT NULL DEFAULT '',
                LastName TEXT NOT NULL DEFAULT '',
                CellPhone TEXT NOT NULL DEFAULT '',
                Email TEXT NOT NULL DEFAULT '',
                DttmStartUTC TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
                DttmEndUTC TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
                CreatedBy TEXT NOT NULL DEFAULT '',
                ModifiedBy TEXT NOT NULL DEFAULT ''
            );
            """
        // Then you execute this SQL as before
    }
}
