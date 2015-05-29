// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

println("go")

var b = "abj "


var  str2 = str + b;

let label = "The width is"
let width = 94
let widthLabel = label + String( width)

let apples = 3

let oranges = 5

let appleSummary = "i have\(apples) a"
var shoplist = ["wat", "ftul"]

shoplist[1] = "gag"


let emArr = String[]();

let emDic = Dictionary<String,Int>();
let emDict = [:]

let indi = [73,42, 103,87,12]

var temSouc = 0


for sco in indi
{
    if sco > 50
    {
        temSouc += 3
    }
    else
    {
        temSouc += 1
    }
}

temSouc


let vegeta = "red paper"

switch vegeta
{
    case "ce":
    let v = "g"
case let x where x.hasPrefix("red"):
    let v = "fuck"
default :
    let v = "test"
}

let interNum =
[
    "price ":[2,3]
]


  func greet (name :String,day : String) -> String
{
    return "hello \(name),today is \(day)"
}

greet("bod", "tused")


func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()

let a = 1

let 哈哈 = "fcuk"
/*
NSlo/*g("aa")*/
*/
let maxV = UInt8.max
let minv = Int32.min;

let pad = 00000001.2

let fc = 1_000_000_000.11000

let can:UInt8 = 1

let ab = 1
let ac = 0.32

let ad = Double( ab) + ac;

let http = (a:404,b:"no found")


let (stcode ,stasMess) = http

println("\(http.a)")

let pos = "123"
//let cov = pos.toInt()?

if let fu1 = pos.toInt()
{
    println("gou\(fu1)")
}
else
{
    println("erro")
}


let possibleString: String? = "An optional string."
println(possibleString!)


let assumedString: String! = "An implicitly unwrapped optional string."
println(assumedString)

let age = -3


var a3 = 0
let b3 = ++a3 // a 和 b 现在都是 1
let c3 = a3++

a3

let someString = "some\0a a\\a a\t a\n a\ra\'a'"


var emStri = "王超sdddddd![]";

for chac in emStri
{
    println(chac)
}

let test:Character = "1"



println ("\(countElements(emStri))")

println ("\(emStri.utf16count)")

var inst = "look over"
inst += "good moni"



let quta = "women love fuck"
let Bquta = "women love fuck"

if quta == Bquta
{
    println(" the same")
}

var shoLIst:String[] = ["a","b"]

if !shoLIst.isEmpty
{
    println("\(shoLIst.count)")
}

shoLIst.append("c");

shoLIst += "d"


    println("\(shoLIst.count)")

shoLIst[2] = "z"

shoLIst[3..4] = ["H","i"]

shoLIst.insert("x",atIndex:2);

for(index,value) in enumerate(shoLIst)
{
    println("\(index) :\(value)");
}

var airport:Dictionary<String,String> = ["k1":"v1","k2":"v2","k3":"v3"]


if let oldv = airport.updateValue("fuc", forKey:"k3")
{
    println("\(oldv)")
}
else
{
    println("null")
}

var nam = Dictionary<Int,String>()


 nam[15] = "ss"
 nam = [:]

 let base = 3

let power = 10

var ans = 1

for _ in 1...power
{
    ans *= base
}

println("\(ans)")
 
for chac  in "helloa"
{
    println("\(chac)")
}

var baora = Int[](count:4,repeatedValue:0)

var num:Double

for i in 0...200
{
    num = cos(Double(i)/10)
}




































