//
//  UICollectionView.swift
//  Kenlo Vistoria
//
//  Created by Priya Gandhi on 2024-01-22.
//

import UIKit

extension UICollectionView {
    // Regiser Collection view
    func register<T: UICollectionViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.register(UINib(nibName: String(describing: T.self), bundle: Bundle.main), forCellWithReuseIdentifier: String(describing: T.self))
        let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
        return cell
    }
    
    func reloadDataAsync() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    // find lable width
    func lableWidth(value:String,font:UIFont) -> CGFloat
    {
        let label = UILabel(frame: CGRect.zero)
        label.font = font
        label.text = value
        label.sizeToFit()
        return label.frame.width
    }

        func setupCollectionView(itemSize: CGSize) {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: 50, height: 50);
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 5
            self.collectionViewLayout = layout
    }
}



