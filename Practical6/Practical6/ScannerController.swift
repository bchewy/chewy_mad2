//
//  ScannerController.swift
//  Practical6
//
//  Created by Brian Chew on 26/11/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation
import UIKit
import QRCodeReader
import AVFoundation

class ScannerController: UIViewController, QRCodeReaderViewControllerDelegate {
    
        // Good practice: create the reader lazily to avoid cpu overload during the
        // initialization and each time we need to scan a QRCode
        lazy var readerVC: QRCodeReaderViewController = {
            let builder = QRCodeReaderViewControllerBuilder {
                $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
                
                // Configure the view controller (optional)
                $0.showTorchButton        = false
                $0.showSwitchCameraButton = false
                $0.showCancelButton       = false
                $0.showOverlayView        = true
                $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
            }
            
            return QRCodeReaderViewController(builder: builder)
        }()

        @IBAction func scanAction(_ sender: AnyObject) {
          // Retrieve the QRCode content
          // By using the delegate pattern
          readerVC.delegate = self

          // Or by using the closure pattern
          readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            print(result)
            
            DispatchQueue.main.async{
                let s = String(result!.value)
                self.printAlertResult(msg: s)
            }
          }

          // Presents the readerVC as modal form sheet
          readerVC.modalPresentationStyle = .formSheet
         
          present(readerVC, animated: true, completion: nil)
        }

        // MARK: - QRCodeReaderViewController Delegate Methods

        func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
          reader.stopScanning()

          dismiss(animated: true, completion: nil)
        }

        //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
        //By pressing on the switch camera button
    //    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
    //        if let cameraName = newCaptureDevice.device.localizedName {
    //          print("Switching capture to: \(cameraName)")
    //        }
    //    }

        func readerDidCancel(_ reader: QRCodeReaderViewController) {
          reader.stopScanning()

          dismiss(animated: true, completion: nil)
        }
    
    @IBAction func btnCamera(_ sender: Any) {
        readerVC.delegate = self
        readerVC.completionBlock = {(result: QRCodeReaderResult?) in
            if result != nil {
                print(result!.value)
            }
        }
        readerVC.modalPresentationStyle = .formSheet
        present(readerVC, animated: true,completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func printAlertResult(msg: String){
        let a = UIAlertController(title: "QRCode", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        a.addAction(action)
        present(a, animated: true, completion: nil)
    }
    

    
}
