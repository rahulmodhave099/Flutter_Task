class Demo{
  final String fname;
  final String lname;
  final double age;
  final int mobile;

  Demo({
    required this.fname,
    required this.lname,
    required this.age,
    required this.mobile,
  });

  Map<String,dynamic> demoMap(){
    return {"fname" : fname , "lname" : lname , "age" : age , "mobile" : mobile};
  }
}