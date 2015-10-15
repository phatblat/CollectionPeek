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
    private var selectedIndexPath: NSIndexPath?

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

        registerForPreviewingWithDelegate(self, sourceView: collectionView!)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let indexPath = collectionView?.indexPathsForSelectedItems()?.first {
        if let indexPath = selectedIndexPath {
            debugPrint(selectedIndexPath)
            debugPrint(colors[indexPath.row])
            segue.destinationViewController.view.backgroundColor = colors[indexPath.row]
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

// MARK: - UICollectionViewDelegate

extension CollectionViewController {

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // Save the selection for use in prepareForSegue
        selectedIndexPath = indexPath
        debugPrint(selectedIndexPath)
    }

}

// MARK: - UIViewControllerPreviewingDelegate

extension CollectionViewController: UIViewControllerPreviewingDelegate {

    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        return nil
    }

    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        presentViewController(viewControllerToCommit, animated: true, completion: nil)
    }

}

