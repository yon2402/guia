
// Importa el paquete de material design de Flutter para poder usar sus widgets.
import 'package:flutter/material.dart';

// La función principal que se ejecuta al iniciar la aplicación.
void main() => runApp(
      // runApp infla el widget dado y lo adjunta a la pantalla.
      const MaterialApp(
        // MaterialApp es un widget que envuelve varias aplicaciones que siguen los principios de Material Design.
        home:
            PeopleCounter(), // Establece el widget PeopleCounter como la ruta principal (la pantalla de inicio).
      ),
    );

// Define una nueva clase de widget con estado llamada PeopleCounter.
class PeopleCounter extends StatefulWidget {
  const PeopleCounter({super.key});
  // Sobrescribe el método createState para crear el estado mutable para este widget.
  @override
  State<PeopleCounter> createState() => _PeopleCounterState();
}

// La clase de estado para el widget PeopleCounter.
class _PeopleCounterState extends State<PeopleCounter> {
  // Declara una lista final de strings para almacenar los nombres de las personas. `final` significa que la lista en sí no puede ser reasignada, pero su contenido puede cambiar.
  final List<String> _people = [];
  // Declara un controlador de texto final para manejar la entrada del campo de texto.
  final TextEditingController _nameController = TextEditingController();

  // Un método para agregar una nueva persona a la lista.
  void _addPerson() {
    // Verifica si el campo de texto no está vacío.
    if (_nameController.text.isNotEmpty) {
      // Llama a setState para notificar a Flutter que el estado del widget ha cambiado y que necesita ser reconstruido.
      setState(() {
        // Agrega el texto del controlador de texto a la lista de personas.
        _people.add(_nameController.text);
        // Limpia el campo de texto después de agregar el nombre.
        _nameController.clear();
      });
    }
  }

  // Sobrescribe el método build, que describe la parte de la interfaz de usuario representada por este widget.
  @override
  Widget build(BuildContext context) {
    // Devuelve un widget Scaffold, que proporciona una estructura visual básica de Material Design.
    return Scaffold(
      // La barra de aplicación que se muestra en la parte superior del Scaffold.
      appBar: AppBar(
        // El título que se muestra en la barra de aplicación.
        title: const Text("Contador de Personas"),
      ),
      // El cuerpo principal del Scaffold.
      body: Column(
        // Un widget que organiza a sus hijos en una columna vertical.
        children: [
          // Un widget que añade relleno alrededor de su hijo.
          Padding(
            // Establece un relleno de 16 píxeles en todos los lados.
            padding: const EdgeInsets.all(16),
            // Un campo de texto para que el usuario introduzca el nombre.
            child: TextField(
              // Asigna el controlador de texto al campo de texto.
              controller: _nameController,
              // Proporciona decoración al campo de texto, incluyendo una etiqueta.
              decoration:
                  const InputDecoration(labelText: "Nombre de la Persona"),
            ),
          ),
          // Un botón elevado de Material Design.
          ElevatedButton(
            // El texto que se muestra dentro del botón.
            child: const Text("Agregar Persona"),
            // La función que se llama cuando se presiona el botón.
            onPressed: _addPerson,
          ),
          // Un widget que crea una caja con un tamaño específico. Se utiliza aquí para añadir espacio vertical.
          const SizedBox(height: 20),
          // Un widget de texto que muestra el número de personas.
          Text(
            // El texto a mostrar, que interpola la longitud de la lista de personas.
            'Número de personas: ${_people.length}',
            // El estilo del texto, utilizando el estilo de titular mediano del tema actual.
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // Un widget que expande a su hijo para que ocupe el espacio disponible.
          Expanded(
            // Una vista de lista que se desplaza y construye sus elementos bajo demanda.
            child: ListView.builder(
              // El número total de elementos en la lista.
              itemCount: _people.length,
              // Un constructor que proporciona un widget para cada elemento de la lista.
              itemBuilder: (context, index) {
                // Devuelve un ListTile para cada persona en la lista.
                return ListTile(
                  // El texto principal del ListTile, que es el nombre de la persona.
                  title: Text(_people[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
