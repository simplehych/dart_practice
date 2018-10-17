import 'package:flutter/material.dart';

void main() {
  print('dart practice start');
  printName(name: "xiaoming", age: 14);
  sayWord("Bob", "Howdy", "smoke signal","like");

  List<int> list = [1, 2, 3, 4, 5];
//  list.replaceRange(1,4,[7,8,9]);
//  list.removeWhere((item){
//    return item ==3;
//  });
//  list.forEach((name){
//
//  });
//  list.shuffle();
  Map<String, int> map = new Map.fromIterable(list,
      key: (item) => item.toString(), value: (item) => item * item);
  Map<String, int> scores = {'Bob': 36};
  for (var key in ['Bob', 'Rohan', 'Sophena']) {
    // 查找指定键，如果不存在就添加
    scores.putIfAbsent(key, () => key.length);
  }
  print(scores.toString());

  List fixedLengthList = new List<int>.filled(3, 0);
  List fixedLengthList1 = new List.from([1, 3, 2]);
  List fixedLengthList2 = new List<int>.generate(4, (int index) {
    return index * index;
  });
  print(fixedLengthList1);
  print(fixedLengthList1.toSet());
  print(fixedLengthList1.toList());
  print(fixedLengthList1.join(","));

  RegExp exp1 = new RegExp(r"(\w+)");
  // 返回正则表达式匹配项的可迭代对象
  print(exp1.allMatches("abc def ghi"));
  // 搜索并返回第一个匹配项，没有则返回null
  print(exp1.firstMatch(""));
  // 正则表达式是否找到匹配项
  print(exp1.hasMatch("as"));
  // 从第几个字符开始匹配正则表达式
  print(exp1.matchAsPrefix("ab cd", 3));
  // 返回正则表达式的第一个匹配字符串
  print(exp1.stringMatch("abc de"));
  // 返回正则表达式的字符串表示
  print(exp1.toString());
  print("exp1---------");

  RegExp exp = new RegExp(r"(\w+)");
  // 返回正则表达式的哈希码
  print(exp.hashCode);
  // 正则表达式是否区分大小写
  print(exp.isCaseSensitive);
  // 正则表达式是否匹配多行
  print(exp.isMultiLine);
  // 返回源正则表达式字符串
  print(exp.pattern);
  // 返回对象运行时的类型
  print(exp.runtimeType);

  print("exp---------");

  StringBuffer xiaomingsaid = new StringBuffer();
  xiaomingsaid.write("All the world's a stage...");
  xiaomingsaid.write("And all the men and women...");
  print(xiaomingsaid);

  String str3 = 'Dartisans';

  print(str3.lastIndexOf(new RegExp(r'a(r|n)')));
  print(str3.indexOf('art'));
  print(str3.indexOf(new RegExp(r'[A-Z][a-z]')));

  print(str3.lastIndexOf('a'));

  String str4 = "resume";
  print(str4.replaceAll(new RegExp(r'e'), 'é'));

  String str2 = "86";
  print(str2.padLeft(4, '1234')); //1234123486
  print(str2.padRight(4, '1234')); //8612341234

  String str1 = 'Dart strings';
  print(str1.contains('D'));
  print(str1.contains(new RegExp(r'[A-Z]')));
  print(str1.contains('D', 1));
  print(str1.contains(new RegExp(r'[A-Z]'), 0));

  String sub = "Dart is fun";
  print(sub.toLowerCase());
  print(sub.toUpperCase());
  print(sub.split(" "));
  String strB = "abba";
  print(strB.split(new RegExp(r"b*")));

  String newSub = sub.substring(0, 4);
  print(newSub);
  print(sub.codeUnitAt(0));
  print(sub.codeUnits);

  String str = "Hello world";
  print(str
      .codeUnits); //UTF-16代码单元列表 [72, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]
  print(str
      .runes); //Unicode代码可迭代对象 [72, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]

  String name = 'XiaoMing say: \n';
  String say = """
  Keep on going ...
  Never give up ...
  Never say die ...
  """;
  name = "xiaoliang say:\n";
  print(name + say);

  int figureA = -93;
  print(figureA.isNegative); //是否是负数 true
  print(figureA.isFinite); //是否有限 true
  print(figureA.isInfinite); //是否无限大 false

  double figureB = 64.742;

  // ceil大于双精度 floor小于双精度 round四舍五入双精度 asFixed保留几位小数的字符串 asPrecision保留几位小数后精确结果的字符串
  //65.0 64.0 65.0 64.74 64.7
  print(
      '${figureB.ceilToDouble()} ${figureB.floorToDouble()} ${figureB.roundToDouble()} ${figureB.toStringAsFixed(2)} ${figureB.toStringAsPrecision(3)}');
  print(figureB.sign); //1.0 符号， -1.0:值小于0，+1.0:值大于0，-0.0/0.0/NaN:值是其本身
  print(figureB.runtimeType); //double 运行时的类型
  print(figureB.hashCode); //22570210674427663 哈希码

  int figureC = 31;
  print(
      '${figureC.compareTo(20)} ${figureC.clamp(20, 25)} ${figureC.toRadixString(16)}');
  print(figureC.isOdd); //true 是否时候奇数
  print(figureC.isEven); //false 是否是偶数
  print(figureC.bitLength); //5 所占存储位

  int figureD = 12;
  print(figureD.gcd(18)); //6 最大公约数
  print(figureD.remainder(18)); //12 截取余数
  print(figureD.toStringAsExponential(3)); //1.200e+1 几次幂值的字符串
}

void printName({String name, int age, String sex: "female"}) {
  print("My name is $name, $age years old, gender $sex.");
}

void sayWord(String from, String msg, [String device, String mood]) {
  String result = "$from say $msg";
  if (device != null) {
    result = "$result with a $device.";
  }
  if (mood != null) {
    result = "$result (int a $mood mood)";
  }
  print(result);
}
