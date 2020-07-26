//
//  SecondViewController.swift
//  TransparentUITabbar
//
//  Created by Akhadjon Abdukhalilov on 7/19/20.
//  Copyright © 2020 Akhadjon Abdukhalilov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView()
        imageView.frame = view.bounds
        imageView.image = UIImage(named: "quin.jpeg")
        view.addSubview(imageView)
      }
    

   

}
