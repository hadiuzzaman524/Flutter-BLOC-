
import 'dart:async';

class BlockController{
 int _value=0;
 StreamController<int> _streamController =StreamController<int>();

 void increment(){
   _value++;
   _streamController.sink.add(_value);
 }

 Stream<int> getStream(){
   return _streamController.stream;
 }
 void dispose(){
   _streamController.close();
 }
}