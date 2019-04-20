//
//  ViewController.swift
//  RealmSampleApp
//
//  Created by Satoshi Komatsu on 2019/04/15.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var books: [Book]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegateとDataSourceをセット
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //customCellを使う場合registerしてあげる
        collectionView.register(UINib(nibName: "CustomCollectionViewCell",
                                      bundle: nil),
                                forCellWithReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        books = Book.loadAll()
        collectionView.reloadData()
    }
    
    //画面遷移における値送り
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.number = sender as? Int
        }
    }
    
    //cellがタップされた時の挙動を書いている
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
    //cellの数をセット
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    //cellの中身をセット
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.label.text = String(books[indexPath.row].bookTitle)
        cell.imageView.image = books[indexPath.row].bookImage
        return cell
    }
}
