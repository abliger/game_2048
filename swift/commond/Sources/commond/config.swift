//
//  config.swift
//  全局变量
//
//  Created by 冯思学 on 2022/3/6.
//

import Foundation

public enum D:String{
    case R,L
}

public struct Config{
    /// 数组长度 调整此值 显示的列数会跟随变化
    public static var length:Int=10
    /// 数组宽度 调整此值 显示的行数会跟随变化
    public static var width:Int=4
    public static var dimension:Dimension = .dimension
}

public enum Dimension{
    case dimension,two_dimension
}
