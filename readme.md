Para estre proyecto vamos a trabajar con unos arcivhos CSV, que contienen los datos relacionados con un negocio de alquiler de peliculas, con el objetivo de crear una
base de datos relacional.

El procedimiento que vamos a seguir será el siguiente:
  - Limpieza y preparacion de los datos en formato CSV
  - Definicion y creacion de la base de datos
  - Importación de los datos
  - Alteración de la BBDD: modificaciones necesarias y creación de relaciones entre tablas.


-LIMPIEZA
A partir de los CSV originales, se ha creado una copia en la que se elimina la columna "last_update" de las tablas en las que exista.
Debido a una incongruencia de los datos, posiblemente debido a la falta de infomación en la tabla Rental, existian valores en la columna inventory_id que no existian 
en la propia tabla Inventory, por lo que se ha decidido añadir registros a la tabla Inventario. 
Para hacerlo, se han añadido a Inventario todas las ID por encima de 1000. Para el campo Film_id y Store_id, se ha randomizado sus valores. Esto hace que la tabla 
Inventario no sea fiel a los datos originales, pero le da consistencia al modelo.


-DEFINICIÓN
El aspecto que presenta la BBDD inicialmente será el siguiente:
![image](https://user-images.githubusercontent.com/111570446/200181006-ee7d35e8-4212-4e21-ac0d-369c8c6aacad.png)
También se han creado 2 tablas nuevas que no aparecian en los CSV originales, que pertenecen al personal(Staff) y al cliente(Customer)


-IMPORTACION
Sobre este esquema empezaremos a volcar los datos (ya analizados y limpios). 


-ALTERACIÓN
Una vez volcados, se unifican las columnas first_name y last_name de las tablas Actor y Hdd,
de modo que nos queda una unica columna que ademas nos vale como indice.





