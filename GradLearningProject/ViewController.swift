//
//  ViewController.swift
//  GradLearningProject
//
//  Created by Mani on 12/10/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getposts()
        print("Hi")
        
    }
    func getposts() {
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseJSON {
            response in
            //Original URL request
            print(response.request)
            //HTTP URL response
            print(response.response)
            
            print(response.data)
            print(response.result)
            if let JSON = response.result.value{
                print("JSON: \(JSON)")
            }
        }

    }

}

