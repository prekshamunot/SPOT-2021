//
//  Settings.swift
//  SPOT
//
//  Created by Tilak Agarwal on 3/28/21.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        
        NavigationView {
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text("My Settings").font(.custom("Cabin Bold", size: 30))
                    Spacer()
                    Image("Mugar")
                        .resizable()
                        .frame(width: 78, height: 77)
                        .clipShape(RoundedRectangle(cornerRadius: 218))
                    .frame(width: 78, height: 77)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                    Spacer()
                }
                Spacer()
                NavigationLink(destination: LoginView()) {
                                Text("Logout")
                                    .padding()
                                    .foregroundColor(.red)
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    
                }.frame(width: 150, height: 60)
                NavigationLink(destination: LoginView()) {
                                Text("Send Feedback")
                                    .padding()
                                    .foregroundColor(.red)
                                    .background(Color.white)
                                    .cornerRadius(5)
                }.frame(width: 250, height: 60)
                NavigationLink(destination: LoginView()) {
                                Text("About")
                                    .padding()
                                    .foregroundColor(.red)
                                    .background(Color.white)
                                    .cornerRadius(5)
                }.frame(width: 150, height: 60)
                Spacer()
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
