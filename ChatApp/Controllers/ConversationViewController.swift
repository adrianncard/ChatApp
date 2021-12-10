//
//  ViewController.swift
//  ChatApp
//
//  Created by Adrian Cardenas on 2021-11-24.
//

import UIKit
import FirebaseAuth

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .link
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        validateAuth()
    }

    private func validateAuth(){
        
        if FirebaseAuth.Auth.auth().currentUser == nil{
        
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)}
    }
    
    
}

