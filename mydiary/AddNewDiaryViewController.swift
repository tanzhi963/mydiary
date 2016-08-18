//
//  AddNewDiaryViewController.swift
//  mydiary
//
//  Created by power on 16/7/13.
//  Copyright © 2016年 power. All rights reserved.
//

import UIKit

import CoreData





class AddNewDiaryViewController: UIViewController , UITextViewDelegate
{

    
    /***************UIKIT声明区********************/
    
    let NewDiaryTitle:UITextField = UITextField(frame: CGRectMake(20,100,280,40))       //声明日记标题文本框
    
    let NewDiartContent:UITextView = UITextView(frame: CGRectMake(1, 1, 1, 1))          //声明日记主题内容
    
    let ImageMoodHappy:UIImageView = UIImageView(frame: CGRectMake(0, 460, 80, 80))
    
    let ImageMoodNormal:UIImageView = UIImageView(frame: CGRectMake(80, 460, 80, 80))
    
    let ImageMoodChuckle:UIImageView = UIImageView(frame: CGRectMake(160, 460, 80, 80))
    
    let ImageMoodSad:UIImageView = UIImageView(frame: CGRectMake(240, 460, 80, 80))
    
    let ImageMoodAngry:UIImageView = UIImageView(frame: CGRectMake(320, 460, 80, 80))
    
    let ImageMoodHappy2:UIImageView = UIImageView(frame: CGRectMake(0, 540, 80, 80))
    
    let ImageMoodNormal2:UIImageView = UIImageView(frame: CGRectMake(80, 540, 80, 80))
    
    let ImageMoodChuckle2:UIImageView = UIImageView(frame: CGRectMake(160, 540, 80, 80))
    
    let ImageMoodSad2:UIImageView = UIImageView(frame: CGRectMake(240, 540, 80, 80))
    
    let ImageMoodAngry2:UIImageView = UIImageView(frame: CGRectMake(320, 540, 80, 80))
    

    let ConfirmButton:UIButton = UIButton(type: UIButtonType.System)

    /***************UIKIT声明区********************/
    
    
    /***************函数声明区********************/
    
    
    lazy var documentsPath:String = {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths.first!}()                                     //本程序目录位置
    
    /***************函数声明区********************/

    
    
    //==================================================================
    //函数名：viewDidLoad
    //功能：加载此页面时加载的内容
    //输入参数：无
    //返回值：无
    //==================================================================

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.title = "新建日记"
        
        NewDiaryTitleInit()                         //新建日记标题初始化函数
        
        NewDiartContentInit()                       //新建日记内容初始化函数
        
        ConfirmButtonInit()                         //确认按键初始化函数
        
        AddNewDiaryBackbarbuttonInit()              //返回按钮初始化

