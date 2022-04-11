//
//  SQLiteHelper.swift
//  GroceryList
//
//  Created by ADITI SAIN on 2022-04-10.
//

import Foundation
import SQLite3

class SQLiteHelper {
    
    private var db: OpaquePointer?
    private var stat: OpaquePointer?
    
    private let DATABASE_NAME = "list.db";
    private let DATABASE_VERSION = 1;
    private let TABLE = "listtable"
    private let ID = "id"
    private let LIST_NAME = "listname"
    private let ITEM_NAME = "itemname"
    private let QUANTITY = "quantity"
    private let COST = "cost"
    private let BOUGHT = "bought";


    func connect() -> Bool {
        // Create connection to database
        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(DATABASE_NAME)
            
        sqlite3_open(fileUrl.path, &db)
            
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
            print("Error Opening Database")
            return false
        }
        print("Connection created succefully")
        return true
    }

    func createTable() -> Bool{

        let createTaleQuerry = "CREATE TABLE IF NOT EXISTS " + TABLE + "( " + ID + " INTEGER," + LIST_NAME + " TEXT," + ITEM_NAME + " TEXT, " + QUANTITY + " INTEGER, " + COST + " REAL, " + BOUGHT + " INTEGER, PRIMARY KEY(id AUTOINCREMENT))"
        
        if sqlite3_exec(db, createTaleQuerry, nil, nil, nil) != SQLITE_OK{
            print("Error creating table")
            return false
        }
        print("Table created")
        return true
    }
    
    func insertData(list:ListModel) -> Bool{
      
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        let insertQuerry = "INSERT INTO " + TABLE + " (" + LIST_NAME + "," + ITEM_NAME + "," + QUANTITY + "," + COST + "," + BOUGHT + ") VALUES (?,?,?,?,?)"
        
        if sqlite3_prepare(db, insertQuerry,-1,&stat, nil) != SQLITE_OK{
            print("Error creating querry")
            sqlite3_reset(stat)
            return false
        }
        
        if sqlite3_bind_text(stat, 1, list.listname ,-1, SQLITE_TRANSIENT) != SQLITE_OK{
            sqlite3_reset(stat)
            return false
        }
        
        if sqlite3_bind_text(stat, 2, list.itemname ,-1, SQLITE_TRANSIENT) != SQLITE_OK{
            sqlite3_reset(stat)
            return false
        }
     
        if sqlite3_bind_int(stat, 3, Int32(list.quantity)) != SQLITE_OK{
            sqlite3_reset(stat)
            return false
        }
        
        
        if sqlite3_bind_double(stat, 4, list.cost) != SQLITE_OK{
            sqlite3_reset(stat)
            return false
        }
        
        if sqlite3_bind_int(stat, 5, Int32(list.bought)) != SQLITE_OK{
            sqlite3_reset(stat)
            return false
        }
        
        if sqlite3_step(stat) != SQLITE_DONE{
            sqlite3_reset(stat)
            return false
        }
        
        print("Inserted Succefully")
        sqlite3_reset(stat)
        return true
   }
    
}
