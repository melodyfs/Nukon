//
//  JapaneseCharactersCollectionViewController.swift
//  Nukon
//
//  Created by Kaichi Momose on 2018/02/06.
//  Copyright © 2018 Kaichi Momose. All rights reserved.
//

import UIKit

class JapaneseCharactersCollectionViewController: UIViewController {

    let japanese = JapaneseCharacters().hiraganaList
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var parentsStackView: UIStackView!
    @IBOutlet weak var childrenStackView: UIStackView!
    @IBOutlet weak var sixthChidStackView: UIStackView!
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var ilabel: UILabel!
    @IBOutlet weak var ulabel: UILabel!
    @IBOutlet weak var elabel: UILabel!
    @IBOutlet weak var olabel: UILabel!
    @IBOutlet weak var nLabel: UILabel!
    
    
    
    
    
    let layout = UICollectionViewFlowLayout()
    let inset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SoundsCell", bundle: .main), forCellWithReuseIdentifier: "SoundsCell")
        collectionView.register(UINib.init(nibName: "FirstCharacterCell", bundle: .main), forCellWithReuseIdentifier: "FirstCharacterCell")

        // Do any additional setup after loading the view.
        layout.scrollDirection = .horizontal
        self.collectionView.isScrollEnabled = false
        layout.sectionInset = inset
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - (inset.left+inset.right), height: UIScreen.main.bounds.width - (inset.left+inset.right))
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - (inset.left+inset.right), height: UIScreen.main.bounds.width - (inset.left+inset.right))
        
        collectionView.collectionViewLayout = layout
        collectionView.alwaysBounceHorizontal = true
        
        exitButton.isHidden = true
        childrenStackView.isHidden = true
        childrenStackView.arrangedSubviews[5].isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitTapped(_ sender: Any) {
        exitButton.isHidden = true
        childrenStackView.isHidden = true
        collectionView.isScrollEnabled = true
    }
    
    
}

extension JapaneseCharactersCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return japanese.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let firstCharacterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCharacterCell", for: indexPath) as! FirstCharacterCell
        
        let row = indexPath.row
        
        firstCharacterCell.backgroundColor = .lightGray
        firstCharacterCell.layer.cornerRadius = 5
        
        firstCharacterCell.characterLabel.text = japanese[row].sound
        
        return firstCharacterCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let row = indexPath.row
        
//        for letter in japanese[row].letters
//            if lett
        exitButton.isHidden = false
        childrenStackView.isHidden = false
        collectionView.isScrollEnabled = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if (context.nextFocusedIndexPath != nil) && !collectionView.isScrollEnabled {
            collectionView.scrollToItem(at: context.nextFocusedIndexPath!, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
    }
//        if (context.nextFocusedIndexPath && !collectionView.scrollEnabled) {
//
//            [collectionView scrollToItemAtIndexPath:context.nextFocusedIndexPath
//                atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
//                animated:YES];
//        }
    }
}

