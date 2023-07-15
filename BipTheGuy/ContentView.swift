//
//  ContentView.swift
//  BipTheGuy
//
//  Created by Bob Witmer on 2023-07-15.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var animateImage = true
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("clown")
                .resizable()
                .scaledToFit()
                .scaleEffect(animateImage ? 1.0 : 0.9)
                .onTapGesture {
                    playSound(soundName: "punchSound")
                    animateImage = false    // Shrink the image by 90% via the scaleEffect()
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.3)) {   // With Spring Animation
                        animateImage = true // Change the image back to 100% via the scaleEffect()
                    }
                }


            Spacer()
            
            Button {
                //TODO: Button action here
            } label: {
                Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
            }

        }
        .padding()
    }
    // Function to Play a sound
    // Requires:    import AVFAudio
    //              @State private var audioPlayer: AVAudioPlayer!
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName).")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
