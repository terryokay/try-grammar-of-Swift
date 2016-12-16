//
//  ViewController.swift
//  Swift中的错误处理知识点
//
//  Created by terrylee on 2016/12/13.
//  Copyright © 2016年 terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonString = "{\"name\" :  \"zhang\" ]"
        let data = jsonString.data(using: .utf8)
        
        //反序列化 throw 抛出异常
        //方法一: 推荐try? ,如果解析成功,就有值, 否则,为nil
        let json = try? JSONSerialization.jsonObject(with: data!, options: [])
        
        print(json)
        
        //方法二: 强烈不推荐 try! ,如果解析成功,就有值,否则就崩溃, 有风险
        let json2 = try! JSONSerialization.jsonObject(with: data!, options: [])
        
        print(json2)
        
        //方法三: 处理异常 , 能够接收到错误, 并且输出错误
        //但是,语法结构复杂,而且,{}里面的智能提示很不友好
        //扩展: OC中有人用 try catch 吗? 为什么? 
        //ARC开发,编译器自动 retain/ release/ autorelease
        //如果用 try catch 一旦不平衡, 就会出现内存泄漏!
        do{
            
            let json3 = try JSONSerialization.jsonObject(with: data!, options: [])
            
            print(json3)
            
        }catch{
            
            print(error)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

