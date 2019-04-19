//
//  DetailViewController.swift
//  RealmSampleApp
//
//  Created by Satoshi Komatsu on 2019/04/15.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    
    var number: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpDetail()
    }
}

extension DetailViewController {
    
    func setUpDetail() {
        //ここで諸々をセットする
    }
}
