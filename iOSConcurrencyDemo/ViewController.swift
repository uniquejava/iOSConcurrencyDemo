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
    
    var queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickOnStart(_ sender: AnyObject) {
        queue = OperationQueue()
        queue.addOperation {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            OperationQueue.main.addOperation({
                self.imageView1.image = img1
            })
        }
        queue.addOperation {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            OperationQueue.main.addOperation({
                self.imageView2.image = img2
            })
        }
        queue.addOperation {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            OperationQueue.main.addOperation({
                self.imageView3.image = img3
            })
        }
        queue.addOperation {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            OperationQueue.main.addOperation({
                self.imageView4.image = img4
            })
        }

        //let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) // old
        //let queue = DispatchQueue.global(qos: .default) // global concurrent queue
        
        //let queue = dispatch_queue_create("com.cyper.xxx", DISPATCH_QUEUE_SERIAL)
        //let queue = DispatchQueue(label: "com.cyper.xxx", qos: .userInitiated)
        /*
        let queue = DispatchQueue(label: "com.cyper.xxx", qos: .userInitiated, attributes: .concurrent)
        
        queue.async {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            DispatchQueue.main.async {
                self.imageView1.image = img1
            }
        }
        
        queue.async {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            DispatchQueue.main.async {
                self.imageView2.image = img2
            }
        }
        
        queue.async {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            DispatchQueue.main.async {
                self.imageView3.image = img3
            }
        }
        
        queue.async {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            DispatchQueue.main.async {
                self.imageView4.image = img4
            }
        }
        */
        
    }
    
    @IBAction func didClickOnCancel(_ sender: AnyObject) {
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValueLabel.text = "\(sender.value * 100.0)"
    }
    
}

