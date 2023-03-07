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
import Alamofire

// GIDSignInDelegate

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
        
        title = nil
        
        // Analytics Event
        Analytics.logEvent("InitScreen", parameters:[ "message":"Integracion FB" ])
        
        
        // GIDSignIn.sharedInstance().clientID = "172041609902-na2b3unnjn2ku6iostg5049pmbabd1cp.apps.googleusercontent.com"
        // GIDSignIn.sharedInstance().delegate = self
        
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
        // GIDSignIn.sharedInstance().signIn()
       
        let parameters: [String: Any] = [
            "tokenId": "eyJhbGciOiJSUzI1NiIA",
            "deviceToken": ""
        ]
        
        AF.request("http://104.196.199.198/api/Auth/LoginJwt",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let json):
                    // La petición fue exitosa y el servidor respondió con un JSON
                    print("JSON response: \(json)")
                case .failure(let error):
                    // La petición falló
                    print("Error: \(error.localizedDescription)")
                }
            }
        
        /*
        struct LoginPayload: Encodable {
            let tokenId: String
            let deviceToken: String
        }
        
        struct LoginResponse: Decodable {
            let fullname: String
            let email: String
            let picture: String
            let token: String
                
            enum CodingKeys: String, CodingKey {
                case fullname
                case email
                case picture
                case token
            }
        }
        
        let payload = LoginPayload(tokenId: "tokenId", deviceToken: "123456")
        
        AF.request("http://104.196.199.198/api/Auth/LoginJwt",
                   method: .post,
                   parameters: payload,
                   encoder: JSONParameterEncoder.default)
        .responseDecodable(of: LoginResponse.self) { response in
            guard let data = response.value else { return }
            print("JSON response: \(data)")
        }
         */
    }
    
    /*
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            // Signed in successfully
            // let tokenId = user.authentication.idToken
            if let tokenId = user.authentication.idToken {
                struct Login: Encodable {
                    let tokenId: String
                    let deviceToken: String
                }
                
                let payload = Login(tokenId: tokenId, deviceToken: "123456")
                
                AF.request("http://104.196.199.198/api/Auth/LoginJwt",
                           method: .post,
                           parameters: payload,
                           encoder: JSONParameterEncoder.default).response {
                    response in debugPrint(response)
                }
                
              print(tokenId)
            } else {
              print("Token ID is nil")
            }
            
        } else {
            // Error signing in
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // User disconnected
    }
     */
    
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
