//
//  AuthViewController.swift
//  News
//
//  Created by joe on 13/02/23.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
// import GoogleSignIn

class AuthViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var authstackView: UIStackView!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        authstackView.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Autenticacion"
        
        // Analytics Event
        Analytics.logEvent("InitScreen", parameters:[ "message":"Integracion FB" ])
        
        
        // COMPROBACION DE INICIO DE SESION
        let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String,
            let provider = defaults.value(forKey: "provider") as? String {
            
            authstackView.isHidden = true
            
            self.navigationController?.pushViewController(
                HomeViewController(
                    email: email,
                    provider: ProviderType.init(rawValue: provider)!
                ),
                animated: true
            )
            
        }
    }
    
    @IBAction func registerAction(_ sender: Any) {
        print("registerAction")
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password){
                (result, error) in

                self.showHome(result: result, error: error, provider: .basic)

            }
            
        }
    }
    

    @IBAction func signinButton(_ sender: Any) {
        print("signinButton")
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password){
                (result, error) in
                
                self.showHome(result: result, error: error, provider: .basic)

            }
            
        }
        
    }
    
    
    @IBAction func googleButton(_ sender: Any) {
        print("Google")
    }
    
    @IBAction func skitNow(_ sender: Any) {
        // TODO: hacer algo antes de navegar al siguiente view controller
        // navegar
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let viewController = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController_Id");
        // self.present(viewController, animated: true);
        navigationController?.pushViewController(viewController, animated: true);
    }
    
    
    private func showHome(result: AuthDataResult?, error: Error?, provider: ProviderType){
        if let result = result, error == nil {
            self.navigationController?.pushViewController(
                HomeViewController(
                    email: result.user.email!,
                    provider: provider
                ),
                animated: true
            )
        }
        else{
            
            let alertController =  UIAlertController(title: "Error", message: "Se ha producido un error de autenticacion mediante el proveedor", preferredStyle: .alert)
            
            alertController.addAction(
                UIAlertAction(title:"Aceptar", style: .default)
            )
            
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
}
