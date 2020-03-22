//
//  BridgeViewController.swift
//  DesignPatternImpApp
//
//  Created by SMIT iMac27 on 11/03/20.
//  Copyright © 2020 SMIT iMac27. All rights reserved.
//

import UIKit
import Foundation

class BridgeViewController: UIViewController {
// Bridge pattern is good for run time binding of implementation
    var openGLApi:OpenGLAPI = OpenGLAPI()
    var openDirectApi : DirectXAPI = DirectXAPI()
   
    override func viewDidLoad() {
        super.viewDidLoad()
         var circle:Circle = Circle(10, 10, 20, openGLApi)
        circle.draw()
        circle = Circle(20, 20, 20, openDirectApi)
        circle.draw()
        var rect : Rectangle = Rectangle(15, 15, 30, 30, openGLApi)
        rect.draw()
        rect = Rectangle(30, 30, 100, 200, openDirectApi)
        
         rect.draw()
       
    }
    


}

// Implement Bridge Design Pattern
public class Shape{
    let graphicAPI: GraphicsAPI
    init(_ graphicsApi:GraphicsAPI) {
        self.graphicAPI = graphicsApi
    }
    func draw() -> Void {
        
    }
}
public class Circle : Shape{
    var x: Int = 0
    var y: Int = 0
    var radius: Int = 0
    convenience init(_ x: Int, _ y: Int, _ radius: Int, _ graphicsApi: GraphicsAPI){
        self.init(graphicsApi)
        self.x = x
        self.y = y
        self.radius = radius
    }
    override func draw() -> Void{
        self.graphicAPI.drawCircle(self.x, self.y, self.radius)
    }
    
}
public class Rectangle: Shape {
    var x: Int = 0
    var y: Int = 0
    var width: Int = 0
    var height: Int = 0
    convenience init(_ x: Int, _ y: Int, _ width: Int, _ height: Int, _ graphicsApi: GraphicsAPI) {
        self.init(graphicsApi)
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        
    }
    override func draw() -> Void {
        self.graphicAPI.drawRectangle(x, y, width, height)
    }
    
}
//In above code, all abstraction classes written. Now implementor classes need to be implemented based on business logic/implementation choice.

//Protocol
protocol GraphicsAPI {
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int)
    func drawCircle(_ x: Int,_ y:Int, _ radius: Int)
}
class DirectXAPI: GraphicsAPI {
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int) {
        
        print("circle draw by DirectXAPI API")
    }
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        
      
         print("rectangle draw by DirectXAPI API")
    }
}
class OpenGLAPI: GraphicsAPI {
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
          print("circle draw by OpenGLAPI API")
    }
    
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int) {
          print("circle draw by OpenGLAPI API")
    }
    
    
}
