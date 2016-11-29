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
        progressLabel.text = "\(progress*100) %"
        progressBar.setProgress(progress, animated: true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
   

}
