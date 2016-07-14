//
//  DiaryTableViewController.swift
//  mydiary
//
//  Created by power on 16/5/22.
//  Copyright © 2016年 power. All rights reserved.
//

import UIKit

import CoreData

class DiaryTableViewController: UITableViewController
{

/***************函数声明区********************/
    
    
    lazy var documentsPath:String = {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths.first!}()                                     //本程序目录位置
    
/***************函数声明区********************/
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

// Uncomment the following line to preserve selection between presentations
// self.clearsSelectionOnViewWillAppear = false

// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
// self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        self.navigationController?.navigationBar.barTintColor = UIColor.greenColor()
        
        let addNewDiaryButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(DiaryTableViewController.addNewDiaryButton))
        
        self.navigationItem.rightBarButtonItem = addNewDiaryButton
        
//        tableView.dataSource = self
//        tableView.delegate = self
        tableView.reloadData()
//        print(documentsPath)
//        tableView.editing = true
//        addnewdiary(timeget(), title: "test", content: "this is a test!!!")
//        CoreDataStack.defaultStack().saveContext()
//        getdiarydetail()
//        updatediarydata()
        
    }
//==================================================================
//函数名：addNewDiaryButton
//功能：点击添加按钮，增加新的日记内容
//输入参数：无
//返回值：无
//==================================================================
    func addNewDiaryButton()
    {
        let AddNewDiaryView = AddNewDiaryViewController()
        
        self.navigationController?.pushViewController(AddNewDiaryView, animated: true)
    }
    
//==================================================================
//函数名：updatediarydata
//功能：从coredata中读取表，更新当前日记状态，包括日记数量
//输入参数：无
//返回值：无
//==================================================================
    
    func updatediarydata()
    {
//        let context = CoreDataStack.defaultStack().context              //获取上下文
//        let request = NSFetchRequest(entityName: "Diartdetail")         //构建抓取请求，名字为“Diartdetail”表
//        
//        do
//        {
//            let details = (try context.executeFetchRequest(request)) as! [Diartdetail]      //读取每一个coredata数据
//        }
//        catch
//        {
//            print("Fetch failed...")
//        }
    }

//==================================================================
//函数名：getdiaryquantity
//功能：获取当前一共多少行数据
//输入参数：无
//返回值：数据行数
//==================================================================

    
    func getdiaryquantity() -> Int
    {
        let context = CoreDataStack.defaultStack().context              //获取上下文
        let request = NSFetchRequest(entityName: "Diartdetail")         //构建抓取请求，名字为“Diartdetail”表
        
        do
        {
            let details = (try context.executeFetchRequest(request)) as! [Diartdetail]      //读取每一个coredata数据
            return details.count
        }
        catch
        {
            print("Fetch failed...")
            return 0
        }
    }
   
//==================================================================
//函数名：addnewdiary
//功能：添加新的日记
//输入参数：time:String,title:String,content:String   时间，标题，内容
//返回值：无
//==================================================================
    
    func addnewdiary(time:String,title:String,content:String)
    {
        //获取上下文
        let context = CoreDataStack.defaultStack().context
        
        //构建实体对象
        let diary = NSEntityDescription.insertNewObjectForEntityForName("Diartdetail", inManagedObjectContext: context) as! Diartdetail
        
        diary.setValue(time, forKey: "createdate")
        diary.setValue(title, forKey: "title")
        diary.setValue(content, forKey: "content")
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
//函数名：readdiarydetail()
//功能：读取coredata所有数据，打印出来（仅适用在测试模式）
//输入参数：无
//返回值：无
//==================================================================
    
    func readdiarydetail()
    {
        //获取上下文
        let context = CoreDataStack.defaultStack().context
        
        //构建抓取请求
        let request = NSFetchRequest(entityName: "Diartdetail")
        
        do
        {
            let details = (try context.executeFetchRequest(request)) as! [Diartdetail]
            for Diartdetail in details
            {
                print("\(Diartdetail.createdate!), \(Diartdetail.title!), \(Diartdetail.content!)")
            }
        }
        catch
        {
            print("Fetch failed...")
        }
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
//==================================================================
//函数名：numberOfSectionsInTableView()
//功能：整个tableview中有几个分区
//输入参数：自动
//返回值：自动
//==================================================================

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
//==================================================================
//函数名：tableView(tableView: UITableView, numberOfRowsInSection section: Int)
//功能：设置tableview中每个分区多少行数据
//输入参数：自动
//返回值：自动
//==================================================================

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return getdiaryquantity()
    }

//==================================================================
//函数名：tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
//功能：设置每个tableview的cell中的显示内容
//输入参数：自动
//返回值：自动
//==================================================================

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: "cellid")
        let context = CoreDataStack.defaultStack().context              //获取上下文
        let request = NSFetchRequest(entityName: "Diartdetail")         //构建抓取请求
        do
        {
            let details:Array = (try context.executeFetchRequest(request)) as! [Diartdetail]
            cell.textLabel?.text = details[indexPath.row].title
        }
        catch
        {
            print("Fetch failed...")
        }
//        cell.textLabel?.text = diarydataArray![indexPath.row]
        
        return cell
    }
    
    
//==================================================================
//函数名：tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//功能：设置一行被点击后触发的事件
//输入参数：自动
//返回值：自动
//==================================================================

    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let diarydetailView = DiarydetailViewController()
        
        diarydetailView.indexrow = indexPath.row
        self.navigationController?.pushViewController(diarydetailView, animated: true)
    }
    
//==================================================================
//函数名：tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle
//功能：
//输入参数：自动
//返回值：自动
//==================================================================

    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle
    {
        return UITableViewCellEditingStyle.Delete
    }
    
//==================================================================
//函数名：tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
//功能：
//输入参数：自动
//返回值：自动
//==================================================================

    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
//        diarydataArray?.removeAtIndex(indexPath.row)
//        tableView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
