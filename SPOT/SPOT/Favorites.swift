//
//  Favorites.swift
//  spottest
//
//  Created by Preksha Munot on 3/29/21.
//
import Foundation
import SwiftUI
import Combine

struct Favorites: View {
    @ObservedObject var fetcher = FavoriteFetcher()
    @State var isPressed = false
    @EnvironmentObject var makefavorites: MakeFavorite
    var body: some View {
        VStack(alignment: .leading){
            Text("My Favorites").font(.custom("Cabin-Bold", size: 30)).fontWeight(.bold).padding(.leading, 15)
            List(fetcher.favorites){ fave in
                VStack{
                    ZStack{
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .frame(width: 400, height: 179)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.10000000149011612)), radius:4, x:0, y:4)
                        HStack{
                            VStack(alignment: .leading){
                                Text(fave.name).font(.title3).fontWeight(.bold)
                            Text(fave.address)
                                .font(.custom("Cabin-Regular", size: 16))
                                .padding(.bottom,5)
                                HStack{
                                    Text("Rating:").font(.custom("Cabin-Regular", size: 14))
                                    Image(systemName: "star.fill").font(.system(size: 15))
                                    Image(systemName: "star.fill").font(.system(size: 15))
                                    Image(systemName: "star.fill").font(.system(size: 15))
                                }
                            }.padding(.trailing,30)
                            ZStack{
                                if (fave.percent>67) {
                                Circle()
                                    .trim(from: CGFloat(fave.remaning_ratio), to: 1)
                                    .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.772549033164978, green: 0.0941176488995552, blue: 0.13725490868091583, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),style: StrokeStyle(lineWidth: 8, lineCap: .round))
                                    .frame(width: 60, height: 60)
                                    .rotationEffect(Angle(degrees: 90))
                                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)).opacity(0.3), radius: 3, x: 0, y: 3)
                                    .padding(.leading, 20)
                                } else if (fave.percent > 33){
                                    Circle()
                                        .trim(from: CGFloat(fave.remaning_ratio), to: 1)
                                        .stroke(LinearGradient(gradient: Gradient(colors: [.yellow]), startPoint: .topTrailing, endPoint: .bottomLeading),style: StrokeStyle(lineWidth: 8, lineCap: .round))
                                        .frame(width: 60, height: 60)
                                        .rotationEffect(Angle(degrees: 90))
                                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)).opacity(0.3), radius: 3, x: 0, y: 3)
                                        .padding(.leading, 20)
                                } else {
                                    Circle()
                                        .trim(from: CGFloat(fave.remaning_ratio), to: 1)
                                        .stroke(LinearGradient(gradient: Gradient(colors: [.green]), startPoint: .topTrailing, endPoint: .bottomLeading),style: StrokeStyle(lineWidth: 8, lineCap: .round))
                                        .frame(width: 60, height: 60)
                                        .rotationEffect(Angle(degrees: 90))
                                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)).opacity(0.3), radius: 3, x: 0, y: 3)
                                        .padding(.leading, 20)
                                }
                                Text("\(fave.percent)%")
                                    .font(.custom("Cabin-Regular", size: 11))
                                    .fontWeight(.bold)
                                    .padding(.top, 5)
                                    .padding(.leading,20)
                                
                            }.padding(.trailing,10)
                            
                        }.padding(.trailing,30)
            }.navigationTitle("My Favorites")
                }
                
            }
        }
    }
}

public class FavoriteFetcher: ObservableObject {

    @Published var favorites = [Favorite]()
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://raw.githubusercontent.com/prekshamunot/SPOT-2021/main/test.json")!
    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Favorite].self, from: d)
                    DispatchQueue.main.async {
                        self.favorites = decodedLists
                    }
                }else {
                    print("No Data")
                }
            } catch {
                print ("Error")
            }
            
        }.resume()
         
    }
}

struct Favorite: Codable, Identifiable {
    public var id: String
    public var name: String
    public var address: String
    public var percent: Int
    public var remaning_ratio: Float
    
    enum CodingKeys: String, CodingKey {
           case id = "id"
           case name = "name"
           case address = "address"
        case percent = "percent"
        case remaning_ratio = "remaning_ratio"
        }
}
    

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
