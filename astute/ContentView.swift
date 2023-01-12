//
//  ContentView.swift
//  astute
//
//  Created by Aldanah Alqbbani on 15/06/1444 AH.
//

import SwiftUI
import VisionKit
import HalfASheet
import AVFoundation

let utterance = AVSpeechSynthesizer()
struct ContentView: View {
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State private var parentRect: CGRect = .zero
    @State private var childRect: CGRect = .zero
    
    func correctPostion() {
        print(self.currentPosition)
        if self.currentPosition.width > 100 {
            self.currentPosition.width = 100
        }
        if self.currentPosition.height > 550 {
            self.currentPosition.height = 550
        }
        if self.currentPosition.width < -100 {
            self.currentPosition.width = -100
        }
        if self.currentPosition.height < -500 {
            self.currentPosition.height = -500
        }
    }
    
    @State private var ruler_insert:Bool = false
    @State private var ruler_remove:Bool = false
    
    @State private var Big_text:Bool = false
    @State private var Remove_Big_text:Bool = false
    
    @State private var startScanning = false
    @State private var scanText = NSLocalizedString("", comment: "")
    @State private var scanText2 = NSLocalizedString("",comment: "")
    
    @State private var circle1 : Bool = false
    @State private var circle2 : Bool = false
    @State private var circle3 : Bool = false
    @State private var circle4 : Bool = false
    @State private var circle5 : Bool = false
    @State private var circle6 : Bool = false
    @State var scan: Bool = false
    @State var text: Bool = false
    @State var ruler: Bool = false
    @State var speach: Bool = false
    
    @State private var bgColor = Color(red: 0.965, green: 0.965, blue: 0.965)
    @State private var bgColor1 = Color(.white)
    
    @State var sliderValue : Float = 389.0
    @State var sliderValue2 : Float = 19.0
    
    @State private var isToggle : Bool = false
    @State var speedrate : Float = 0.1
    
