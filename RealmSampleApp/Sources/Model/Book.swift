//
//  Book.swift
//  RealmSampleApp
//
//  Created by Satoshi Komatsu on 2019/04/18.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import RealmSwift

final class Book: Object {
    static let realm = try! Realm()
    
    @objc dynamic var id = 0
    @objc dynamic var bookTitle: String = ""
    @objc dynamic var authorName: String = ""
    @objc dynamic var publisher: String = ""
    @objc dynamic private var _bookImage: UIImage? = nil
    @objc dynamic var bookImage: UIImage? {
        set {
            self._bookImage = newValue
            if let value = newValue {
                self.bookImageData = value.jpegData(compressionQuality: 1)
            }
        }
        get {
            if let image = self._bookImage {
                return image
            }
            
            if let data = self.bookImageData {
                self._bookImage = UIImage(data: data)
                return self._bookImage
            }
            
            return nil
        }
    }
    @objc dynamic private var bookImageData: Data? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //これを指定することによってRealmで定義できない型でも指定できるようにしている
    override static func ignoredProperties() -> [String] {
        return ["_bookImage", "bookImage"]
    }
    
    static func lasdId() -> Int {
        if let book = realm.objects(Book.self).last {
            return book.id + 1
        } else {
            return 0
        }
    }
    
    static func creat() -> Book {
        let book = Book()
        book.id = lasdId()
        return book
    }
    
    func save() {
        try! Book.realm.write {
            Book.realm.add(self)
        }
    }
    
    static func loadAll() -> [Book] {
        let books = realm.objects(Book.self).sorted(byKeyPath: "id", ascending: true)
        var array: [Book] = []
        for book in books {
            array.append(book)
        }
        
        return array
    }
}
