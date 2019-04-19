//
//  DetailViewController.swift
//  RealmSampleApp
//
//  Created by Satoshi Komatsu on 2019/04/15.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RealmSwift

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    
    let realm = try! Realm()
    var bookArray: Results<Book>!
    var number: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        bookArray = realm.objects(Book.self)
        setUpDetail()
    }
}

extension DetailViewController {
    
    func setUpDetail() {
        bookImage.image = UIImage(data: bookArray[number].bookImage)
        titleLabel.text = bookArray[number].bookTitle
        authorLabel.text = bookArray[number].authorName
        publisherLabel.text = bookArray[number].publisher
    }
}
