//
//  ViewController.swift
//  PDF Magic
//
//  Created by Dinesh Sharma on 03/03/24.
//

import UIKit
import UniformTypeIdentifiers

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnOpenPDFTapped(_ sender: Any) {
        let picker: UIDocumentPickerViewController
        let pdfType = ["com.adobe.pdf"]
        
        if #available(iOS 14.0, *) {
            let documentTypes = UTType.types(tag: "pdf", tagClass: UTTagClass.filenameExtension, conformingTo: nil)
            picker = UIDocumentPickerViewController(forOpeningContentTypes: documentTypes)
        } else {
            picker = UIDocumentPickerViewController(documentTypes: pdfType, in: .import)
        }
        
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    func openPDFWith(url: URL) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pdfVC = storyboard.instantiateViewController(identifier: "PdfVC") as! PDFViewController
        pdfVC.url = url
        navigationController?.pushViewController(pdfVC, animated: true)
    }
    
}

extension ViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let fetchedURL = urls.first else {
            return
        }
        openPDFWith(url: fetchedURL)
    }
}

