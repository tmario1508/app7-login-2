//
//  AgregarViewController.swift
//  app7-login
//
//  Created by mario on 11/1/21.
//

import UIKit

class AgregarViewController: UIViewController {
    
    var plist = UserDefaults.standard
    //singleton
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var txtUser: UITextField!
    
    @IBOutlet var txtPassword: UITextField!
    
    @IBAction func onLogin(_ sender: Any) {
        plist.removeObject(forKey: "usuario")
        let mainStoryBoard = appDelegate.MainStoryBoard()
        let viewController = appDelegate.GetViewController(storyboard: mainStoryBoard, ViewControllerName: "Login")
        appDelegate.SetrootViewController(rootViewController: viewController, animate: true, tipo: 1)
    }
    
    @IBAction func onAgregar(_ sender: Any) {
        
        if txtUser.text == "" || txtPassword.text == "" {
            //MARK: Crear una alerta
            let alerta = UIAlertController(title: "Campos obligatorios", message: "Favor de llenar todos los campos", preferredStyle: .alert)
            //MARK: Crear accion para la alerta
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                    (UIAlertAction) in print("Alta de usuario fallida")
                }))
                    
            //MARK: Presentar alerta
            present(alerta, animated: true, completion: nil)
        }else {
            let entidad =  EntidadUsuario(usuario: txtUser.text!, pass: txtPassword.text!)
            lista.append(entidad)
            //MARK: Crear una alerta
            let alerta = UIAlertController(title: "Alta de usuario", message: "Se agrego correctamente el usuario", preferredStyle: .alert)
            //MARK: Crear accion para la alerta
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                (UIAlertAction) in print("Se agrego un usuario")
            }))
            //MARK: Presentar alerta
            present(alerta, animated: true, completion: nil)
            print("estos son los usuarios",lista.count)
            txtPassword.text = ""
            txtUser.text = ""
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
