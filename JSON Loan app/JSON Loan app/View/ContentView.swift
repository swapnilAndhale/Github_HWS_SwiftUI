//
//  ContentView.swift
//  JSON Loan app
//
//  Created by Swapnil on 09/09/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var loanStore = LoanStore()
    @State private var filterEnable = false
    @State private var maximuLoanAmount = 10000.0
    
    var body: some View {
        NavigationView {
            
            if self.filterEnable {
                LoanFilterView(amount: self.$maximuLoanAmount)
                    .transition(.opacity)
            }
            
            List(loanStore.loans) { loan in
                LoanCellView(loan: loan)
                    .padding(.vertical, 5)
            }
            .navigationTitle("Kiva Loan")
            .toolbar {
                Button(action: {
                    withAnimation(.linear) {
                        self.filterEnable.toggle()
                        self.loanStore.filterLoans(maxAmount: Int(self.maximuLoanAmount))
                    }
                }) {
                    Text("Filter")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear() {
            self.loanStore.fetchLatestLoans()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
