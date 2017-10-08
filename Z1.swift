// http://swift.sandbox.bluemix.net/#/repl/59da6ee20ed0874491422c73

print("Hello World! :-)");

func printTaskTitle(_ taskNo: Int){
    print("\r\n\r\n");
    print("Task number: \(taskNo)");
	print("======================");
}

// 1
printTaskTitle(1);

var vString = "some string";
var vNumber = 1;
var vReal = 2.1;

print(vString);
print(vNumber);
print(vReal);

// 2
printTaskTitle(2);

let sString :String = "some static string";
let sNumber :Int = 10;
let sReal :Float = 20.1;

print(sString);
print(sNumber);
print(sReal);

// 3
printTaskTitle(3);

let concat1 :String = "\(vString) \(sString)";
print(concat1);
let concat2 :String = vString + " " + sString;
print(concat2);

// 4
printTaskTitle(4);

var arr1 = ["One", "Two"];
print(arr1);

var dict1 = [
  "name": "Mike",
  "tool": "Bike"
];
print(dict1);

// 5
printTaskTitle(5);

arr1.append("Three")
print(arr1);

dict1["size"] = "L";
print(dict1);

// 6
printTaskTitle(6);

var lotto = [
    "29-11-14": [4, 5, 21, 30, 31, 49],
    "27-11-14": [5, 8, 10, 19, 23, 40]
];
print(lotto);

// 7
printTaskTitle(7);

var dict2 = [String:Int]();
print(dict2);

dict2["Test"] = 1;
print(dict2);

// 8
printTaskTitle(8);

var dict3 = [String:Int]();
print(dict3);

for index in 1...10 {
    let key = String(UnicodeScalar(UInt8(64+index)));
    dict3[key] = index;
}
print(dict3);

// 9
printTaskTitle(9);

func printLotto(){
    for day in lotto {
        print("Losowanie dnia \(day.key):");
        for number in day.value {
            print("- \(number)")
        }
    }
}
printLotto();

// 10
printTaskTitle(10);

func gcd(_ d1: Int, _ d2: Int) -> Int {
  if d1 == d2 {
    return d1;
  }
  let min = [d1, d2].min();
  let max = [d1, d2].max();
  return gcd(min!, max!-min!);
}
let theGcd = gcd(1989, 867);
print(theGcd);

// 11
printTaskTitle(11);

func gcdInfo(_ d1: Int, _ d2: Int) -> (gcd: Int, d1Div: Int, d2Div: Int) {
  let gcdNum :Int = gcd(d1, d2);
  return (gcdNum, Int(Float(d1)/Float(gcdNum)), Int(Float(d2)/Float(gcdNum)));
  // return (1, 1, 1);
}
let theGcdInfo = gcdInfo(1989, 867);
print(theGcdInfo.gcd, theGcdInfo.d1Div, theGcdInfo.d2Div);
// print(theGcdInfo);

// 12
printTaskTitle(12);

func cipher(_ input: String, _ transformation: (Character) -> Character) -> String {
  let output = String(input.uppercased().characters.map(transformation));
  return output;
}

let coded = cipher("abcdefghijklmnoprst", {
  (char: Character) -> Character in 
    let dict = ["G":"A", "D":"E", "R":"Y", "P":"O", "L":"U", "K":"I"];
    let replacement :Character = dict[String(char)] != nil ? Character(dict[String(char)]!) : char;
    return replacement;
  });

print("abcdefghijklmnoprst -> ", coded);

// 13
printTaskTitle(13);

let mapper = {(number: Int) -> Int in number % 2};

print([1,2,3,4,5,6,7], " -> ", [1,2,3,4,5,6,7].map(mapper))

// let lotto2 = lotto.mapValues{ value in value.map(mapper) }
print(lotto);

var lotto2 = [String:[Int]]();

for day in lotto {
  lotto2[day.key] = day.value.map(mapper);
}

print(lotto2);

// 14
printTaskTitle(14);

class NamedObject {
  var Name :String = ""

  func describe() -> String {
    return self.Name;
  }
}

let no1 = NamedObject();
print(no1.describe())

// 15
printTaskTitle(15);

import Glibc;

class Sphere: NamedObject {
  var radius :Float = 0

  var volume :Float {
    get {
      return 4 / 3 * Float.pi * pow(self.radius, 3);
    }
    set (newVolume) {
      self.radius = pow( newVolume / 4 * 3 / Float.pi, 1 / 3);
    }
  }

  init(_ name: String, _ radius: Float) {
    super.init();
    self.Name = name;
    self.radius = radius;
  }



  override func describe() -> String {
    return "This is sphere called " + super.describe();
  }
}

let sphere = Sphere("kulka", 10.0);

print(sphere.describe)

print(sphere.volume, sphere.radius)

sphere.volume = 50.0

print(sphere.volume, sphere.radius)

