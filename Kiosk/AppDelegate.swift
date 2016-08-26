//
//  AppDelegate.swift
//  Kiosk
//
//  Created by Albert Martin on 8/25/16.
//  Copyright © 2016 TreeHouse. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func applicationWillEnterForeground(application: UIApplication) {
    let vc = window?.rootViewController as! ViewController
    vc.checkLoadedState();
  }

}
