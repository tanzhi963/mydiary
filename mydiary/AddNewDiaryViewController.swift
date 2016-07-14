//
//  AddNewDiaryViewController.swift
//  mydiary
//
//  Created by power on 16/7/13.
//  Copyright © 2016年 power. All rights reserved.
//

import UIKit

class AddNewDiaryViewController: UIViewController {

    
    let NewDiaryTitle:UITextField = UITextField(frame: CGRectMake(20,100,280,40))       //声明日记标题文本框
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.title = "新建日记"
        
        NewDiaryTitle.frame = CGRectMake(20, 100, self.view.frame.width-40, 40)
        NewDiaryTitle.borderStyle = UITextBorderStyle.RoundedRect
        NewDiaryTitle.placeholder = "这里写日记标题~"
        NewDiaryTitle.textAlignment = NSTextAlignment.Center
        
        self.view.addSubview(NewDiaryTitle)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NewDiaryTitle.resignFirstResponder()
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
