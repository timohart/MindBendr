//
//  AppDelegate.swift
//  MindBendr
//
//  Created by Timothy Hartwig Student on 3/27/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    preloadData()
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    self.saveContext()
  }
  
  private func preloadData() {
    let preloadDataKey = "didPreloadedData"
    
    let userDefaults = UserDefaults.standard
    
    if userDefaults.bool(forKey:preloadDataKey) == false {
      guard let urlPathQuestions = Bundle.main.url(forResource: "preloadedQuestion", withExtension: "plist") else {
        return
      }
      
      guard let urlPathAnswer = Bundle.main.url(forResource: "preloadedAnswer", withExtension: "plist") else {
        return
      }
      
      guard let urlPathLevels = Bundle.main.url(forResource: "preloadedLevels", withExtension: "plist") else {
        return
      }
      
      guard let urlPathCatigory = Bundle.main.url(forResource: "preloadedCatigory", withExtension: "plist") else {
        return
      }
      
      let backgroundContext = persistentContainer.newBackgroundContext()
      
      backgroundContext.perform {
        do {
          // Question
          if let arrayContentsQuestions = NSArray(contentsOf: urlPathQuestions) as? [String] {
            for questionInfo in arrayContentsQuestions {
              let question = Question(context: backgroundContext)
              question.questionText = questionInfo
            }
            
            try backgroundContext.save()
          }
          
          // Answer
          if let arrayContentsAnswers = NSArray(contentsOf: urlPathAnswer) as? [String] {
            for answerInfo in arrayContentsAnswers {
              let answer = Answer(context: backgroundContext)
              answer.answerText = answerInfo
            }
            
            try backgroundContext.save()
          }
          
          //Level
          if let arrayContentsLevel = NSArray(contentsOf: urlPathLevels) as? [String] {
            for levelInfo in arrayContentsLevel {
              let level = Level(context: backgroundContext)
              level.level = Int16(levelInfo)!
            }
            
            try backgroundContext.save()
          }
          
          // Catigory
          if let arrayContentsCatigory = NSArray(contentsOf: urlPathCatigory) as? [String] {
            for catigoryInfo in arrayContentsCatigory {
              let catigory = Catigory(context: backgroundContext)
              catigory.name = catigoryInfo
              catigory.discription = catigoryInfo
            }
            
            try backgroundContext.save()
          }
          
          userDefaults.set(true, forKey: preloadDataKey)
        } catch {
          print(error.localizedDescription)
        }
      }
      
    }
  }

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
      /*
       The persistent container for the application. This implementation
       creates and returns a container, having loaded the store for the
       application to it. This property is optional since there are legitimate
       error conditions that could cause the creation of the store to fail.
      */
      let container = NSPersistentContainer(name: "MindBendr")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
              // Replace this implementation with code to handle the error appropriately.
              // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
               
              /*
               Typical reasons for an error here include:
               * The parent directory does not exist, cannot be created, or disallows writing.
               * The persistent store is not accessible, due to permissions or data protection when the device is locked.
               * The device is out of space.
               * The store could not be migrated to the current model version.
               Check the error message to determine what the actual problem was.
               */
              fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
      return container
  }()

  // MARK: - Core Data Saving support

  func saveContext () {
      let context = persistentContainer.viewContext
      if context.hasChanges {
          do {
              try context.save()
          } catch {
              // Replace this implementation with code to handle the error appropriately.
              // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
              let nserror = error as NSError
              fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
      }
  }

}

