//
//  ViewController.swift
//  Register User
//
//  Created by Pratik Gavit on 11/02/23.
//

import UIKit

class SignUpViewController: UIViewController,UITextViewDelegate {
    
    //MARK: outlets
    
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContactUsInTextView()
    }
    
    //MARK: Action
    @IBAction func signUpTapped(_ sender: Any) {
        guard let fullName = txtFullName.text else { return }
        guard let email = txtEmail.text else { return }
        guard let pass = txtPassword.text else { return }
        
        let user = RegisterModel(name: fullName, email: email, password: pass)
        
        ApiManager.shared.registerUser(parms: user) { isSucces , msg in
            if isSucces {
                self.showAlert(title: "Registration Success", message: msg, completion: nil)
            } else {
                self.showAlert(title: "Registration Unsccessful", message: msg, completion: nil)
            }
        }
    }
    
    
    //MARK: attributed string
    @IBOutlet weak var textView: UITextView!
    func setupContactUsInTextView() {
        let text = NSMutableAttributedString(string: "Already Registred  ")
        text.addAttribute(NSAttributedString.Key.font,
                          value: UIFont.systemFont(ofSize: 15),
                          range: NSRange(location: 0, length: text.length))
        
        let interactableText = NSMutableAttributedString(string: "Log")
        interactableText.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.systemFont(ofSize: 15),
                                      range: NSRange(location: 0, length: interactableText.length))
        
        
        interactableText.addAttribute(NSAttributedString.Key.link,
                                      value: "Log",
                                      range: NSRange(location: 0, length: interactableText.length))
        let interactableText3 = NSMutableAttributedString(string: " ")
        interactableText3.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.systemFont(ofSize: 15),
                                      range: NSRange(location: 0, length: interactableText3.length))
        let interactableText2 = NSMutableAttributedString(string: "In")
        interactableText2.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.systemFont(ofSize: 15),
                                      range: NSRange(location: 0, length: interactableText2.length))
        
        
        interactableText2.addAttribute(NSAttributedString.Key.link,
                                      value: "In",
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
        performSegue(withIdentifier: "toNext", sender: nil)
        return false
    }
}
