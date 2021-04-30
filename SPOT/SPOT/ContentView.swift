//
//  ContentView.swift
//  SPOT
//
//  Created by Tilak Agarwal on 3/14/21.
//

import SwiftUI

struct ContentView: View {
    @State var loggedIn = false
    @ObservedObject var makefavorites = MakeFavorite()
    @State var navigationBarBackButtonHidden = true
    var body: some View {
        if loggedIn{
            TabView {
                ListUIView(text: "")
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                            }
                Favorites()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favorites")
                    }
                Settings()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }

            }
            .accentColor(Color(#colorLiteral(red: 0.800000011920929, green: 0, blue: 0, alpha: 1)))
            .environmentObject(makefavorites)
            
        } else {
            VStack{
                Image("SPOT logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 80)
                ZStack(){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .frame(width: 350, height: 62)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:5, x:0, y:5)
                    TextField("Email", text: .constant(""))
                        .frame(width: 340, height: 60)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:5, x:0, y:5)
                }.padding(.bottom, 30)
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .frame(width: 350, height: 62)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:5, x:0, y:5)
                    TextField("Password", text: .constant(""))
                        .frame(width: 340, height: 60)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:5, x:0, y:5)
                }.padding(.bottom, 150)
                
                            Text("Login")
                                .frame(width: 90, height: 30)
                                .onTapGesture {loggedIn = true}
                                .font(.custom("Cabin-Bold", size: 24))
                                .padding()
                                .foregroundColor(.white)
                                .background(Color(#colorLiteral(red: 0.800000011920929, green: 0, blue: 0, alpha: 1)))
                                .cornerRadius(15)
                                .frame(width: 250, height: 60)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
