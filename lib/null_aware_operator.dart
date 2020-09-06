String foo = 'a string';
String bar; // Unassigned objects are null by default.

// Substitute an operator that makes 'a string' be assigned to baz.
String baz = foo ??= bar;

void updateSomeVars() {
  // Substitute an operator that makes 'a string' be assigned to bar.
  bar ??= 'a string';
}
