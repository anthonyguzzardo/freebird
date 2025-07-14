////
////  Untitled.swift
////  Freebird
////
////  Created by Anthony Guzzardo on 7/9/25.
////
//
//import SQLite3
//
//public class DatabaseManager {
//    static let shared = DatabaseManager()
//    
//    private let dbURL : URL
//    private var db : OpaquePointer?
//    
//    private init(){
//        let fileManager = FileManager.default
//        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
//        if sqlite3_open(dbURL.path, &db) == SQLITE_OK {
//            print("Database opened or created at \(dbURL.path)")
//            createTables()
//        }else{
//            print("Failed to open database")
//        }
//    }
//    
//    private func createTables() {
//        let createTableSQL = """
//            CREATE TABLE IF NOT EXISTS tdMeetCategory (
//                MeetCategoryID INTEGER PRIMARY KEY AUTOINCREMENT,
//                Name TEXT NOT NULL,
//                CreatedBy TEXT NOT NULL DEFAULT '',
//                ModifiedBy TEXT NOT NULL DEFAULT ''
//            );
//
//            CREATE TABLE IF NOT EXISTS tbMeets (
//                MeetID INTEGER PRIMARY KEY AUTOINCREMENT,
//                Name TEXT NOT NULL DEFAULT '',
//                Latitude REAL NOT NULL DEFAULT 0.0,
//                Longitude REAL NOT NULL DEFAULT 0.0,
//                Country TEXT NOT NULL DEFAULT '',
//                State TEXT NOT NULL DEFAULT '', -- blank if not in applicable
//                ZipCode INTEGER NOT NULL DEFAULT 0,
//                Address TEXT NOT NULL DEFAULT '',
//                MeetUpCategory INTEGER NOT NULL DEFAULT 0,
//                DttmStartUTC TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
//                DttmEndUTC TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
//                CreatedBy TEXT NOT NULL DEFAULT '',
//                ModifiedBy TEXT NOT NULL DEFAULT ''
//            );
//
//            CREATE TABLE IF NOT EXISTS tbUsers (
//                UserID INTEGER PRIMARY KEY AUTOINCREMENT,
//                FirstName TEXT NOT NULL DEFAULT '',
//                LastName TEXT NOT NULL DEFAULT '',
//                CellPhone TEXT NOT NULL DEFAULT '',
//                Email TEXT NOT NULL DEFAULT '',
//                DttmCreatedUTC TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
//                DttmModifiedUTC TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
//                CreatedBy TEXT NOT NULL DEFAULT '',
//                ModifiedBy TEXT NOT NULL DEFAULT ''
//                UUID TEXT NOT NULL DEFAULT ''
//            );
//            """
//        var statement : OpaquePointer?
//        if sqlite3_prepare_v2(db, createTableSQL, -1, &statement, nil)==SQLITE_OK{
//            if sqlite3_step(statement) != SQLITE_DONE{
//                print("Table created or already exists.")
//            } else{
//                print("Could not create table")
//            }
//        } else {
//            print("Create table statement could not be prepared")
//        }
//        sqlite3_finalize(statement)
//    }
//    
//    //MARK: Insert
//    public func insertMeetUpCategory(name: String) -> (Int64?, Error?) {
//        let insertSQL = """
//        INSERT INTO tdMeetCategory
//        (
//            Name
//        ) VALUES
//        (
//            ?
//        );
//        """
//    }
//
//    // SQLITE_OK, SQLITE_ROW, and SQLITE_DONE
//    
//    public func tryInsertMeetUp(Name: String, Latitude: Double, Longitude: Double, Country: String, State: String, ZipCode: Int, Address: String, MeetUpCategory: Int, DttmStartUTC: String, DttmEndUTC: String) -> Int64 {
//
//    }
//    
//    public func tryInsertUser(Name: String, Email: String, Password: String) -> Int64 {
//        
//    }
//    //MARK: View
//    //MARK: Delete
//    //MARK: Modify
//    
//}
