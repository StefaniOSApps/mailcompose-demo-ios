//
//  AppDelegate.swift
//  wkwebview-demo-ios
//
//  Created by Stefan Nebel on 16.10.20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let viewModel = ViewModel.default
    let viewController = ViewController(viewModel: viewModel)

    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = viewController
    self.window?.makeKeyAndVisible()

    return true
  }
}

