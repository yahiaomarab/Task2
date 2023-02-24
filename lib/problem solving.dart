import 'dart:io';
import 'dart:math';

main()
{
//  try {
//     calcRootsEqu(1, 23, 323);
//   }
//   catch(e)
//   {
//     print(e);
//   }

  calcMeanAvaOfArray();
}
void  calcRootsEqu(var a,var b,var c)
{
  dynamic root1,root2;
  root1=(-b+sqrt((b*b)-4*a*c))/2*a;
  root2=(b+sqrt((b*b)-4*a*c))/2*a;
  print('root 1 is : $root1 \n root 2 is : $root2');
}
void calcMeanAvaOfArray()
{
  for (int j=0;j<10;j--)
  {
    print('enter the number of array');
    int NumOfLength=int.parse(stdin.readLineSync()!);
    print('enter the list numbers');
    String values=stdin.readLineSync()!;
    List<String> numbers=values.split(' ');
    List lst=numbers.map(int.parse).toList();
    dynamic sum=0;
    for(int i=0;i<lst.length;i++)
    {
      sum+=lst[i];
    }
    if(NumOfLength==lst.length)
    {
      print('the Avarage is : ${sum / NumOfLength}');
      break;
    }
    else
      print('enter indecated number');
  }
}