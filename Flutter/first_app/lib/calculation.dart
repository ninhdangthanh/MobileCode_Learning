
String s1 = "How are you?\n\n";
String s2 = 'I am fine!';
String s3 = '$s1 - $s2';

int x = 100;
int y = x * 2;

List<int> numbers = [1, 4, 6, 12, 8];

List<String> stringNumbers = numbers.map((e) {
  return 'value = $e';
}).toList();