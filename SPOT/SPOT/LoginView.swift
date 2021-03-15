//
//  LoginView.swift
//  SPOT
//
//  Created by Tilak Agarwal on 3/14/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            TextField("Email", text: .constant(""))
                .frame(width: 360, height: 60)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:5, x:0, y:5)
            TextField("Password", text: .constant(""))
                .frame(width: 360, height: 60)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:5, x:0, y:5)
            NavigationView {
                NavigationLink(destination: HomeView()) {
                                Text("Login").fontWeight(.semibold)
                                    .font(.title)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(5)
                }.frame(width: 150, height: 60)
                
            }.frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
