import 'package:get/get.dart';
import 'package:taller_manejo_getx/models/contact.dart';

class ContactController extends GetxController{
  var contacts = <Contact>[].obs;

  void addContact(String name, String lastName, String phoneNumber){
    contacts.add(Contact(name: name, lastName: lastName, phoneNumber: phoneNumber));
  }

  void removeContact(int index){
    contacts.removeAt(index);
  }
}