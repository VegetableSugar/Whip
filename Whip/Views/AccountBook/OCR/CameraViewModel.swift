//
//  CameraViewModel.swift
//  Whip
//
//  Created by peo on 2022/06/25.
//

import SwiftUI
import AVFoundation
import Combine

class CameraViewModel: ObservableObject {
    @Published var model: Camera
    private let session: AVCaptureSession
    let cameraPreview: AnyView
    
    private var subscriptions = Set<AnyCancellable>()
    @Published var recentImage: UIImage?
    
    @Published var isFlashOn = false
    @Published var isSilentModeOn = false
    
    func configure() {
        model.requestAndCheckPermissions()
    }
    
    func switchFlash() {
        isFlashOn.toggle()
    }
    
    func switchSilent() {
        isSilentModeOn.toggle()
    }
    
    func capturePhoto() {
        model.capturePhoto()
    }
    func changeCamera() {
        print("[CameraViewModel]: Camera changed!")
    }
    
    init() {
        let temp = Camera()
        model = temp
        session = temp.session
        cameraPreview = AnyView(CameraPreviewView(session: session).frame(width: UIScreen.main.bounds.width, height: 520))
        
        model.$recentImage.sink { [weak self] (photo) in
            guard let pic = photo else { return }
            self?.recentImage = pic
        }
        .store(in: &self.subscriptions)
    }
    
    
}
