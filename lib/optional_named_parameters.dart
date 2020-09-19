class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });

// Add your copyWith method here:
  MyDataObject copyWith({String newString, double newDouble, int newInt}) {
    return MyDataObject(aString: newString ?? aString,
        aDouble: newDouble ?? aDouble,
        anInt: newInt ?? anInt
    );
  }
}
