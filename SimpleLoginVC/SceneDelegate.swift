//
//  SceneDelegate.swift
//  SimpleLoginVC
//
//  Created by Дима Холод on 23.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    let authenticationService: AuthenticationService = FirebaseAuthenticationService()
    var window: UIWindow?
    let startAppWithProfile = true
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        // guard let _ = (scene as? UIWindowScene) else { return }
        guard (scene as? UIWindowScene) != nil else { return }
#if DEBUG
        if startAppWithProfile {
            let storyboard = UIStoryboard(name: "SetupProfile", bundle: nil)
            let ctl = storyboard.instantiateViewController(withIdentifier: "setupProfileVC")
            let navigationCtl = UINavigationController(rootViewController: ctl)
            window?.rootViewController = navigationCtl
            window?.makeKeyAndVisible()
            return
        }
#endif
        if authenticationService.isAuthenticated() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = storyboard.instantiateViewController(withIdentifier: "homeViewController")
            let navigationVC = UINavigationController(rootViewController: homeVC)
            window?.rootViewController = navigationVC
            window?.makeKeyAndVisible()
        }
    }
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded
        // (see `application:didDiscardSceneSessions` instead).
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
