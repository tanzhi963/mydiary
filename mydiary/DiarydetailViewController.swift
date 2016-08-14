//
//  DiarydetailViewController.swift
//  mydiary
//
//  Created by power on 16/5/28.
//  Copyright © 2016年 power. All rights reserved.
//

import UIKit

class DiarydetailViewController: UIViewController
{
        
    var indexrow = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let detailView:UIView = UIView.init(frame: UIScreen.mainScreen().bounds)
        detailView.backgroundColor = UIColor.lightGrayColor()
        
        self.title = "详细内容"
        
        let lable1:UILabel = UILabel.init(frame: CGRectMake(20, 100, 150, 30))
        
        lable1.text = "you click in \(indexrow) line"
        
        
        
//        self.navigationController?.navigationBar.barTintColor = UIColor.blueColor()
        
        
        detailView.addSubview(lable1)
        self.view.addSubview(detailView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
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
