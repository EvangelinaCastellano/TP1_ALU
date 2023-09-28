# Trabajo práctico N°1: ALU

Se implemento en una FPGA Basys 3 una ALU parametrizable que consiste en:
- N switches que se utilizarán para indicar el valor de los dos operadores y el código de operación.
- Un botón para que al ser presionado se cargue el valor representado en los switches en el dato A.
- Un botón para que al ser presionado se cargue el valor representado en los switches en el dato B.
- Un botón para que al ser presionado se cargue el valor representado en los switches en el código de operación.
- N LEDs que mostrarán el resultado de la operación realizada.

En la imágen se puede observar su esquemático:
![Esquemático de la ALU](images/ALU.png)

Las operaciones que realizará y sus respectivos códigos de operación se pueden observar en la siguiente tabla:

<center>

| Operación | Código |
|-----------|:------:|
| ADD       | 100000 |
| SUB       | 100010 |
| AND       | 100100 |
| OR        | 100101 |
| XOR       | 100110 |
| SRA       | 000011 |
| SRL       | 000010 |
| NOR       | 100111 | 

</center>


El proyecto consiste en un módulo _ALU_ que realizará la operación que se le indique y de un módulo _top_ 
### Modulo ALU
El proyecto consiste en un módulo ALU que se encargará de realizar la operación que se le indique. 
![modulo alu](images/alu_module.png)

### Modulo top