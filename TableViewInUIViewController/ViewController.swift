//
//  ViewController.swift
//  TableViewInUIViewController
//
//  Created by Chrishon Wyllie on 10/7/16.
//  Copyright © 2016 Chrishon Wyllie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    /*
     STEP 1:
        This tableView IBOutlet was connected from Main.Storyboard. All you have to do is drag in a normal UITableView (not a UITableViewController) and place it INSIDE a UIViewController
     
        IMPORTANT:
        You MUST connect the tableView's delegate and datasource methods to this UIViewController, both in Main.Storyboard AND this ViewController.swift class.
        - To connect in Main.Storyboard, open your Main.storyboard, and simply crtl-click and drag from the UITableView to the yellow 'View Controller' icon at the top of the View Controller scene.
            Once you let go, you will see two options: 'delegate' and 'datasource'. Choose both options.
        - To connect in this UIViewController, create an extension of this class OUTSIDE of this class' final brace. Example below.
     
     */
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/*
 STEP 2:
    Since, this is a regular UIViewController and we want it to act with hybrid behavior, we need to use the functions that a UITableViewController would provide.
    To do this, create an 'extension' of your UIViewController
    - Specify the type you wish to extend with. In this case, we are extending with type UITableViewDataSource and UITableViewDelegate.
    - In simpler words, we are 'importing' the functions and behavior of a normal UITableViewController into this UIViewController
 */

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // This is normally 1 but it depends on the nature of the app you are building.
    // This specfies how many 'columns' will appear in the app.
    // For most apps, a single column is all that is necessary.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Specifies how many rows will show in app.
    // This is a hard coded number, but if your app is pulling data from some external source,
    // this number will change.
    // For example, if this tableView was supposed to show all the users currently signed in the app,
    // those user objects would be loaded from some array (called numUsers for this example)
    // Therefore, we would return numUsers.count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    // Business as usual.
    // This is 'configures' each of the cells. From here, what the cells look like are dependent on you
    // This was included just to conclude and allow the app to run. You of course will likely provide custom cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell")
        cell?.textLabel?.text = "test"
        cell?.backgroundColor = UIColor.red
        return cell!
    }
    
    
}
