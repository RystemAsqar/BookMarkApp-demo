//
//  ConnectWithFirebase.swift
//  demo
//
//  Created by Rystem Asqar on 8/16/23.
//

import Foundation
import Firebase
import FirebaseDatabase

class ConnectWithFirebase {
    
    
    var ref = Database.database().reference()
    
    func fetchDataAndSaveToDictionary() {
        ref.child("BookMarkLinks").observeSingleEvent(of: .value) { (snapshot) in
            if let data = snapshot.value as? [String: String] {
                // Save the data to the dictionary
                Data.dataDictionary = data
                print("Data saved to dictionary:", Data.dataDictionary)
            } else {
                print("No data found.")
            }
        }
    }
    
}
