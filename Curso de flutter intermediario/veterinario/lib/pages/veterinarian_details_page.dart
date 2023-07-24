import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/scheduling_controller.dart';
import '../model/scheduling_model.dart';
import '../model/veterinarian_model.dart';

class VeterinarianDetailsPage extends StatefulWidget {
  final Veterinarian veterinarian;

  const VeterinarianDetailsPage({
    super.key,
    required this.veterinarian,
  });

  @override
  VeterinarianDetailsPageState createState() => VeterinarianDetailsPageState();
}

class VeterinarianDetailsPageState extends State<VeterinarianDetailsPage> {
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    final schedulingController = Provider.of<SchedulingController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF757EFA),
        title: const Text('Detalhes do Veterinário'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                widget.veterinarian.imagePath,
              ),
              radius: 70,
            ),
            const SizedBox(height: 20),
            Text(
              widget.veterinarian.name,
              style: const TextStyle(
                color: Color(0xFF757EFA),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.veterinarian.specialty,
              style: const TextStyle(
                color: Color(0xFF9CA8FB),
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Color(0xFF757EFA),
              ),
              title: const Text('Endereço'),
              subtitle: Text(
                widget.veterinarian.address,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
                color: Color(0xFF757EFA),
              ),
              title: const Text('Telefone'),
              subtitle: Text(
                widget.veterinarian.phoneNumber,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Horários Disponíveis',
              style: TextStyle(
                color: Color(0xFF757EFA),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.veterinarian.availableHours.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  secondary: const Icon(Icons.watch_later_outlined),
                  checkColor: Colors.white,
                  activeColor: const Color(0xFF757EFA),
                  title: Text(widget.veterinarian.availableHours[index]),
                  value:
                      widget.veterinarian.availableHours[index] == selectedTime,
                  onChanged: (bool? value) {
                    setState(
                      () {
                        if (value == true) {
                          selectedTime =
                              widget.veterinarian.availableHours[index];
                        } else {
                          selectedTime = '';
                        }
                      },
                    );
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: selectedTime == ''
                  ? null
                  : () {
                      Scheduling newScheduling = Scheduling(
                        veterinarian: widget.veterinarian,
                        selectedDate: '2023-07-22',
                        selectedTime: selectedTime,
                      );

                      schedulingController.addScheduling(newScheduling);

                      Navigator.pop(context);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF757EFA),
              ),
              child: const Text('Agendar'),
            ),
          ],
        ),
      ),
    );
  }
}
