//
//  ViewController.swift
//  Swift-Petición
//
//  Created by Gerardo Valencia on 1/11/16.
//  Copyright © 2016 Gerardo Valencia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Box: UITextField!
    
    @IBOutlet weak var Respuesta: UITextView!
    

    @IBAction func Search(sender: AnyObject) {
        
        Start()
        textFieldShouldReturn(Box)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func Start(){
        
        let textobox = Box.text
        let urls0 = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        let url = NSURL(string: urls0 + textobox!)
        let datos:NSData? = NSData(contentsOfURL: url!)
        
        if (datos != nil)
        {
        let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
        Respuesta.text = String(texto)
        }
        else
        {
            let alertController = UIAlertController(title: "Internet Error", message:
                "Verify internet connection and retry ", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}

