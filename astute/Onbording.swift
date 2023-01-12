//
//  Onbording.swift
//  astute
//
//  Created by Aldanah Alqbbani on 19/06/1444 AH.
//

import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let title2:String
}
private let onBoardingSteps = [
    OnBoardingStep(image: "1", title: "Scan any", title2: "text with astute."),
    OnBoardingStep(image: "2", title: "Focus",title2: "on specific line."),
    OnBoardingStep(image: "3", title: "Listen",title2: "to the text.")]

struct Onbording: View {
    @State var ispressed :Bool = false
    @State private var currentStep = 0
    var body: some View {
    
            
    
//            Color(.white).ignoresSafeArea()
            VStack(alignment: .center, spacing: 10){
                HStack{
                    Text("")
                    Spacer()
                    Button{
                    ispressed=true
                    
                }label: {
                    Text("Skip")
                        .font(.system(size: 19))
                        .foregroundColor(Color(red: 0.309, green: 0.334, blue: 0.364))
                }.fullScreenCover(isPresented:$ispressed, content: ContentView.init)}
                .padding()
                TabView(selection: $currentStep){
                    ForEach(0..<onBoardingSteps.count, id: \.self){ it in
                        VStack(alignment:.center,spacing: 30){
                            
                            Image(onBoardingSteps[it].image)
                                .resizable()
                                .padding()
                                .frame(width: 330, height: 330)
                                .cornerRadius(20)
                            
                            HStack(alignment: .center){
                                Text(onBoardingSteps[it].title)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.169, green: 0.664, blue: 0.778))
                                
                                Text(onBoardingSteps[it].title2)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.black)
                                
                            }
                            HStack(alignment: .center){
                                ForEach(0..<onBoardingSteps.count, id: \.self){ it in
                                    if it == currentStep{
                                        Circle()
                                            .frame(width: 10, height: 10)
                                            .cornerRadius(10)
                                            .foregroundColor(Color(red: 0.169, green: 0.664, blue: 0.778))
                                    }
                                    else{
                                        Circle().frame(width: 10, height: 10)
                                            .foregroundColor(Color(red: 0.682, green: 0.682, blue: 0.695))
                                        
                                    }
                                }
                                
                            }
                         
                            //                           .padding(.leading, 170.0)
                            //                        Text(onBoardingSteps[it].description)
                            //                               .font(.body)
                            //                               .fontWeight(.semibold)
                            //                               .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                            //                               .multilineTextAlignment(.leading)
                            //                               .padding(.leading, 0.0)
                            //                               .position(x: 164, y:-80)
                            //
                        }
                        .tag(it)
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
//        .toolbar{ ToolbarItem(placement: .navigationBarTrailing){
//            NavigationLink(destination:{
//                ContentView()
//
//            }, label:{
//                Text("Skip")
//                    .font(.system(size: 19))
//                    .foregroundColor(Color(red: 0.309, green: 0.334, blue: 0.364))
//            })
//        }
//        }
//        .navigationBarBackButtonHidden(true)
    }

struct Onbording_Previews: PreviewProvider {
    static var previews: some View {
        Onbording()
    }
}
