
//
//  DetailsViewController.swift
//  Flicks
//
//  Created by Dhruv Mangtani on 6/10/16.
//  Copyright © 2016 dhruv.mangtani. All rights reserved.
//

import UIKit
import AFNetworking

class DetailsViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: detailsView.frame.origin.y + detailsView.frame.size.height)
        
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        print(title)
        
        titleLabel.text = title
        overviewLabel.text = overview
        overviewLabel.sizeToFit()
        detailsView.sizeToFit()
        
        self.view.bringSubviewToFront(detailsView);
        // poster image
        // make sure that poster path is not nil
        if let posterPath = movie["poster_path"] as? String {
            // constant url
            let baseURL = "http://image.tmdb.org/t/p/w500/"
            // complete url
            let imageURL = NSURL(string: baseURL + posterPath)
            posterImageView.setImageWithURL(imageURL!)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