        ImageMoodInit()                             //心情图片初始化
        
        
        
        
    }
    
    //==================================================================
    //函数名：AddNewDiaryBackbarbuttonInit
    //功能：初始化新日记返回BarItem
    //输入参数：无
    //返回值：无
    //==================================================================
    
    func AddNewDiaryBackbarbuttonInit()
    {
        let Backbarbutton:UIBarButtonItem = UIBarButtonItem(title: "<返回", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddNewDiaryViewController.BackBarButtonClick))
        self.navigationItem.leftBarButtonItem = Backbarbutton
        
    }
    
    //==================================================================
    //函数名：NewDiaryTitleInit
    //功能：初始化新日记标题输入栏
    //输入参数：无
    //返回值：无
    //==================================================================
    
    func NewDiaryTitleInit()
    {
        NewDiaryTitle.frame = CGRectMake(20, 80, self.view.frame.width-40, 40)
        NewDiaryTitle.borderStyle = UITextBorderStyle.RoundedRect
        //        NewDiaryTitle.borderStyle = UITextBorderStyle.None
        //        NewDiaryTitle.layer.borderColor = UIColor.lightGrayColor().CGColor
        //        NewDiaryTitle.layer.borderWidth = 1.0
        //        NewDiaryTitle.layer.cornerRadius = 10
        NewDiaryTitle.placeholder = "这里写日记标题~"
        NewDiaryTitle.textAlignment = NSTextAlignment.Center
        
        self.view.addSubview(NewDiaryTitle)         //添加新日记标题

    }
    
    //==================================================================
    //函数名：NewDiartContentInit
    //功能：初始化新日记内容文本框
    //输入参数：无
    //返回值：无
    //==================================================================
    
    func NewDiartContentInit()
    {
        NewDiartContent.frame = CGRectMake(20, 140, self.view.frame.width-40, 300)
        NewDiartContent.layer.backgroundColor = UIColor.clearColor().CGColor
        //        NewDiartContent.layer.borderColor = UIColor.init(red: 223, green: 223, blue: 223, alpha: 1.0).CGColor
        NewDiartContent.layer.borderColor = UIColor.lightGrayColor().CGColor
        NewDiartContent.layer.borderWidth = 1.0
        NewDiartContent.layer.cornerRadius = 10.0
        NewDiartContent.text = "今天的日记内容~"
        NewDiartContent.textColor = UIColor.lightGrayColor()
        
        NewDiartContent.delegate = self             //日记内容设置代理
        
        self.view.addSubview(NewDiartContent)       //添加新日记内容文本框
    }
    
    //==================================================================
    //函数名：ImageMoodInit
    //功能：心情图片初始化
    //输入参数：无
    //返回值：无
    //==================================================================
    
    func ImageMoodInit()
    {
        ImageMoodHappy.image = UIImage(named: "Happy_V0.1_600*600")
        ImageMoodChuckle.image = UIImage(named: "Chuckle_V0.1_600*600")
        ImageMoodNormal.image = UIImage(named: "Normal_V0.1_600*600")
        ImageMoodSad.image = UIImage(named: "Sad_V0.1_600*600")
        ImageMoodAngry.image = UIImage(named: "Angry_V0.1_600*600")
        
        ImageMoodHappy2.image = UIImage(named: "Happy_V0.2_600*600")
        ImageMoodChuckle2.image = UIImage(named: "Chuckle_V0.2_600*600")
        ImageMoodNormal2.image = UIImage(named: "Normal_V0.2_600*600")
        ImageMoodSad2.image = UIImage(named: "Sad_V0.2_600*600")
        ImageMoodAngry2.image = UIImage(named: "Angry_V0.2_600*600")
        
        
        self.view.addSubview(ImageMoodHappy)
        self.view.addSubview(ImageMoodChuckle)
        self.view.addSubview(ImageMoodNormal)
        self.view.addSubview(ImageMoodSad)
        self.view.addSubview(ImageMoodAngry)
        
        self.view.addSubview(ImageMoodHappy2)
        self.view.addSubview(ImageMoodChuckle2)
        self.view.addSubview(ImageMoodNormal2)
        self.view.addSubview(ImageMoodSad2)
        self.view.addSubview(ImageMoodAngry2)
    }
    
    //==================================================================
    //函数名：ConfirmButtonInit
    //功能：初始化确认按钮
    //输入参数：无
    //返回值：无
    //==================================================================
    
    func ConfirmButtonInit()
    {
        ConfirmButton.frame = CGRectMake(20,640,100,40)
//        ConfirmButton.backgroundColor = UIColor.blueColor()
        ConfirmButton.setTitle("确认", forState: UIControlState.Normal)
        
        ConfirmButton.addTarget(self, action: #selector(AddNewDiaryViewController.ConfirmButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(ConfirmButton)         //添加确认按钮，作用是提交新日记
        
    }
    
    //==================================================================
    //函数名：BackBarButtonClick
    //功能：点击返回按钮后执行的事件
    //输入参数：无
    //返回值：无
    //==================================================================
    
    func BackBarButtonClick()
    {
//        let DiarydetailViewController = DiarydetailViewController()
        let diarytableview = DiaryTableViewController()
        diarytableview.tableView.reloadData()
//        DiaryTableViewController.readdiarydetail()
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    //==================================================================
    //函数名：ConfirmButtonClick
    //功能：点击确认按钮后执行的事件
    //输入参数：无
    //返回值：无
    //==================================================================

    func ConfirmButtonClick()
    {
        //获取上下文
        let context = CoreDataStack.defaultStack().context
        
        //构建实体对象
        let diary = NSEntityDescription.insertNewObjectForEntityForName("Diartdetail", inManagedObjectContext: context) as! Diartdetail
        
        diary.setValue(timeget(), forKey: "createdate")
        diary.setValue(NewDiaryTitle.text, forKey: "title")
        diary.setValue(NewDiartContent.text, forKey: "content")
        
        CoreDataStack.defaultStack().saveContext()
        let diarytableview = DiaryTableViewController()
        diarytableview.tableView.reloadData()
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    
    
    //==================================================================
    //函数名：timeget()
    //功能：获取当前系统时间
    //输入参数：无
    //返回值：字符串形式当前时间
    //==================================================================
    
    
    func timeget() -> String
    {
        let nowDate = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString:String = formatter.stringFromDate(nowDate)
        //        print(dateString)
        return dateString
        
    }
    
    //==================================================================
    //函数名：touchesBegan
    //功能：（代理实现）按下界面非UIKIT位置时，键盘收起
    //输入参数：系统
    //返回值：无
    //==================================================================
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NewDiaryTitle.resignFirstResponder()
        NewDiartContent.resignFirstResponder()
    }
    
    //==================================================================
    //函数名：didReceiveMemoryWarning
    //功能：内存警告函数
    //输入参数：系统
    //返回值：无
    //==================================================================

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //==================================================================
    //函数名：textViewShouldBeginEditing
    //功能：（代理实现）当日记内容文本框被点击后，提示内容删除，并设置字体颜色为黑色
    //输入参数：无
    //返回值：BOOL
    //==================================================================
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool
    {
        NewDiartContent.text = ""
        NewDiartContent.textColor = UIColor.blackColor()
        
        return true
    }
    
    //==================================================================
    //函数名：textViewShouldEndEditing
    //功能：（代理实现）当日记内容文本框退出选中状态，触发的事件
    //输入参数：系统
    //返回值：BOOL
    //==================================================================
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool
    {
        if NewDiartContent.text == ""
        {
            NewDiartContent.text = "今天的日记内容~"
            NewDiartContent.textColor = UIColor.lightGrayColor()
        }
        return true
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
