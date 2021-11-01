//
//  LoginViewController.swift
//  app7-login
//
//  Created by mario on 10/31/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var plist = UserDefaults.standard
    
    
    @IBOutlet var txtUser: UITextField!
    @IBOutlet var txtPass: UITextField!
    
    @IBAction func OnLogin(_ sender: Any) {
        let usuario = txtUser.text
        let pass = txtPass.text
        
        if usuario == "" || pass == "" {
            //MARK: Crear una alerta
            let alerta = UIAlertController(title: "Campos obligatorios", message: "Favor de llenar todos los campos", preferredStyle: .alert)
            //MARK: Crear accion para la alerta
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                    (UIAlertAction) in print("Se le ha dado en el boton aceptar")
                }))
                    
            //MARK: Presentar alerta
            present(alerta, animated: true, completion: nil)
        }else {
            
            ValidarUsuario(usuario: usuario!, pass: pass!)
        }
    }
    
    func ValidarUsuario(usuario: String, pass: String){
        if usuario == "mario" && pass == "1234" {
            plist.set(usuario, forKey: "usuario")
        }else {
            //MARK: Crear una alerta
            let alerta = UIAlertController(title: "Login fail", message: "Usuario y/o contraseña incorrectos", preferredStyle: .alert)
            //MARK: Crear accion para la alerta
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                    (UIAlertAction) in print("Se le ha dado en el boton aceptar")
                }))
                    
            //MARK: Presentar alerta
            present(alerta, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
