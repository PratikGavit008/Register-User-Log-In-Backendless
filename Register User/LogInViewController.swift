//
//  LogImViewController.swift
//  Register User
//
//  Created by Pratik Gavit on 11/02/23.
//

import UIKit

class LogInViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContactUsInTextView()
    }
    

    @IBAction func logInTapped(_ sender: Any) {
        guard let email = txtEmail.text else { return }
        guard let pass = txtPassword.text else { return }
        let user = LogInModel(login: email, password: pass)
        ApiManager.shared.logInUser(parameter: user) { isSuccess, message in
            if isSuccess {
                self.showAlert(title: "Log in Success", message: message){
                    guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                            let window = scene.windows.first else {
                            return
                        }
                    let newVC = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController")
                    let navVC = UINavigationController(rootViewController: newVC)
                        window.rootViewController = navVC
                        window.makeKeyAndVisible()
                }
                
            } else {
                self.showAlert(title: "Log in Unsuccess", message: message, completion: nil)
            }
        }
    }
    
    func setupContactUsInTextView() {
        let text = NSMutableAttributedString(string: "Not Registred  ")
        text.addAttribute(NSAttributedString.Key.font,
                          value: UIFont.systemFont(ofSize: 15),
                          range: NSRange(location: 0, length: text.length))
        
        let interactableText = NSMutableAttributedString(string: "Sign")
        interactableText.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.systemFont(ofSize: 15),
                                      range: NSRange(location: 0, length: interactableText.length))
        
        
        interactableText.addAttribute(NSAttributedString.Key.link,
                                      value: "Sign",
                                      range: NSRange(location: 0, length: interactableText.length))
        let interactableText3 = NSMutableAttributedString(string: " ")
        interactableText3.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.systemFont(ofSize: 15),
                                      range: NSRange(location: 0, length: interactableText3.length))
        let interactableText2 = NSMutableAttributedString(string: "Up")
        interactableText2.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.systemFont(ofSize: 15),
                                      range: NSRange(location: 0, length: interactableText2.length))
        
        
        interactableText2.addAttribute(NSAttributedString.Key.link,
                                      value: "Up",
                                      range: NSRange(location: 0, length: interactableText2.length))
        
        interactableText.addAttribute(NSAttributedString.Key.foregroundColor,
                                              value: UIColor.systemBlue,
                                                      range: NSRange(location: 0, length: interactableText.length))
        
        text.append(interactableText)
        text.append(interactableText3)
        text.append(interactableText2)
        
        
        textView.attributedText = text
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = true
        textView.delegate = self
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        self.navigationController?.popViewController(animated: true)
        return false
    }
   
    
}
