//
//  SceneDelegate.swift
//  Chaser
//
//  Created by 北島　志帆美 on 2022-05-25.
//

import UIKit
import AWSMobileClient

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            
            AWSMobileClient.default().initialize { [weak self, window] (userState, error) in
              
                guard let self = self else { return }
                
                if let error = error {
                    print("### AWSMobileClient.initialize.error", error.localizedDescription)
                    return
                }
                
                if let userState = userState {
                    switch (userState) {
                    case .signedIn:
                        
                        print("signed in")
                        
                    case .signedOut:
                        
                        // 詳細画面のRouterに依存関係の解決を依頼
                        // ここで、init時に受け取ったViewControllerを使う
                        
                        window.makeKeyAndVisible()
                        let navigationController = UINavigationController()
                        let loginViewController = SignInRouter.assembleModules()
                        navigationController.viewControllers = [loginViewController]
                        window.rootViewController = navigationController
                        
                    default:
                        AWSMobileClient.default().signOut()
                    
                       
                        // ここで、init時に受け取ったViewControllerを使う
                        window.makeKeyAndVisible()
                        let navigationController = UINavigationController()
                        let loginViewController = SignInRouter.assembleModules()
                        navigationController.viewControllers = [loginViewController]
                        window.rootViewController = navigationController
                        
                    }
                }
            }
            
            AWSMobileClient.default().addUserStateListener(self) { [weak self, window] (userState, info) in
               
                guard let self = self else { return }
                
                switch (userState) {
                
                case .signedIn:
                    print("signed in")
                    
                case .signedOut, .signedOutUserPoolsTokenInvalid:
                   
                    // ここで、init時に受け取ったViewControllerを使う
                    window.makeKeyAndVisible()
                    let navigationController = UINavigationController()
                    let loginViewController = SignInRouter.assembleModules()
                    navigationController.viewControllers = [loginViewController]
                    window.rootViewController = navigationController
                    
                    
                default:
                    
                    AWSMobileClient.default().signOut()
                   
                    // ここで、init時に受け取ったViewControllerを使う
                    window.makeKeyAndVisible()
                    let navigationController = UINavigationController()
                    let loginViewController = SignInRouter.assembleModules()
                    navigationController.viewControllers = [loginViewController]
                    window.rootViewController = navigationController
                    
                }
            }
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
    
}

