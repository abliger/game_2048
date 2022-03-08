import Darwin

/// 操作数组对 当前数组进行合并数字
public func runable(_ t: inout [Int], _ d: D) -> Bool {
    var flag: Bool
    switch d {
    case .L:
        flag = merge(&t)
        flag = move(&t) || flag
    case .R:
        flag = merge(&t)
        var z: [Int] = t.reversed()
        flag = move(&z) || flag
        t = z.reversed()
    }
    return flag
}

/// 合并函数 [4,0,2,2] -> [4,0,4,0] [2,0,0,2]->[4,0,0,0]
public func merge(_ t: inout [Int]) -> Bool {
    var flag = false
    for var i in 0..<t.count - 1 {
        for j in i + 1...t.count - 1 {
            if (t[i] != 0 && t[j] != 0 && t[i] != t[j]) {
                break
            }
            if (t[i] != 0 && t[j] != 0 && t[i] == t[j]) {
                Config.score += t[i]
                t[i] <<= 1
                t[j] = 0
                i += j - i
                flag = true
                break
            }
        }
    }
    return flag
}

/// 数字移动 [4,0,2,2] -> [4,2,2,0] [2,0,0,2]->[2,2,0,0]
public func move(_ t: inout [Int]) -> Bool {
    var flag = false
    for i in 0..<t.count - 1 {
        if (t[i] == 0) {
            for j in i + 1..<t.count {
                if (t[j] != 0) {
                    var temp = t[j]
                    t[j] = t[i]
                    t[i] = temp
                    flag = true
                    break
                }
            }
        }
    }
    return flag
}

func check(_ t: [Int]) -> Bool {
    let temp = t.filter({ $0 != 0 })
    if temp.count < Config.length {
        return false
    }
    for i in 0..<temp.count - 1 {
        if (temp[i] == temp[i + 1]) {
            return false
        }
    }
    print(list, "  \(Config.score)")
    return true
}

/// 从t 为0 的位置随机插入新值
func randomInsert(_ t: inout [Int]) {
    let num = Int.random(in: 0..<100) > 25 ? 2 : 4
    var l = [Int]()
    for i in 0...t.count - 1 {
        if (t[i] == 0) {
            l.append(i)
        }
    }
    t[l[Int.random(in: 0..<l.count)]] = num
}

var list = [Int](repeating: 0, count: Config.length)

randomInsert(&list)
print(list)
while true {
    if let str = readLine()?.uppercased() {
        if let e = D(rawValue: str) {
            if (runable(&list, e)) {
                randomInsert(&list)
            } else {
                print("不能向 \(e) 移动了")
            }

            if (check(list)) {
                print("你输了！")
                exit(0)
            }
            print(list, "  \(Config.score)")
        } else if str == "QUIT" {
            print("退出游戏")
            exit(0)
        }
    }
}