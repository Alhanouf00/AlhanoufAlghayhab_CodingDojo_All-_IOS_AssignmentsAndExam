//
//  ContentView.swift
//  AlhanoufAlghayhab_ProfileCard
//
//  Created by administrator on 08/11/2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View
    {
        VStack
        {
            
            ZStack{
                //Color.red
                
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0, alignment: .center)
                    .foregroundColor(.indigo)
                    .background(.white)
                    .padding([.leading,.trailing],80)
                    .padding(.top,20)
            }
            
//            HStack
//            {
            VStack(alignment: .leading)
                {
                    //Spacer()
                    HStack {
                        Image(systemName: "mail")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30.0, height: 30.0, alignment: .trailing)
                            .foregroundColor(.indigo)
                            //.padding([.trailing,.leading],15)
                       
                        
                        Text("alhanouf.alghayhab@gmail.com")
                            .fontWeight(.bold)
                            .font(.custom("Helvetica Neue", size: 15))

                            .foregroundColor(.indigo)
                            .background(.white)
                            //.padding(.trailing,20)
                    }
                    .padding()
                
                
                    
                    HStack {
                        Image(systemName: "network")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30.0, height: 30.0, alignment: .trailing)
                                .foregroundColor(.indigo)
                                //.padding(.trailing,80)
                                
                        
                                //Spacer()
                        
                        Text("www.alhanoufg.com")
                            .fontWeight(.bold)
                            .font(.custom("Helvetica Neue", size: 15))

                            .foregroundColor(.blue)
                            .background(.white)
                            
                            
                        
                    }
                    .padding()
                }
                
                
//            }
            
            
            
           
        }.background(.gray)
    }
}
