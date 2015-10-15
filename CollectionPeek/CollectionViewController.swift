//
//  CollectionViewController.swift
//  CollectionPeek
//
//  Created by Ben Chatelain on 10/14/15.
//  Copyright © 2015 Ben Chatelain. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    private let cellCount = 15
    private var colors: [UIColor] = []

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        for _ in 0...cellCount {
            colors.append(randomColor())
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        }
    }

    private func randomColor() -> UIColor {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }

}

// MARK: - UICollectionViewDataSource

extension CollectionViewController {

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SquareCell", forIndexPath: indexPath)

        // Set background color
        cell.contentView.backgroundColor = colors[indexPath.row]

        // Rounded corners
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10

        return cell
    }

}

