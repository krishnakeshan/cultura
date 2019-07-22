import UIKit
import Flutter
import Parse

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    //init stuff
    initStuff()
    
    //initialize some values
    let controller = window?.rootViewController as! FlutterViewController
    let mainChannel = FlutterMethodChannel(name: "in.ac.cmrit.cultura/main", binaryMessenger: controller)
    
    mainChannel.setMethodCallHandler { (flutterMethodCall, flutterResult) in
        //method to get all event categories
        if flutterMethodCall.method == "getEventCategories" {
            let objectConverter = ObjectConverter()
            
            //create query for event categories
            let categoriesQuery = PFQuery(className: "EventCategory")
            categoriesQuery.findObjectsInBackground(block: { (objects, error) in
                if error == nil {
                    //got all category objects
                    var resultObjects: [[String : Any]] = []
                    
                    for object in objects! {
                        resultObjects.append(objectConverter.parseObjectToMap(parseObject: object))
                    }
                    
                    //return results
                    flutterResult(resultObjects)
                }
            })
        }
        
        //method to get all events for a category
        else if flutterMethodCall.method == "getEventsForCategory" {
            //get category id
            let objectConverter = ObjectConverter()
            let categoryId = (flutterMethodCall.arguments as! [String : Any])["categoryId"] as! String
            
            //create query for event
            let eventsQuery = PFQuery(className: "Event")
            eventsQuery.whereKey("categoryId", equalTo: categoryId)
            eventsQuery.findObjectsInBackground(block: { (objects, error) in
                if error == nil {
                    //got all event objects
                    var eventObjects: [[String : Any]] = []
                    
                    //convert parse objects
                    for object in objects! {
                        eventObjects.append(objectConverter.parseObjectToMap(parseObject: object))
                    }
                    
                    //return result
                    flutterResult(eventObjects)
                }
            })
        }
        
        //method to log in user
        else if flutterMethodCall.method == "logInUser" {
            flutterResult("")
        }
        
        //method to get volunteer mode
        else if flutterMethodCall.method == "getVolunteerMode" {
            flutterResult(false)
        }
            
            //method to open an event registration link
        else if flutterMethodCall.method == "openRegistrationLink" {
            //get link
            let url = URL(string: (flutterMethodCall.arguments as! [String : Any])["regLink"] as! String)!
            
            //open link
            UIApplication.shared.openURL(url)
            
            //return a result
            flutterResult("success")
        }
        
        //method to get all sponsors
        else if flutterMethodCall.method == "getSponsors" {
            let objectConverter = ObjectConverter()
            
            //create query for event categories
            let categoriesQuery = PFQuery(className: "Sponsor")
            categoriesQuery.findObjectsInBackground(block: { (objects, error) in
                if error == nil {
                    //got all category objects
                    var resultObjects: [[String : Any]] = []
                    
                    for object in objects! {
                        resultObjects.append(objectConverter.parseObjectToMap(parseObject: object))
                    }
                    
                    //return results
                    flutterResult(resultObjects)
                }
            })
        }
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    //mmethod to initialize all libraries
    func initStuff() {
        //initialize parse
        let parseConfig = ParseClientConfiguration {
            $0.applicationId = "30e51261-39fe-42ec-a0d8-e75d242e5205"
            $0.server = "http://35.237.58.159:1337/cultura"
            $0.isLocalDatastoreEnabled = true
        }
        
        Parse.initialize(with: parseConfig)
    }
}
