//
//  AppDelegate.swift
//  app7-login
//
//  Created by mario on 10/31/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isAuthenticate = false
    var plist = UserDefaults.standard
    var navController : UINavigationController?
    
    func MainStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func GetViewController(storyboard: UIStoryboard, ViewControllerName : String) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: ViewControllerName)
    }
    
    func SetrootViewController(rootViewController: UIViewController, animate: Bool, tipo: Int) {
        if animate {
            if (tipo == 0) {
                rootViewController.title = "Vista"
                navController = UINavigationController(rootViewController: rootViewController)
                window?.rootViewController = rootViewController
                window?.makeKeyAndVisible()
            } else {
                window?.rootViewController = rootViewController
            }
            //MARK: Animacion
            /*UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromRight, animations: {
                if tipo == 0 {
                    rootViewController.title = "Vista"
                    self.navController = UINavigationController(rootViewController: rootViewController)
                    self.window?.rootViewController = rootViewController
                    self.window?.makeKeyAndVisible()
                } else {
                    self.window?.rootViewController = rootViewController
                }
                
            }, completion: nil)*/
        } else {
            if animate {
                if (tipo == 0) {
                    rootViewController.title = "Vista"
                    navController = UINavigationController(rootViewController: rootViewController)
                    window?.rootViewController = rootViewController
                    window?.makeKeyAndVisible()
                } else {
                    window?.rootViewController = rootViewController
                }
            }
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // MARK: si ya esta autenticado
        let usuario = plist.string(forKey: "usuario")
        if let usu = usuario {
            if usu == "mario" {
                isAuthenticate = true
            }
        }
        if isAuthenticate {
            let viewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "Principal")
            SetrootViewController(rootViewController: viewController, animate: false, tipo: 0)
        }else {
            let loginViewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "Login") as! LoginViewController
            OnLoginSuccess()
            SetrootViewController(rootViewController: loginViewController, animate: true, tipo: 1)
        }
        return true
    }
    
    func OnLoginSuccess(){
        let viewController = GetViewController(storyboard: MainStoryBoard(), ViewControllerName: "Principal")
        SetrootViewController(rootViewController: viewController, animate: true, tipo: 0)
    }

    // MARK: UISceneSession Lifecycle


}

