//
//  EXIFloorPlanView.swift
//  DemoBezierPath
//
//  Created by Rajeshnath Chyarngayil Vishwanath on 1/30/17.
//  Copyright © 2017 Rajeshnath Chyarngayil Vishwanath. All rights reserved.
//

import UIKit


fileprivate let lineWidth: CGFloat = 2.0
fileprivate let fontSize: CGFloat = 16.0
fileprivate let FloorPlanBezierPath: String = "FloorPlanBezierPath"
fileprivate let FloorPlanString: String = "FloorPlanString"
fileprivate let strokeColor = UIColor.cyan

enum FloorSpace: String {
    case entrance = "Entrance"
    case groudFloor = "GroundFloor"
    case firstWorkStation = "Work Station 1"
    case secondWorkStation = "Work Station 2"
    case pantry = "Pantry"
    case hrRoom = "HR Room"
    case restRoom = "Rest Room"
}


class EXIFloorPlanView: UIView {
    
    var floorPlanFeatures: [[String:Any]] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        drawEntrance()
        drawGroundFloorSpace()
        drawFirstWorkSpace()
        drawSecondWorkSpace()
        drawRestRoomFloorSpace()
        drawHRRoomFloorSpace()
        drawPantryFloorSpace()
        addAccessibility()
    }
    
    var viewHeight: CGFloat {
        return self.frame.size.height
    }
    
    var viewWidth: CGFloat {
        return self.frame.size.width
    }
    
    //Draw First Work Space
    
    func drawGroundFloorSpace() {
        
        var groundFloorSpaceBezierPath = UIBezierPath()
        groundFloorSpaceBezierPath.lineWidth = lineWidth
        //let strokeColor = UIColor.cyan
        
        groundFloorSpaceBezierPath.move(to: CGPoint(x: 40, y: 70.0))
        groundFloorSpaceBezierPath.addLine(to: CGPoint(x: viewWidth-40, y: 70.0))
        groundFloorSpaceBezierPath.addLine(to: CGPoint(x: viewWidth-40, y: viewHeight-20))
        groundFloorSpaceBezierPath.addLine(to: CGPoint(x: 40.0, y: viewHeight-20))
        groundFloorSpaceBezierPath.close()
        
        strokeColor.setStroke()
        groundFloorSpaceBezierPath.stroke()
        
        let floorName: String = FloorSpace.groudFloor.rawValue
        
        addAttributedStringFor(bezierPath: &groundFloorSpaceBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:groundFloorSpaceBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    //Draw Second Work Space
    
    func drawFirstWorkSpace() {
        
        var firstWorkSpaceBezierPath = UIBezierPath()
        firstWorkSpaceBezierPath.lineWidth = lineWidth
        //let strokeColor = UIColor.cyan
        
        firstWorkSpaceBezierPath.move(to: CGPoint(x: (viewWidth/2)+130, y: 140.0))
        firstWorkSpaceBezierPath.addLine(to: CGPoint(x: (viewWidth/2)-90, y: 140.0))
        firstWorkSpaceBezierPath.addLine(to: CGPoint(x: (viewWidth/2)-90, y: viewHeight-40))
        firstWorkSpaceBezierPath.addLine(to: CGPoint(x: (viewWidth/2)+130, y: viewHeight-40))
        firstWorkSpaceBezierPath.close()
        
        strokeColor.setStroke()
        firstWorkSpaceBezierPath.stroke()
        
        let floorName: String = FloorSpace.firstWorkStation.rawValue
        
        addAttributedStringFor(bezierPath: &firstWorkSpaceBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:firstWorkSpaceBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    //Draw Second Work Space
    
    func drawSecondWorkSpace() {
        
        var secondWorkSpaceBezierPath = UIBezierPath()
        secondWorkSpaceBezierPath.lineWidth = lineWidth
        //let strokeColor = UIColor.cyan
        
        secondWorkSpaceBezierPath.move(to: CGPoint(x: 40, y: 70.0))
        secondWorkSpaceBezierPath.addLine(to: CGPoint(x: (viewWidth/2)-160, y: 70.0))
        secondWorkSpaceBezierPath.addLine(to: CGPoint(x: (viewWidth/2)-160, y: viewHeight-20))
        secondWorkSpaceBezierPath.addLine(to: CGPoint(x: 40.0, y: viewHeight-20))
        secondWorkSpaceBezierPath.close()
        
        strokeColor.setStroke()
        secondWorkSpaceBezierPath.stroke()
        
        let floorName: String = FloorSpace.secondWorkStation.rawValue
        
        addAttributedStringFor(bezierPath: &secondWorkSpaceBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:secondWorkSpaceBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    //Draw Pantry floor space
    
    func drawPantryFloorSpace() {
        
        var pantryBezierPath = UIBezierPath()
        pantryBezierPath.lineWidth = lineWidth
        //let strokeColor = UIColor.cyan
        
        pantryBezierPath.move(to: CGPoint(x: viewWidth-40, y: viewHeight-60))
        pantryBezierPath.addLine(to: CGPoint(x: viewWidth-180, y: viewHeight-60))
        pantryBezierPath.addLine(to: CGPoint(x: viewWidth-180, y: viewHeight-20))
        pantryBezierPath.addLine(to: CGPoint(x: viewWidth-40, y: viewHeight-20))
        pantryBezierPath.close()
        strokeColor.setStroke()
        pantryBezierPath.stroke()
        
        let floorName: String = FloorSpace.pantry.rawValue
        addAttributedStringFor(bezierPath: &pantryBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:pantryBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    //Draw RestRoom floor space
    
    func drawRestRoomFloorSpace() {
        
        var restRoomBezierPath = UIBezierPath()
        restRoomBezierPath.lineWidth = lineWidth
        //let strokeColor = UIColor.cyan
        
        restRoomBezierPath.move(to: CGPoint(x: viewWidth-40, y: 70))
        restRoomBezierPath.addLine(to: CGPoint(x: viewWidth-180, y: 70))
        restRoomBezierPath.addLine(to: CGPoint(x: viewWidth-180, y: viewHeight-300))
        restRoomBezierPath.addLine(to: CGPoint(x: viewWidth-40, y: viewHeight-300))
        restRoomBezierPath.close()
        strokeColor.setStroke()
        restRoomBezierPath.stroke()
        
        let floorName: String = FloorSpace.restRoom.rawValue
        addAttributedStringFor(bezierPath: &restRoomBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:restRoomBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    //Draw HR floor space
    
    func drawHRRoomFloorSpace() {
        
        var HrRoomBezierPath = UIBezierPath()
        HrRoomBezierPath.lineWidth = lineWidth
        //let strokeColor = UIColor.cyan
        
        HrRoomBezierPath.move(to: CGPoint(x: viewWidth-40, y: (viewHeight/2)-50))
        HrRoomBezierPath.addLine(to: CGPoint(x: viewWidth-180, y: (viewHeight/2)-50))
        HrRoomBezierPath.addLine(to: CGPoint(x: viewWidth-180, y: (viewHeight/2)+50))
        HrRoomBezierPath.addLine(to: CGPoint(x: viewWidth-40, y: (viewHeight/2)+50))
        HrRoomBezierPath.close()
        strokeColor.setStroke()
        HrRoomBezierPath.stroke()
        
        let floorName: String = FloorSpace.hrRoom.rawValue
        addAttributedStringFor(bezierPath: &HrRoomBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:HrRoomBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    
    // Draw entrance
    
    func drawEntrance() {
        
        var entranceBezierPath = UIBezierPath()
        entranceBezierPath.lineWidth = lineWidth
        //let strokeColor = UIColor.cyan
        
        entranceBezierPath.move(to: CGPoint(x: viewWidth/2-50 , y: 70.0))
        entranceBezierPath.addLine(to: CGPoint(x: viewWidth/2-50, y: 30.0))
        entranceBezierPath.addLine(to: CGPoint(x: viewWidth/2+50, y: 30.0))
        entranceBezierPath.addLine(to: CGPoint(x: viewWidth/2+50, y: 70.0))
        entranceBezierPath.close()
        strokeColor.setStroke()
        entranceBezierPath.stroke()
        
        let floorName: String = FloorSpace.entrance.rawValue
        addAttributedStringFor(bezierPath: &entranceBezierPath, withString: floorName)
        
        let floorPlanFeature = [FloorPlanBezierPath:entranceBezierPath,FloorPlanString:floorName] as [String : Any]
        floorPlanFeatures.append(floorPlanFeature)
        
    }
    
    // Add attributed strings to the Bezier paths drawn
    
    func addAttributedStringFor(bezierPath: inout UIBezierPath , withString stringValue :String) {
        
        let floorPlanFeatureAttributedString = NSAttributedString(string: stringValue, attributes: [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 15.0),NSForegroundColorAttributeName: UIColor.black])
        
        if stringValue == FloorSpace.groudFloor.rawValue {
            floorPlanFeatureAttributedString.draw(at:
                CGPoint(x: bezierPath.bounds.midX-floorPlanFeatureAttributedString.size().width * 0.5, y: bezierPath.bounds.midY-floorPlanFeatureAttributedString.size().height * 7.5))
        } else {
            
            floorPlanFeatureAttributedString.draw(at:
                CGPoint(x: bezierPath.bounds.midX-floorPlanFeatureAttributedString.size().width * 0.5, y: bezierPath.bounds.midY-floorPlanFeatureAttributedString.size().height * 0.5))
        }
    }
    
    // Adding accessibility to the bezier path elements
    
    func addAccessibility() {
        
        self.accessibilityElements = []
        
        for element in floorPlanFeatures {
            
            let acessibilityElement = UIAccessibilityElement(accessibilityContainer: self)
            acessibilityElement.accessibilityPath = UIAccessibilityConvertPathToScreenCoordinates(element[FloorPlanBezierPath] as! UIBezierPath, self)
            acessibilityElement.accessibilityLabel = element[FloorPlanString] as! String?
            self.accessibilityElements?.append(acessibilityElement)
        }
    }
    
}
