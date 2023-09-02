//
//  Constants.swift
//  demo
//
//  Created by Rystem Asqar on 7/23/23.
//

import Foundation

struct Data {
    static var arr:[String] = ["Google", "Amazon", "Kaspi.kz", "Mango.DB", "Glober"]
    static var dataDictionary: [String: String] = [:]
    static var strArr:[String] = Array(dataDictionary.keys)
    static var linkArr:[String] = Array(dataDictionary.values)
    static var sizeOfDictionary = dataDictionary.count
    static var link = ""
}

struct Item {
    var name: String
    func toDictionary() -> [String: Any] {
        return ["name": name]
    }
}

var dataArray = [Item]()
