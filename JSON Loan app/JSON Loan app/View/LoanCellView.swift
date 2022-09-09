//
//  LoanCellView.swift
//  JSON Loan app
//
//  Created by Swapnil on 09/09/22.
//

import SwiftUI

struct LoanCellView: View {
    var loan: Loan
    
    var body: some View {
        
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(loan.name)
                    .font(.system(.headline, design: .rounded))
                    .bold()
                Text(loan.country)
                    .font(.system(.subheadline, design: .rounded))
                Text(loan.use)
                    .font(.system(.body, design: .rounded))
            }
            Spacer()
            
            VStack {
                Text("$\(loan.amount)")
                    .font(.system(.title, design: .rounded))
                    .bold()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct LoanCellView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCellView(loan: Loan(name: "Ivan", country: "India", use: "to buy book", amount: 453)).previewLayout(.sizeThatFits)
    }
}
