//
//  ScanerViewController.swift
//  aby monitor Saby + Cry Alarm - Разработка
//
//  Created by Sumit Sharma on 29/07/22.
//

import UIKit
import AVFoundation

class ScanerViewController: UIViewController {
 
 
  //MARK: Outlets
  @IBOutlet weak var topViewScan: UIView!
  @IBOutlet weak var caustomScanview: UIView!
  @IBOutlet weak var messageLable: UILabel!
  @IBOutlet weak var xButton: UIButton!
  
  //MARK: Valiable and Constants
  var captureSession: AVCaptureSession!
  var previewLayer: AVCaptureVideoPreviewLayer!
  
  var value = [0.5,0.8,0.9,1.0,1.5,1.9,2.2,0.5,0.8,0.9,1.0,1.5,1.9,2.2,0.5,0.8,0.9,1.0,1.5,1.9,2.2]
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      inialSetup()
      navHidden = 0
    }
  
  func inialSetup(){
    
    setUpQRCode()
    messageLable.text = ConstantText.shared.Scan_From_Parents_Text
    caustomScanview.addSubview(messageLable)
    caustomScanview.addSubview(topViewScan)
    caustomScanview.addSubview(xButton)
    
  }
  
  
  func setUpQRCode(){
    
      caustomScanview.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
    
        let metadataOutput = AVCaptureMetadataOutput()

        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = caustomScanview.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        caustomScanview.layer.addSublayer(previewLayer)

        captureSession.startRunning()
  }
  
  //MARK: Failed Alert
    func failed() {
      alertbox(title: ConstantText.shared.Scan_Not_Suppot_Text, message: ConstantText.shared.Scan_Not_Suppot_Message_Text, actionTitle: ConstantText.shared.OK , controller: self)
      captureSession = nil
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
  
  @IBAction func popView(_ sender: Any) {
    
    self.navigationController?.popViewController(animated: true)
  }
}

//MARK: QR Scanner delegate method
extension ScanerViewController : AVCaptureMetadataOutputObjectsDelegate{
 
  func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
      captureSession.stopRunning()

      if let metadataObject = metadataObjects.first {
          guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
          guard let stringValue = readableObject.stringValue else { return }
          AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
          found(code: stringValue)
      }
      dismiss(animated: true)
  }

  func found(code: String) {
      print(code)
    let secondView = DiscoverableViewController(nibName: "DiscoverableViewController", bundle: nil)
    self.navigationController?.pushViewController(secondView, animated: true)
  }

  override var prefersStatusBarHidden: Bool {
      return true
  }

  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
      return .portrait
  }
}
