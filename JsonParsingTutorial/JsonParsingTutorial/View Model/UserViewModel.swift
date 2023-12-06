//
//  UserViewModel.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-01.
//

import UIKit

class UserViewModel: NSObject {
    var users : UserModel?
    var glossaryObj : GlossaryDTO?

    var homeObj: HomeModel? // @Published notifies the view when it changes (once network call is done)

    func getUserList(completion :([Users])-> Void) {
        var url : String = ""
           url = "SampleRecords.json"
            if let url = Bundle.main.url(forResource: url, withExtension: nil){
                if let data = try? Data(contentsOf: url){
                    
                    let jsondecoder = JSONDecoder()
                    do{
                        let result = try jsondecoder.decode(UserModel.self, from: data)
                        self.users = result
                        print(result.users.first?.lastName ?? "")
                        completion(result.users)
                    }
                    catch {
                        print("error trying parse json", error)
                    }
                }
            }
        
    }
    
    func getList(completion :([Members])-> Void) {

        var url : String = ""
           url = "test.json"
            if let url = Bundle.main.url(forResource: url, withExtension: nil){
                if let data = try? Data(contentsOf: url){
                    
                    let jsondecoder = JSONDecoder()
                    do{
                        let result = try jsondecoder.decode(HomeModel.self, from: data)
                        self.homeObj = result
                        print(result.homeTown)
                        completion(result.members)
                    }
                    catch {
                        print("error trying parse json", error)
                    }
                }
            }else{
                print("Invalid Url")
            }
    }
    
    
    func getGlossaryItems(completion :(GlossaryDTO?, [String?])-> Void) {

        var url : String = ""
           url = "gloassary.json"
            if let url = Bundle.main.url(forResource: url, withExtension: nil){
                if let data = try? Data(contentsOf: url){
                    
                    let jsondecoder = JSONDecoder()
                    do{
                        let result = try jsondecoder.decode(GlossaryDTO.self, from: data)
                        self.glossaryObj = result
                        completion(self.glossaryObj, self.glossaryObj? .glossary.glossDiv.glossList.glossEntry.glossDef.glossSeealso ?? [])
                    }
                    catch {
                        print("error trying parse json", error)
                    }
                }
            }else{
                print("Invalid Url")
            }
    }
}
