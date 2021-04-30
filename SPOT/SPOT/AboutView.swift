//
//  AboutView.swift
//  SPOT
//
//  Created by Preksha Munot on 4/29/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("About SPOT").padding().padding(.leading,130).font(.custom("Cabin-Bold", size: 20))
            Divider()
            Text("Terms of Use").padding(5).padding(.leading,10)
            Divider()
            Text("Privacy Policy").padding(5).padding(.leading,10)
            Divider()
            Text("Boston Univeristy Credential").font(.custom("Cabin-Bold", size: 12))
                .padding(20).padding(.leading,110)
            Spacer()
        }.padding(.bottom, 50)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
