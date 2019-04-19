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
    
    @objc dynamic var bookTitle: String = ""
    @objc dynamic var authorName: String = ""
    @objc dynamic var publisher: String = ""
    @objc dynamic var bookImage: Data = Data()
    
}