    var body: some View {
        //       why? because the share tool
        NavigationView{
            //           Zstack for that gather VStack parent for the screen and thepopup
            ZStack{
                //                zstack content 1
                //                VStack parent for the screen
                VStack() {
                    //                     Vstack for share button,bacground color
                    VStack{
                        VStack(alignment: .leading,spacing: 10){
                            Text("Background")
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.258, green: 0.283, blue: 0.287))
                            //                            color bar
                            HStack(alignment: .center, spacing:19){
                                Button(action:{
                                    bgColor = Color(red: 0.914, green: 0.901, blue: 0.619)
                                }
                                       , label: {
                                    Circle()
                                        .frame(width: 30,height: 30)
                                        .foregroundColor(Color(red: 0.914, green: 0.901, blue: 0.619))
                                })
                                Button(action:{
                                    bgColor = Color(red: 0.72, green: 0.55, blue: 0.687)
                                }
                                       , label: {
                                    Circle()
                                        .frame(width: 30,height: 30)
                                        .foregroundColor(Color(red: 0.72, green: 0.55, blue: 0.687))
                                })
                                Button(action:{
                                    bgColor = Color(red: 0.412, green: 0.917, blue: 0.967)
                                }
                                       , label: {
                                    Circle()
                                        .frame(width: 30,height: 30)
                                        .foregroundColor(Color(red: 0.412, green: 0.917, blue: 0.967))
                                })
                                Button(action:{
                                    bgColor = Color(red: 0.971, green: 0.727, blue: 0.528)
                                }
                                       , label: {
                                    Circle()
                                        .frame(width: 30,height: 30)
                                        .foregroundColor(Color(red: 0.971, green: 0.727, blue: 0.528))
                                })
                                Button(action:{
                                    bgColor = Color(red: 0.43, green: 0.945, blue: 0.668)
                                }
                                       , label: {
                                    Circle()
                                        .frame(width: 30,height: 30)
                                        .foregroundColor(Color(red: 0.43, green: 0.945, blue: 0.668))
                                })
                                Button(action:{
                                    bgColor = Color(red: 0.43, green: 0.945, blue: 0.668)
                                }
                                       , label: {
                                    Circle()
                                        .frame(width: 30,height: 30)
                                        .foregroundColor(Color(red: 0.168, green: 0.959, blue: 0.857))
                                })
                                
                                ColorPicker("Background color", selection: $bgColor).labelsHidden()
                            }
                            
                        } .padding()
                            .toolbar{ ToolbarItem(placement: .navigationBarTrailing){
                                Button(action:{
                                    
                                }, label:{
                                    Image(systemName: "square.and.arrow.up")
                                        .foregroundColor(Color(red: 0.309, green: 0.334, blue: 0.364))
                                })
                            }
                            }
                    }
                    //                    Vstack for text and ruler
                    //                     text and ruler
                    VStack(alignment: .leading){
                        ScrollView{
                            if Big_text{
                                Text(scanText)
                                    .font(.system(size: CGFloat(sliderValue2)))
                                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                                    .background(bgColor)
                                    .background(in: Rectangle())
                                    .ignoresSafeArea()
                                    .overlay{
                                        if ruler_insert{
                                            Rectangle()
                                                .frame(width: CGFloat(sliderValue),height: CGFloat(sliderValue)/11)
                                                .offset(x: 0, y: self.currentPosition.height)
                                                .foregroundColor(bgColor1)
                                                .opacity(0.4)
                                                .gesture(
                                                    DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                                        .onChanged { value in
                                                            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                                            
                                                            self.correctPostion()
                                                        }
                                                        .onEnded { value in
                                                            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                                            
                                                            self.correctPostion()
                                                            
                                                            self.newPosition = self.currentPosition
                                                        }
                                                )
                                            
                                        }
                                        
                                    }
                            }
                            
                            else{
                                Text(scanText)
                                    .font(.system(size: 19))
                                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                                    .background(bgColor)
                                    .background(in: Rectangle())
                                    .ignoresSafeArea()
                                    .overlay{
                                        if ruler_insert == true && ruler_remove == false{
                                            Rectangle()
                                                .frame(width: CGFloat(sliderValue),height: CGFloat(sliderValue)/11)
                                                .foregroundColor(bgColor1)
                                                .opacity(0.4)
                                                .offset(x: 0, y: self.currentPosition.height)
                                                .gesture(
                                                    DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                                        .onChanged { value in
                                                            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                                            
                                                            self.correctPostion()
                                                        }
                                                        .onEnded { value in
                                                            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                                            
                                                            self.correctPostion()
                                                            
                                                            self.newPosition = self.currentPosition
                                                        }
                                                )
                                        }
                                        
                                    }
                                
                            }
                            
                        }
                        
                    }
                    
                    //                    Vstack parient for tools bar
                    VStack{
                        //                        tool bar
                        HStack(spacing: 55){
                            Button(action :{
                                ruler = false
                                text = false
                                speach = false
                                scan.toggle()
                            }
                                   , label: {
                                VStack{
                                    Image(systemName: "text.viewfinder")
                                        .resizable()
                                        .frame(width: 27,height: 24)
                                        .foregroundColor(Color(red: 0.309, green: 0.334, blue: 0.364))
                                    
                                    Text("Scan")
                                        .foregroundColor(Color(red: 0.309, green: 0.334, blue: 0.364))
                                }
                            })
                            Button(action :{
                                ruler = false
                                scan = false
                                speach = false
                                text.toggle()
                            }
                                   , label: {
                                VStack{
                                    Image(systemName: "textformat.size")
                                        .resizable()
                                        .frame(width: 37,height: 22)
                                        .foregroundColor(Color(red: 0.309, green: 0.334, blue: 0.364))
                                    Text("Text")
                                        .foregroundColor(Color(red: 0.309, green: 0.334, blue: 0.364))
                                }
                            })
                            Button(action :{
                                scan = false
                                text = false
                                speach = false
                                ruler.toggle()
                            }
                                   , label: {
                                VStack{
                                    Image(systemName: "ruler")
                                        .resizable()
                                        .frame(width: 39,height: 21)
                                        .foregroundColor(Color(red: 0.309, green: 0.334, blue: 0.364))
                                    Text("Ruler")
                                        .foregroundColor(Color(red: 0.309, green: 0.334, blue: 0.364))
                                }
                            })
                            
                            Button(action :{
                                ruler = false
                                text = false
                                scan = false
                                speach.toggle()
                                
                            }
                                   , label: {
                                VStack{
                                    Image(systemName: "speaker.wave.2")
                                        .resizable()
                                        .frame(width: 36,height: 24)
                                        .foregroundColor(Color(red: 0.309, green: 0.334, blue: 0.364))
                                    Text("Speach")
                                        .foregroundColor(Color(red: 0.309, green: 0.334, blue: 0.364))
                                }
                            })
                        }.padding(21)
                        
                        //                        scan condition
                    }
                    
                    if scan{
                        DataScanner(startScanning: $startScanning, scanText: $scanText)
                    }
                    
                }
                .edgesIgnoringSafeArea(.bottom)
                .background(bgColor)
                
                //                for the Scan
                .task {
                    if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                        startScanning.toggle()
                    }
                }
                
