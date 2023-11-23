//
//  ViewController.swift
//  APIImplementation
//
//  Created by Priya Gandhi on 2023-11-22.
//

import UIKit

class ViewController: UIViewController {
    var apiModel = APIHandler()
    var petitionModel = PetitionVM()
    var arrpetition : [Petition] = []
    @IBOutlet weak var tblPetitions : UITableView!
    @IBOutlet weak var lblTitle : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tblPetitions.register(UINib(nibName: "PetitionTVC", bundle: nil), forCellReuseIdentifier: "PetitionTVC")

        //self.setupSingleList()
       // self.getPostsData()
        self.getPetitionData()
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
    
    func getPetitionData(){
        petitionModel.getPetitions { petitionData, success in
            print(petitionData);
                self.arrpetition = petitionData?.results ?? []
            DispatchQueue.main.async {
                self.lblTitle.text = petitionData?.metadata.requestInfo.resource

                self.tblPetitions.reloadData()
            }
        }
        
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetitionTVC", for: indexPath) as! PetitionTVC
        let index = arrpetition[indexPath.row]
        cell.lblBody.text = index.body
        cell.lblTitle.text = index.title
        cell.lblStatus.text = index.status
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrpetition.count
    }
}
