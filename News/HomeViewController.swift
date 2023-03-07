//
//  HomeViewController.swift
//  News
//
//  Created by joe on 21/02/23.
//

import UIKit
import FirebaseAuth
// import GoogleSignIn

enum ProviderType : String {
    case basic
    case google
}

class HomeViewController: UIViewController {

    @IBOutlet weak var emailText: UILabel!
    
    @IBOutlet weak var providerText: UILabel!
    
    @IBOutlet weak var closesessionButton: UIButton!
    
    private let email: String
    
    private let provider: ProviderType
    
    init(email: String, provider: ProviderType){
        self.email = email
        self.provider = provider
        
        super.init(nibName: nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = nil
        self.navigationController?.isNavigationBarHidden = true
        navigationItem.setHidesBackButton(true, animated: false)
        
        emailText.text = self.email
        providerText.text =  self.provider.rawValue
        
        let defaults = UserDefaults.standard
        defaults.set(email, forKey: "email")
        defaults.set(provider.rawValue, forKey: "provider")
        defaults.synchronize()
        
    }
    
    @IBAction func closesessionAction(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "provider")
        defaults.synchronize()
        
        switch provider {
            case .basic:
                firebaseLogOut()
            case .google:
                // GIDSignIn.sharedInstance().signOut()
                firebaseLogOut()
            }
    }
    
    private func firebaseLogOut(){
        
        do{
            try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
        }
        catch{
            let alertController =  UIAlertController(title: "Error", message: "Ocurrio un error al salir de session", preferredStyle: .alert)
            
            alertController.addAction(
                UIAlertAction(title:"Aceptar", style: .default)
            )
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
}