                //                Zstack content 2
                
                //                Halfsheet 1 for the Ruler
                HalfASheet(isPresented: $ruler) {
                    // NavigationView for the tile ruler
                    NavigationView{
                        // Vstack parient
                        VStack(alignment: .center, spacing: 24){
                            //Vstack for the ruler background color
                            VStack(alignment: .leading){
                                Text("Color")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.258, green: 0.283, blue: 0.287))
                                //color bar
                                HStack(alignment: .center, spacing:19){
                                    Button(action:{
                                        bgColor1 = Color(red: 0.914, green: 0.901, blue: 0.619)
                                    }
                                           , label: {
                                        Circle()
                                            .frame(width: 30,height: 30)
                                            .foregroundColor(Color(red: 0.914, green: 0.901, blue: 0.619))
                                    })
                                    Button(action:{
                                        bgColor1 = Color(red: 0.72, green: 0.55, blue: 0.687)
                                    }
                                           , label: {
                                        Circle()
                                            .frame(width: 30,height: 30)
                                            .foregroundColor(Color(red: 0.72, green: 0.55, blue: 0.687))
                                    })
                                    Button(action:{
                                        bgColor1 = Color(red: 0.412, green: 0.917, blue: 0.967)
                                    }
                                           , label: {
                                        Circle()
                                            .frame(width: 30,height: 30)
                                            .foregroundColor(Color(red: 0.412, green: 0.917, blue: 0.967))
                                    })
                                    Button(action:{
                                        bgColor1 = Color(red: 0.971, green: 0.727, blue: 0.528)
                                    }
                                           , label: {
                                        Circle()
                                            .frame(width: 30,height: 30)
                                            .foregroundColor(Color(red: 0.971, green: 0.727, blue: 0.528))
                                    })
                                    Button(action:{
                                        bgColor1 = Color(red: 0.43, green: 0.945, blue: 0.668)
                                    }
                                           , label: {
                                        Circle()
                                            .frame(width: 30,height: 30)
                                            .foregroundColor(Color(red: 0.43, green: 0.945, blue: 0.668))
                                    })
                                    Button(action:{
                                        bgColor1 = Color(red: 0.43, green: 0.945, blue: 0.668)
                                    }
                                           , label: {
                                        Circle()
                                            .frame(width: 30,height: 30)
                                            .foregroundColor(Color(red: 0.168, green: 0.959, blue: 0.857))
                                    })
                                    
                                    ColorPicker("Color", selection: $bgColor1).labelsHidden()
                                }
                            }
                            //stack for the wight slider
                            VStack(alignment: .leading,spacing: 10){
                                Text("Wight")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.258, green: 0.283, blue: 0.287))
                                HStack(alignment: .center){
                                    Text("Size")
                                    Slider(value: $sliderValue, in: 380...1000)
                                    Text("\(Int(sliderValue))")
                                        .padding()
                                }
                                
                                
                            }.padding()
                            HStack(alignment: .center,spacing: 20){
                                Button(action :{
                                    ruler_insert = true
                                    ruler_remove = false
                                    ruler.toggle()
                                    
                                }, label: {
                                    RoundedRectangle(cornerRadius: 11)
                                        .frame(width: 147,height: 52)
                                        .foregroundColor(Color.blue)
                                        .overlay{
                                            Text("Insert")
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                })
                                Button(action :{
                                    ruler_remove = true
                                    ruler.toggle()
                                    ruler_insert = false
                                }, label: {
                                    
                                    RoundedRectangle(cornerRadius: 11)
                                        .frame(width: 147,height: 52)
                                        .foregroundColor(Color(red: 0.941, green: 0.941, blue: 0.941))
                                        .overlay{
                                            Text("Remove")
                                                .fontWeight(.bold)
                                                .foregroundColor(.blue)
                                        }
                                    
                                })
                            }
                            
                        }
                        .navigationTitle("Ruler")
                    }
                }
                .height(.proportional(0.60))
                .closeButtonColor(UIColor.lightGray)
                .backgroundColor(.white)
                
                //halfsheeet 2 for Text
                HalfASheet(isPresented: $text) {
                    NavigationView{
                        VStack(alignment: .center,spacing: 24) {
                            VStack(alignment: .leading,spacing: 10){
                                Text("Wight")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.258, green: 0.283, blue: 0.287))
                                HStack(alignment: .center){
                                    Text("Size")
                                    Slider(value: $sliderValue2, in: 12...30)
                                    Text("\(Int(sliderValue2))")
                                        .padding()
                                }
                                
                            }
                            Button(action :{
                                Big_text = true
                                text.toggle()
                            }, label: {
                                RoundedRectangle(cornerRadius: 11)
                                    .frame(width: 147,height: 52)
                                    .foregroundColor(Color.blue)
                                    .overlay{
                                        Text("Save")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                            })
                        }
                        .navigationTitle("Text")
                    }
                }
                .height(.proportional(0.40))
                .closeButtonColor(UIColor.lightGray)
                .backgroundColor(.white)
                
                //halfsheeet 3
                HalfASheet(isPresented: $speach) {
                    NavigationView{
                        VStack(alignment: .center,spacing: 20){
                            VStack(alignment: .leading){
                                Text("Speed")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.258, green: 0.283, blue: 0.287))
                                HStack(alignment: .center){
                                    Image(systemName: "tortoise")
                                        .foregroundColor(Color(red: 0.565, green: 0.565, blue: 0.586))
                                    Slider(value: $speedrate, in: 0.1...0.6)
                                    Image(systemName: "hare")
                                        .foregroundColor(Color(red: 0.565, green: 0.565, blue: 0.586))
                                    
                                        .padding()
                                }
                            }
                            VStack(alignment: .center){
                                HStack{
                                    Button{
                                      //  speach = false
//                                        let utterance2 = AVSpeechUtterance(string:"\(scanText)")
//                                        utterance2.rate = speedrate
//                                        let Voices = AVSpeechSynthesisVoice.speechVoices()
//                                        for Voice in Voices{
//                                            print(Voice.language)
//                                        }
                                        utterance.speak(AVSpeechUtterance(string: "hi"))
//                                        if utterance.isSpeaking{
//                                           // utterance.pauseSpeaking(at: .immediate)
//                                            utterance.stopSpeaking(at: .immediate)
//                                            //                                            utterance.speak(utterance2)
//                                        }
//
                                        //                                    utterance.stopSpeaking(at: .immediate)
                                    }
                                label: {
                                    RoundedRectangle(cornerRadius: 11)
                                        .frame(width: 147,height: 52)
                                        .foregroundColor(Color.blue)
                                        .overlay{
                                            Text("Speak")
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                }
                                    Button{
//                                        speach = false
//                                        let utterance2 = AVSpeechUtterance(string:"\(scanText)")
//                                        utterance2.rate = speedrate
//                                        let Voices = AVSpeechSynthesisVoice.speechVoices()
//                                        for Voice in Voices{
//                                            print(Voice.language)
//                                        }
//                                        utterance.speak(utterance2)
//                                        if utterance.isSpeaking{
                                  //  utterance.pauseSpeaking(at: .immediate)
                                      //  utterance.stopSpeaking(at: .immediate)
                                        utterance.pauseSpeaking(at: .immediate)
                                        print("tapped")
//                                        }
   
                                    }
                                label: {
                                    RoundedRectangle(cornerRadius: 11)
                                        .frame(width: 147,height: 52)
                                        .foregroundColor(Color(red: 0.941, green: 0.941, blue: 0.941))
                                        .overlay{
                                            Text("Stop")
                                                .fontWeight(.bold)
                                                .foregroundColor(.blue)
                                        }
                                }
                                }
                            }
                        }
                        .padding(.vertical)
                        .padding(.all, 26.0)
                        
                        .navigationTitle("Speach")
                    }
                    
                }
                
                .height(.proportional(0.50))
                .closeButtonColor(UIColor.lightGray)
                .backgroundColor(.white)
            }.navigationBarBackButtonHidden(true)
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
