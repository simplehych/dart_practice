import 'dart:math';

import 'mystorage.dart';

void main() {
  var rectangle = new Rectangle(3, 4, 20, 15);
  print(rectangle.left);
  rectangle.right = 12;
  print(rectangle.left);

  printPi();
  printUtil();

  List list = [1, 2, 3];
  list.forEach(printElement);

  var loudify = (String msg) => "!!! ${msg.toUpperCase()} !!!";
  print(loudify("hello"));

  Function makeAdder2 = makeAdder(2);
  print(makeAdder2(3));

  var x, yy;
  yy = 0;
  assert(yy == 0);
  //比较高阶函数
  x = foo;
  print(foo == x);

  //比较静态方法
  x = SomeClass.bar;
  print(SomeClass.bar == x);

  //比较实例方法
  var v = new SomeClass();
  var w = new SomeClass();
  var y = w;
  x = w.baz;
  print(y.baz == x);
  print(v.baz != w.baz);
}

printElement(element) {
  print(element);
}

Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

foo() {}

class SomeClass {
  static void bar() {}

  void baz() {}
}

class Person {
  Person.fromJson() {
    print("in Person");
  }
}

class Employee extends Person {
  Employee.fromJson(Map data) : super.fromJson() {
    print("in Employee");
  }
}

class Point {
  int x;
  int y;

  Point(this.x, this.y);

  Point.alongXAxis(int x) : this(x, 0);

  Point.fromJson(Map jsonMap)
      : x = jsonMap['x'],
        y = jsonMap['y'] {
    print("In Point.fromJson(): ($x, $y)");
  }
}

class ImmutablePoint {
  final int x;
  final int y;

  const ImmutablePoint(this.x, this.y);

  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
}

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}

class Rectangle {
  int left;
  int top;
  int width;
  int height;

  Rectangle(this.left, this.top, this.width, this.height);

  int get right => left + width;

  set right(int value) => left = value - width;
}

enum Color { red, green, blue }

class Musician extends Person with Musical {
  Musician() : super.fromJson() {
    canCompose = true;
    entertainMe();
  }
}

abstract class Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }

    var command = 'CLOSED';
    switch (command) {
      case 'CLOSED':
        executeClosed();
        continue nowClosed;

      nowClosed:
      case 'NOW_CLOSED':
        executeNowClosed();
        break;
    }
  }

  void executeNowClosed() {}

  void executeClosed() {}
}
