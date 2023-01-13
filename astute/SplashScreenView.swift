//
//  SplashScreenView.swift
//  astute
//
//  Created by Aldanah Alqbbani on 18/06/1444 AH.
//

import SwiftUI

struct SplashScreenView: View {
    @Environment(\.scenePhase) var phase
    @State var lastActiveTimeStamp : Date = Date()
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        ZStack{
            if isActive {
                OnbordingAppear()
                
            } else {
                VStack {
                    VStack {
                        Image("LOGO")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350,height: 350)
                        
                    }
                    .scaleEffect(size)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 3)
                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                        
                        withAnimation(repeated) {
                            size = 0.5
                            
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
            
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
