//
//  ScannerController.swift
//  Practical 6
//
//  Created by MAD2 on 28/11/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import Foundation
import UIKit
import QRCodeReader
import AVFoundation

class ScannerController: UIViewController, QRCodeReaderViewControllerDelegate {
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
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
    /*
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        if let cameraName = newCaptureDevice.device.localizedName {
            print("Switching capturing to: \(cameraName)")
        }
    }
    */
 
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    @IBOutlet weak var lblValue:UILabel!
    
    @IBAction func btnCamera(_ sender: Any) {
        s = ""
        readerVC.delegate = self
        readerVC.completionBlock = {(result: QRCodeReaderResult?) in
            if result != nil {
                print(result!.value)
            }
        }
        readerVC.modalPresentationStyle = .formSheet
        present(readerVC, animated: true,completion: nil)
    }
    var s:String = ""
}

