//
//  CollectionViewController.swift
//  CollectionPeek
//
//  Created by Ben Chatelain on 10/14/15.
//  Copyright © 2015 Ben Chatelain. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {



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


        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10

        return cell
    }

}

