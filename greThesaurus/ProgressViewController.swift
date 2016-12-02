//
//  ProgressViewController.swift
//  greThesaurus
//
//  Created by Ke Lu on 11/28/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var startButton: UIButton!
    

    @IBAction func resetAll(_ sender: UIButton) {
        for i in 0 ..< explData.count {
            ratingData[i] = "0"
        }
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let dataFilePath = paths[0].appendingPathComponent("ratingFile.plist")
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(ratingData, forKey: "ratingFile")
        archiver.finishEncoding()
        data.write(to: dataFilePath, atomically: true)
        
        var progress: Float = 0.0
        for i in 0 ..< ratingData.count {
            if (ratingData[i] as! NSString).intValue != 0 {
                progress += 1
            }
            
        }
        progress = progress / Float(ratingData.count)
        progressLabel.text = String(format: "%.2f %%", progress*100)
        progressBar.setProgress(progress, animated: true)

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var progress: Float = 0.0
        for i in 0 ..< ratingData.count {
            if (ratingData[i] as! NSString).intValue != 0 {
                progress += 1
            }
           
        }
        progress = progress / Float(ratingData.count)
        progressLabel.text = String(format: "%.2f %%", progress*100)
        progressBar.setProgress(progress, animated: true)
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "startMemorizing" {
            let svc = segue.destination as! showWordController
            var idx = ratingData.index(of: "0")
            if idx < 10000000 { //there isn't that many english words so it's safe to hard code
                print(idx)
                svc.passWord = wordData.object(at: idx) as! String
                svc.passExpl = explData.object(at: idx) as! String
                svc.passRating = 0
            } else {
                idx = -1
                print("nil")
                svc.passWord = "The end"
                svc.passExpl = ""
                svc.passRating = 0
            }
            
     
        }
    }
    
    
    /*
    var counter:Int = 0 {
        didSet {
            let fractionalProgress = Float(counter) / 100.0
            let animated = counter != 0
            
            progressBar.setProgress(fractionalProgress, animated: animated)
            progressLabel.text = ("\(counter)%")
        }
    }
     */
    
    override func viewWillAppear(_ animated: Bool) {
        var progress: Float = 0.0
        for i in 0 ..< ratingData.count {
            if (ratingData[i] as! NSString).intValue != 0 {
                progress += 1
            }
            
        }
        progress = progress / Float(ratingData.count)
        progressLabel.text = String(format: "%.2f %%", progress*100)
        progressBar.setProgress(progress, animated: true)
    }
   

}
