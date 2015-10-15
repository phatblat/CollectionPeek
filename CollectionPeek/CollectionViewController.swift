//
//  CollectionViewController.swift
//  CollectionPeek
//
//  Created by Ben Chatelain on 10/14/15.
//  Copyright © 2015 Ben Chatelain. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        }
    }

}

// MARK: - UICollectionViewDataSource

extension CollectionViewController {

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SquareCell", forIndexPath: indexPath)

        // Rounded corners
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10

        return cell
    }

}

