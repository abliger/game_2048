import Darwin
/// 操作数组对 当前数组进行合并数字
public func runable(_ t:inout [Int],_ d: D){
    switch d{
    case .L:
        merge(&t)
        move(&t)
    case .R:
        var z:[Int]=t.reversed()
        merge(&z)
        move(&z)
        t=z.reversed()
    }
}
/// 合并函数 [4,0,2,2] -> [4,0,4,0] [2,0,0,2]->[4,0,0,0]
public func merge(_ t:inout [Int]){
    for var i in 0 ..< t.count - 1 {
        for j in i+1 ... t.count - 1 {
            if(t[i] != 0 && t[j] != 0 && t[i] != t[j]){
                break
            }
            if(t[i] != 0 && t[j] != 0 && t[i]==t[j]){
                    t[i]<<=1
                    t[j]=0
                    i+=j-i
                break
            }
        }
    }
}

/// 数字移动 [4,0,2,2] -> [4,2,2,0] [2,0,0,2]->[2,2,0,0]
public func move(_ t:inout [Int]){
    var arr=[Int](repeating: 0, count: t.count)
    var num=0
    for i in 0 ..< t.count{
        if(t[i] != 0){
            arr[num]=t[i]
            num+=1
        }
    }
    t=arr
}

func check(_ t:[Int])-> Bool{
    for i in 0 ..< t.count - 1{
        if(t[i]==t[i+1]){
            return false
        }
    }
    return true
}

func randomInsert(_ t:inout [Int]){
    let num=Int.random(in: 0..<100) > 25 ? 2:4
    var l=[Int]()
    for i in 0 ... t.count - 1{
        if(t[i]==0){
            l.append(i)
        }
    }
    t[l[Int.random(in: 0..<l.count)]]=num
}

var list=[Int](repeating: 0, count: Config.length)

randomInsert(&list)
print(list)
while true{
    if let str = readLine()?.uppercased() {
        if let e = D(rawValue: str){
            runable(&list,e)
            randomInsert(&list)
            print(list)
            if(check(list)){
                exit(0)
            }
        }else if str == "QUIT"{
            exit(0)
        }
    }
}
