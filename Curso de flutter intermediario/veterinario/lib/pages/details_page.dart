import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/scheduling_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final schedulingController = Provider.of<SchedulingController>(context);
    final confirmedAppointments = schedulingController.confirmedAppointments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas Agendadas'),
        backgroundColor: const Color(0xFF757EFA),
      ),
      body: confirmedAppointments.isEmpty
          ? const Center(child: Text('Nenhuma consulta agendada.'))
          : ListView.builder(
              itemCount: confirmedAppointments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      confirmedAppointments[index].veterinarian.imagePath,
                    ),
                    radius: 30,
                  ),
                  title: Text(
                    confirmedAppointments[index].veterinarian.name,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Data: ${confirmedAppointments[index].selectedDate}'),
                      Text(
                          'Horário: ${confirmedAppointments[index].selectedTime}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Cancelar Consulta'),
                            content: const Text(
                                'Você tem certeza que deseja cancelar esta consulta?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Sim'),
                                onPressed: () {
                                  schedulingController.cancelAppointment(index);
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Não'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
