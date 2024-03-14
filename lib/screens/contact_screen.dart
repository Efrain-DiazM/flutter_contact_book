import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taller_manejo_getx/controllers/contact_controller.dart';
import 'package:taller_manejo_getx/models/contact.dart';

class ContactScreen extends StatelessWidget{
  ContactScreen({super.key});

  final ContactController contactController = Get.put(ContactController());
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactLastNameController = TextEditingController();
  final TextEditingController _contactPhoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('My contact book'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: contactController.contacts.length,
                  itemBuilder: (context, index) {
                    Contact contact = contactController.contacts[index];
                    return ListTile(
                      title: Text(contact.name + contact.lastName),
                      subtitle: Text(contact.phoneNumber),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          contactController.removeContact(index);
                        },
                      ),
                    );
                  },
                )
              ),
            ),
            FloatingActionButton(
              onPressed: () async {
                final newContact = await showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: Text('New contact'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: 'Name'),
                          controller: _contactNameController,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Last Name'),
                          controller: _contactLastNameController,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Phone Number'),
                          keyboardType: TextInputType.phone,
                          controller: _contactPhoneNumberController,
                        ),
                      ],
                    ),
                    actions: <Widget> [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        }, 
                        child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            final String name = _contactNameController.text.trim();
                            final String lastName = _contactLastNameController.text.trim();
                            final String phoneNumber = _contactPhoneNumberController.text.trim();

                            if (name.isNotEmpty && lastName.isNotEmpty && phoneNumber.isNotEmpty) {
                              contactController.addContact(name, lastName, phoneNumber);
                              Get.back();
                            } else {
                              Get.snackbar('Error', 'Por favor, completa todos los campos.');
                            }
                          }, 
                          child: Text('Add')
                        )
                    ],
                  )
                  );
                  if (newContact != null){
                    contactController.addContact(newContact.name, newContact.lastName, newContact.phoneNumber);
                  }
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}