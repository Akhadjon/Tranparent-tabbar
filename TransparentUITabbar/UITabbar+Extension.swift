//
//  UITabbar+Extension.swift
//  TransparentUITabbar
//
//  Created by Akhadjon Abdukhalilov on 7/19/20.
//  Copyright © 2020 Akhadjon Abdukhalilov. All rights reserved.
//

import UIKit
extension UITabBar {

static func setTransparentTabbar() {
  UITabBar.appearance().backgroundImage = UIImage()
  UITabBar.appearance().shadowImage     = UIImage()
  UITabBar.appearance().clipsToBounds   = true
 }
}
