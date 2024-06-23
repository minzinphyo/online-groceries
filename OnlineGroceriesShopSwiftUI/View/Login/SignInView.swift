//
//  SignInView.swift
//  OnlineGroceriesShopSwiftUI
//
//  Created by Min Zin Phyo on 04/05/2024.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @State var textMobile : String = ""
    @State var isShowPicker: Bool = false
    @State var countryObj : Country?
    
    var body: some View {
        ZStack{
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height: .screenHeight)
            
            VStack{
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth,height: .screenWidth)
                
                Spacer()
            }
            
            ScrollView{
                
                VStack(alignment: .leading){
                    Text("Get Your Groceries\nwith nectar")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom,25)
                    
//                    Text("Get Your Groceries\nwith nectar")
//                        .font(.customfont(.medium, fontSize: 16))
//                        .foregroundColor(.white.opacity(0.7))
//                        .multilineTextAlignment(.center)
//                        .padding(.bottom,30)
                    
                    HStack{
                        
                        Button{
                            isShowPicker = true
                        } label: {
                            
                            if let countryObj = countryObj{
                                
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 35))
                                
                                Text("+\(countryObj.phoneCode)")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.primaryText)
                            }
                        }
                        
                        TextField("Enter Mobile Number", text: $textMobile)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    
                    Divider()
                        .padding(.bottom,25)
                
                    
                    Text("or connect with social media")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.textTitle)
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.bottom,25)
                    
                    Button{
                        
                    } label: {
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                        
                        Text("Continue with Google")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom,8)
                    
                    Button{
                        
                    } label: {
                        
                        Image("fb_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                        
                        Text("Continue with Facebook")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                }
                .padding(.horizontal,20)
                .frame(width: .screenWidth,alignment: .leading)
                .padding(.top, .topInsets + .screenWidth)
                
            }
        }
        .onAppear{
            self.countryObj = Country(phoneCode: "95", isoCode: "MM")
        }
        .sheet(isPresented: $isShowPicker, content: {
            CountryPickerUI(country: $countryObj)
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}
