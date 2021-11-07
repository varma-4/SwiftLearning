//
//  ViewController.swift
//  GradLearningProject
//
//  Created by Mani on 12/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Implementation of URLSession
        getPosts()
       
        
    }
    func getPosts(){
        //setup the HTTP request
        let session = URLSession.shared
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        //creating data task
        let task = session.dataTask(with: url) { data, response, error in
            // checking if there is data or not
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            //checking if the status code is OK
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            //checks the MIME type
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            //convert the response data to JSON
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }

        task.resume()

}

}
