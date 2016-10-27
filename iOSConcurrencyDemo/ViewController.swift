//
//  ViewController.swift
//  iOSConcurrencyDemo
//
//  Created by cyper on 27/10/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import UIKit

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://algoos.com/wp-content/uploads/2015/08/ireland-02.jpg", "http://bdo.se/wp-content/uploads/2014/01/Stockholm1.jpg"]

class Downloader {
    class func downloadImageWithURL(_ url: String) -> UIImage {
        let data = try! Data(contentsOf: URL(string: url)!)
        return UIImage(data: data)!
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickOnStart(_ sender: AnyObject) {
        
    }
    
    @IBAction func didClickOnCancel(_ sender: AnyObject) {
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValueLabel.text = "\(sender.value * 100.0)"
    }
    
}

