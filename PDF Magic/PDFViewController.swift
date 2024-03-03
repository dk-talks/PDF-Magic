//
//  PDFViewController.swift
//  PDF Magic
//
//  Created by Dinesh Sharma on 03/03/24.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    
    var url: URL?
    @IBOutlet weak var viewPDF: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let pdf = PDFDocument(url: url!) else {
            print("faild to load the pdf")
            return
        }
        viewPDF.document = pdf
        viewPDF.autoScales = true
        
    }

}
