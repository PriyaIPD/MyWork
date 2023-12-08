//
//  ViewController.swift
//  QRCodeTracker
//
//  Created by Priya Gandhi on 2023-12-07.
//

import UIKit
import AVFoundation
import Stripe

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: AVMediaType.video, position: .back)

        guard let captureDevice = deviceDiscoverySession.devices.first else {
            print("Failed to get the camera device")
            return
        }

        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)

            // Set the input device on the capture session.
            captureSession.addInput(input)

        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(captureMetadataOutput)
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        DispatchQueue.main.async {
            [weak self] in
            self?.captureSession.startRunning()
        }
        // Do any additional setup after loading the view.
    }

    
    @IBAction func trackInfo(sender : UIButton){

        
    }
    
    func generateQRCode(from dictionary: [String:String]) -> UIImage? {
        do {
            let data = try JSONEncoder().encode(dictionary)
            if let validData = String(data: data,encoding: .utf8){
                print(validData)
            }

            if let filter = CIFilter(name: "CIQRCodeGenerator"){
                filter.setValue(data, forKey: "inputMessage")
                let transform = CGAffineTransform(scaleX: 10, y: 10)
                if let output = filter.outputImage?.transformed(by: transform){
                    return UIImage(ciImage: output)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection)
    {
        var str = ""
        if metadataObjects != nil && metadataObjects.count != 0
        {
            let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject

                if metadataObj.type == AVMetadataObject.ObjectType.qr
                {
                    guard let stringValue = metadataObj.stringValue else { return }
                    print(stringValue)
                    str = stringValue
                    if let res = try? JSONSerialization.jsonObject(with:Data(stringValue.utf8), options: []) as? [String:String] {
                        print(res)
                    }
                  

                }
           
        }
    }
}

