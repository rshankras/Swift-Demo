//
//  ViewController.swift
//  PDFDemo
//
//  Created by Ravi Shankar on 10/04/20.
//  Copyright © 2020 Ravi Shankar. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        openPDFDocument()
    }
    
    func openPDFDocument() {
        guard let path = Bundle.main.url(forResource: "TheWakingLights",
                                         withExtension: "pdf") else { return }
        let document = PDFDocument(url: path)
        let pdfView = PDFView(frame: view.frame)
        pdfView.document = document
        view.addSubview(pdfView)
        
        pdfView.currentPage?.addAnnotation(highlightAnnotation())
            
    }
    
    func highlightAnnotation() -> PDFAnnotation {
        let annotation = PDFAnnotation(bounds: CGRect(x: 30, y: 80, width: 230, height: 50),
                                       forType: .highlight, withProperties: nil)
        annotation.color = .yellow
        return annotation
    }
    
}

