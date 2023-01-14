//
//  ShareButton.swift
//  astute
//
//  Created by Aldanah Alqbbani on 21/06/1444 AH.
//
import SwiftUI
struct ShareSheet: View {
    var danah = "danah"
    var body: some View {
        VStack{
//            Button(action: {Shareid(Info: danah)}){
//                Text ("Share ID")
//                    .foregroundColor (.red)
//                    .bold()
//                    .frame(width: 100, height: 40, alignment: .center)
//                    .background(Color.white).cornerRadius(12)
//            }
        }
        }
        
    }
    
    func Shareid(Info: String){
        let infoU = Info
        let av = UIActivityViewController(activityItems: [infoU],applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
        if UIDevice.current.userInterfaceIdiom == .pad{
            av.popoverPresentationController?.sourceView = UIApplication.shared.windows.first
            av.popoverPresentationController?.sourceRect = CGRect(x:UIScreen.main.bounds.width/2.1,y:UIScreen.main.bounds.height/1.3,width:200,height:200)
        }
    }
    
struct ShareSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheet()
    }
}
