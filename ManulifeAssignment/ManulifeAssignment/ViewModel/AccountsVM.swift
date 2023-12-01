//
//  AccountsVM.swift
//  ManulifeAssignment
//
//  Created by Priya Gandhi on 2023-11-28.
//

import UIKit
import SwiftUI

class AccountsVM: ObservableObject  {
    @Published var transactions : [Transactions] = []
    @Published var selectedAccName: String?
    @Published var selectedItem: Account?
    @Published var result : [Account] = []

    init(){
    }

    func getAccountInfo(completionHandler: (Double) -> Void) {

        let obj = PreferenceManager.shared.get(forKey: .Account)
        if obj.isEmpty == false{
            self.result = obj
            let totalBalance = obj.reduce(0) { $0 + $1.balance }
            completionHandler(totalBalance)
        }
        else{
            if let url = Bundle.main.url(forResource: "listOfAccounts.json", withExtension: nil){
                
                if let data = try? Data(contentsOf: url){
                    
                    let jsondecoder = JSONDecoder()
                    
                    do{
                        let result = try jsondecoder.decode([Account].self, from: data)
                        self.result = result
                        PreferenceManager.shared.set(result, forKey: .Account)
                        let totalBalance = result.reduce(0) { $0 + $1.balance }
                        
                        completionHandler(totalBalance)
                    }
                    catch {
                        print("error trying parse json")
                    }
                }
            }
        }
        
    }
    
    func getTransactionHistory(completionHandler: ([Transactions]) -> Void) {
        var url : String = ""
        let type : AccountType = AccountType(rawValue: self.selectedItem?.display_name ?? "" ) ?? .chequing

        switch type{
        case .saving:
            url = "savingsAccount.json"
        case .chequing:
            url = "chequingAccount.json"
        case .tfsa:
            url = "TfsaAccount.json"
        }
            
            if let url = Bundle.main.url(forResource: url, withExtension: nil){
                if let data = try? Data(contentsOf: url){
                    
                    let jsondecoder = JSONDecoder()
                    do{
                        let result = try jsondecoder.decode([Transactions].self, from: data)
                        self.transactions = result
                        completionHandler(self.transactions )
                    }
                    catch {
                        print("error trying parse json")
                    }
                }
            }
        
    }
    
    func setSelectedItem(accountType: Account){
        self.selectedItem = accountType
        objectWillChange.send()
    }
}
