//
//  SplashViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

final class SplashViewController: UIViewController {
    private lazy var splashView = SplashView()
    
    override func loadView() {
        super.loadView()
        view = splashView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        self.changeMainView()
    }
    
//    func changeMainView() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            Application.shared.configurationMainInterface(window: keyWindow)
//        }
//    }
}
