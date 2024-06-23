//
//  RoundedButton.swift
//  OnlineGroceriesShopSwiftUI
//
//  Created by Min Zin Phyo on 04/05/2024.
//

import SwiftUI

struct RoundedButton: View {
    
    @State var title: String = "Title"
    var didTap: (()->())?
    
    var body: some View {
        Button{
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color.primary)
        .cornerRadius(20)
    }
}

#Preview {
    RoundedButton()
}
