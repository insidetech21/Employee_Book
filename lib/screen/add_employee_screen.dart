import 'package:employee_book/widget/custom_date_picker_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widget/custom_text_form_field.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  DateTime? _dateOfBirth; // for selected date as it is


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){

            //TODO


          },
              icon: const Icon(Icons.save_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormField(controller: _userNameController, txtLabel: 'User Name',),
            const SizedBox(height: 8.0,),

            CustomTextFormField(controller: _firstNameController, txtLabel: 'First Name',),
            const SizedBox(height: 8.0,),

            CustomTextFormField(controller: _lastNameController, txtLabel: 'Last Name',),
            const SizedBox(height: 8.0,),
            
            CustomDatePickerFromField(controller: _dateOfBirthController, txtLabel: 'Date Of Birth', callback: (){

              pickDateOfBirth(context);

            }),

            // TextFormField(
            //   controller: _dateOfBirthController ,
            //   keyboardType: TextInputType.name,
            //   decoration: const InputDecoration(
            //   border: OutlineInputBorder(),
            //   label: Text('Date Of Birth'),
            // ),
            // validator: (value)
            // {
            // if(value == null || value.isEmpty)
            // {
            // return 'Date of birth name cannot be empty';
            // }
            // return null;
            // },
            //
            //   onTap: () => pickDateOfBirth(context),
            // ),
            const SizedBox(height: 8.0,),
            // TextFormField(
            //   controller: _controller ,
            //   keyboardType: TextInputType.name,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     label: Text('User Name'),
            //   ),
            //   validator: (value)
            //   {
            //     if(value == null || value.isEmpty)
            //     {
            //       return 'User name cannot be empty';
            //     }
            //     return null;
            //   },
            // ),
            
          ],
        ),
      ),
    );
  }

  Future <void> pickDateOfBirth(BuildContext context) async{

    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _dateOfBirth ?? initialDate, // for selected date as it is
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),

        builder: (context,child) => Theme(
            data: ThemeData().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.yellow,
                onPrimary: Colors.pink,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ?? const Text(''),
        )
    );

    if(newDate == null)
    {
      return;
    }

    setState(() {

      _dateOfBirth = newDate; // for selected date as it is
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      //_dateOfBirthController.text = newDate.toIso8601String();
      _dateOfBirthController.text = dob;
    });
  }
}

