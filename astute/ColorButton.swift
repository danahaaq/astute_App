//
//  ColorButton.swift
//  astute
//
//  Created by Aldanah Alqbbani on 20/06/1444 AH.
//
import SwiftUI
import Foundation

struct ColorButton: View {
    
    @Binding var bgColor: Color
    @Environment(\.colorScheme) var colorScheme
    @State private var isselcted1:Bool = false
    @State private var isselcted2:Bool = false
    @State private var isselcted3:Bool = false
    @State private var isselcted4:Bool = false
    @State private var isselcted5:Bool = false
    @State private var isselcted6:Bool = false
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            Text("Background")
                .fontWeight(.semibold)
                .foregroundColor(colorScheme == .dark ? .white : Color(red: 0.258, green: 0.283, blue: 0.287))
            
            HStack(alignment: .center, spacing:19){
                Button(action:{
                    isselcted1 = true
                    isselcted2 = false
                    isselcted3 = false
                    isselcted4 = false
                    isselcted5 = false
                    isselcted6 = false
                    bgColor = Color(red: 0.914, green: 0.901, blue: 0.619)
                }
                       , label: {
                    ZStack{
                        if isselcted1{
                            Circle()
                                .strokeBorder(colorScheme == .dark ? .white :.black, lineWidth: 5)
                                .frame(width: 38, height: 38)
                        }
                        Circle()
                            .frame(width: 30,height: 30)
                            .foregroundColor(Color(red: 0.914, green: 0.901, blue: 0.619))
                    }
                })
                Button(action:{
                    isselcted1 = false
                    isselcted2 = true
                    isselcted3 = false
                    isselcted4 = false
                    isselcted5 = false
                    isselcted6 = false
                    bgColor = Color(red: 0.72, green: 0.55, blue: 0.687)
                }
                       , label: {
                    ZStack{
                        if isselcted2{
                            Circle()
                                .strokeBorder(colorScheme == .dark ? .white :.black, lineWidth: 5)
                                .frame(width: 38, height: 38)
                        }
                        Circle()
                            .frame(width: 30,height: 30)
                            .foregroundColor(Color(red: 0.72, green: 0.55, blue: 0.687))
                    }
                })
                Button(action:{
                    isselcted1 = false
                    isselcted2 = false
                    isselcted3 = true
                    isselcted4 = false
                    isselcted5 = false
                    isselcted6 = false
                    bgColor = Color(red: 0.412, green: 0.917, blue: 0.967)
                }
                       , label: {
                    ZStack{
                        if isselcted3{
                            Circle()
                                .strokeBorder(colorScheme == .dark ? .white :.black, lineWidth: 5)
                                .frame(width: 38, height: 38)
                        }
                        
                        Circle()
                            .frame(width: 30,height: 30)
                            .foregroundColor(Color(red: 0.412, green: 0.917, blue: 0.967))
                    }
                })
                Button(action:{
                    isselcted1 = false
                    isselcted2 = false
                    isselcted3 = false
                    isselcted4 = true
                    isselcted5 = false
                    isselcted6 = false
                    bgColor = Color(red: 0.971, green: 0.727, blue: 0.528)
                }
                       , label: {
                    ZStack{
                        if isselcted4{
                            Circle()
                                .strokeBorder(colorScheme == .dark ? .white :.black, lineWidth: 5)
                                .frame(width: 38, height: 38)
                        }
                        Circle()
                            .frame(width: 30,height: 30)
                            .foregroundColor(Color(red: 0.971, green: 0.727, blue: 0.528))
                    }
                })
                Button(action:{
                    isselcted1 = false
                    isselcted2 = false
                    isselcted3 = false
                    isselcted4 = false
                    isselcted5 = true
                    isselcted6 = false
                    
                    bgColor = Color(red: 0.43, green: 0.945, blue: 0.668)
                }
                       , label: {
                    ZStack{
                        if isselcted5{
                            Circle()
                                .strokeBorder(colorScheme == .dark ? .white :.black, lineWidth: 5)
                                .frame(width: 38, height: 38)
                        }
                        Circle()
                            .frame(width: 30,height: 30)
                            .foregroundColor(Color(red: 0.43, green: 0.945, blue: 0.668))
                    }
                })
                Button(action:{
                    isselcted1 = false
                    isselcted2 = false
                    isselcted3 = false
                    isselcted4 = false
                    isselcted5 = false
                    isselcted6 = true
                    bgColor = Color(red: 0.43, green: 0.945, blue: 0.668)
                }
                       , label: {
                    ZStack{
                        if isselcted6{
                            Circle()
                                .strokeBorder(colorScheme == .dark ? .white :.black, lineWidth: 5)                                .frame(width: 38, height: 38)
                        }
                        Circle()
                            .frame(width: 30,height: 30)
                            .foregroundColor(Color(red: 0.168, green: 0.959, blue: 0.857))
                    }
                })
                
                ColorPicker("Background color", selection: $bgColor).labelsHidden()
            }
        }
    }
}
struct ColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorButton(bgColor: .constant(.gray))
    }
}
