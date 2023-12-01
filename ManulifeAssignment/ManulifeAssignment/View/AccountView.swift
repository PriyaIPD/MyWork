//
//  AccountView.swift
//  ManulifeAssignment
//
//  Created by Priya Gandhi on 2023-11-29.
//

import SwiftUI

struct AccountView: View {
    @State private var show: Bool = false
    @State private var totalAccountBalance: Double = 0.0
    @ObservedObject private var viewModel = AccountsVM()
    @Environment(\.presentationMode) var presentationMode
    @State  var trans: [Transactions] = []
    
    
    var body: some View{
        List{
            ForEach(viewModel.result, id: \.self.id ) { a in
                Text(a.display_name)
                
                    .onTapGesture {
                        self.show.toggle()
                        viewModel.setSelectedItem(accountType: a)

                        viewModel.getTransactionHistory() { dataArr in
                            self.trans = dataArr
                        }
                    }
            }
            .sheet(isPresented: $show) {
                
                
                ZStack(alignment: .leading) {
                    
                    List{
                        ForEach(self.trans, id: \.self.date ) { a in
                            let activity = a.activity
                            ForEach(activity, id: \.self.id ) { a in
                                Section(header: Text(a.description)) {
                                    Text("Transaction ID: TI\(String(a.transactionUid))")
                                    if let subtitle = a.depositAmount {
                                        Text("Deposit Amount: $\(String(a.depositAmount ?? 0.0))")
                                    }else{
                                        Text("Withdrawl Amount: $\(String(a.withdrawalAmount ?? 0.0))")
                                    }
                                    Text("Balance: $\(String(a.balance))")
                                }
                            }
                        }
                    }
                }
                .presentationDetents([.medium])
            }
        }
        .navigationTitle("Accounts")
        .navigationBarTitleDisplayMode(.automatic)
        
        .toolbar {
                Button("Quit") {
                    PreferenceManager.shared.deletingObjectsForKey(key: .Account)
                    self.presentationMode.wrappedValue.dismiss()
            }
            
        }
        .onAppear(perform: {
            viewModel.getAccountInfo { sum in
                totalAccountBalance = sum
                viewModel.getTransactionHistory() { dataArr in
                    self.trans = dataArr
                }
            }
        })
    }
}
