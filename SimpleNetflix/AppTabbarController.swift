//
//  AppTabbarController.swift
//  SimpleNetflix
//
//  Created by 이민지 on 2022/02/07.
//

import UIKit

class AppTabbarController: UITabBarController {

    //화면 회전
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
