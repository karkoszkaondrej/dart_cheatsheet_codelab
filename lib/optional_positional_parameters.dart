String joinWithCommas(int a, [int b, int c, int d, int e]) {
  var result = '$a';
  if (b != null) {
    result += ',$b';
  }

  if (c != null) {
    result += ',$c';
  }

  if (d != null) {
    result += ',$d';
  }

  if (e != null) {
    result += ',$e';
  }

  return result;
}