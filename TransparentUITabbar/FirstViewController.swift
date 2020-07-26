//
//  FirstViewController.swift
//  TransparentUITabbar
//
//  Created by Akhadjon Abdukhalilov on 7/19/20.
//  Copyright © 2020 Akhadjon Abdukhalilov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  
    
    private var collectionView :UICollectionView?
    private var data = [VideoModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        for _ in 0..<10{
                  let model = VideoModel(caption: "This is a cool car", uzerName: "Akhadjon", audioTrackName: "my new song", videoFileName: "video", videoFileFormate: "mp4")
                  data.append(model)
              }
              
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        view.addSubview(collectionView!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }


}

extension FirstViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    
    
}
