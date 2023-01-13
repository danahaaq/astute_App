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
    @AppStorage("welcomeScreenShown") // UserDefaults
    var welcomeScreenShown: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    @State var ispressed :Bool = false
    @State private var currentStep = 0
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            HStack(){
                Text("")
                Spacer()
                Button{
                    ispressed=true
                    
                }label: {
                    Text("Skip")
                        .font(.system(size: 19))
                        .foregroundColor(colorScheme == .dark ? .white : .gray)
                }.fullScreenCover(isPresented:$ispressed, content: ContentView.init)
                
            }.padding(20)
           
            TabView(selection: $currentStep){
                ForEach(0..<onBoardingSteps.count, id: \.self){ it in
                    VStack(alignment:.center,spacing: 25){
                        
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
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            
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
                    }
                    .tag(it)
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onAppear(perform: {
                UserDefaults.standard.welcomeScreenShown = true
            })
        }
    }
}

struct Onbording_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Onbording()
                .environment(\.colorScheme, .light)
            
            Onbording()
                .environment(\.colorScheme, .dark)
        }
        
    }
}
