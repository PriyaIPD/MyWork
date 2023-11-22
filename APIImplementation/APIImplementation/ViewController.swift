//
//  ViewController.swift
//  APIImplementation
//
//  Created by Priya Gandhi on 2023-11-22.
//

import UIKit

class ViewController: UIViewController {
    var apiModel = APIHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setupSingleList()
        self.getPostsData()
        // Do any additional setup after loading the view.
    }

    func setupSingleList(){
        apiModel.callSingleObjectAPI { result, isError  in
            print("Result is", result?.title ?? "")

        }
        
    }
    
    func getPostsData(){
        apiModel.getPosts { postData, success in
            if success{
                print("Posts",postData)
                postData?.forEach({ i in
                    print(i.title)
                })
        }

        }
        
    }

}

