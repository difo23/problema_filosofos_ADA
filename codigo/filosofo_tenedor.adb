-- Prueba basica de dos tareas utilizando una region critica para
-- acceder a la pantalla

with Ada.Real_Time, Ada.Text_IO;
use Ada.Real_Time, Ada.Text_IO;

--creo un package osea como una clase para python
-- en el problema de los filosofos esto representaria los filosofos
package body Filosofo_Tenedor is
  
--tenedor 1 inicia
   protected Tenedor1 is  
   	
   	  pragma priority(2);
      procedure Soltar;
      entry Tomar;
   private
      libre : boolean := true;   

   end Tenedor1;
--inicia el body del tenedor
   protected body Tenedor1 is
      
      procedure Soltar is
      begin
         libre := true;
      end;

      entry Tomar when libre is
      begin
         libre := false;
      end;
   end Tenedor1;
   --tenedor 1 finaliza

   --tenedor 2 inicia
   protected Tenedor2 is  
   	
   	  pragma priority(2);
      procedure Soltar;
      entry Tomar;
   private
      libre : boolean := true;   

   end Tenedor2;
--inicia el body del tenedor
   protected body Tenedor2 is
      
      procedure Soltar is
      begin
         libre := true;
      end;

      entry Tomar when libre is
      begin
         libre := false;
      end;
   end Tenedor2;
--tenedor 2 finaliza

 --tenedor 3 inicia
   protected Tenedor3 is  
   	
   	  pragma priority(2);
      procedure Soltar;
      entry Tomar;
   private
      libre : boolean := true;   

   end Tenedor3;
--inicia el body del tenedor
   protected body Tenedor3 is
      
      procedure Soltar is
      begin
         libre := true;
      end;

      entry Tomar when libre is
      begin
         libre := false;
      end;
   end Tenedor3;
--tenedor 3 finaliza

 --tenedor 4 inicia
   protected Tenedor4 is  
   	
   	  pragma priority(2);
      procedure Soltar;
      entry Tomar;
   private
      libre : boolean := true;   

   end Tenedor4;
--inicia el body del tenedor
   protected body Tenedor4 is
      
      procedure Soltar is
      begin
         libre := true;
      end;

      entry Tomar when libre is
      begin
         libre := false;
      end;
   end Tenedor4;
--tenedor 4 finaliza

 --tenedor 5 inicia
   protected Tenedor5 is  
   	
   	  pragma priority(2);
      procedure Soltar;
      entry Tomar;
   private
      libre : boolean := true;   

   end Tenedor5;
--inicia el body del tenedor
   protected body Tenedor5 is
      
      procedure Soltar is
      begin
         libre := true;
      end;

      entry Tomar when libre is
      begin
         libre := false;
      end;
   end Tenedor5;
--tenedor 5 finaliza


--inicio filosofo1
   task Filosofo1 is
      pragma priority(2);
   end Filosofo1;

   task body Filosofo1 is
      Hora : Time;
      Incremento : Time_Span := Milliseconds(1000);
   begin
      Hora := Clock;
      loop
         Tenedor1.Tomar;
         Put_Line("filosofo1 toma el tenedor1 y medito");
         Hora := Hora + Incremento;
         delay until Hora;
         Tenedor5.Tomar;
         Put_Line("filosofo1 toma el tenedor5 y come");
         Hora := Hora + Incremento;
         delay until Hora;
         Put_Line("filosofo1 suelto tenedor 1 y 5");
         Tenedor1.Soltar;
         Tenedor5.Soltar;
      end loop;
   end Filosofo1;
 -- termino filosofo1

 --inicio filosofo2
   task Filosofo2 is
      pragma priority(2);
   end Filosofo2;

   task body Filosofo2 is
      Hora : Time;
      Incremento : Time_Span := Milliseconds(1000);
   begin
      Hora := Clock;
      loop
        Tenedor1.Tomar;
         Put_Line("filosofo2 toma el tenedor1 y medito");
         Hora := Hora + Incremento;
         delay until Hora;
         Tenedor2.Tomar;
         Put_Line("filosofo2 toma el tenedor2 y come");
         Hora := Hora + Incremento;
         delay until Hora;
         Put_Line("filosofo2 suelto tenedor 1 y 2");
         Tenedor1.Soltar;
         Tenedor2.Soltar;
      end loop;
   end Filosofo2;
 -- termino filosofo2

  --inicio filosofo3
   task Filosofo3 is
      pragma priority(2);
   end Filosofo3;

   task body Filosofo3 is
      Hora : Time;
      Incremento : Time_Span := Milliseconds(1000);
   begin
      Hora := Clock;
      loop
         Tenedor2.Tomar;
         Put_Line("filosofo3 toma el tenedor2 y medito");
         Hora := Hora + Incremento;
         delay until Hora;
         Tenedor3.Tomar;
         Put_Line("filosofo3 toma el tenedor3 y come");
         Hora := Hora + Incremento;
         delay until Hora;
         Put_Line("filosofo3 suelto tenedor 2 y 3");
         Tenedor2.Soltar;
         Tenedor3.Soltar;
      end loop;
   end Filosofo3;
 -- termino filosofo3

 --inicio filosofo4
   task Filosofo4 is
      pragma priority(2);
   end Filosofo4;

   task body Filosofo4 is
      Hora : Time;
      Incremento : Time_Span := Milliseconds(1000);
   begin
      Hora := Clock;
      loop
         Tenedor3.Tomar;
         Put_Line("filosofo4 toma el tenedor3 y medito");
         Hora := Hora + Incremento;
         delay until Hora;
         Tenedor4.Tomar;
         Put_Line("filosofo4 toma el tenedor4 y come");
         Hora := Hora + Incremento;
         delay until Hora;
         Put_Line("filosofo4 suelto tenedor 3 y 4");
         Tenedor3.Soltar;
         Tenedor4.Soltar;
      end loop;
   end Filosofo4;
 -- termino filosofo4

 --inicio filosofo5
   task Filosofo5 is
      pragma priority(2);
   end Filosofo5;

   task body Filosofo5 is
      Hora : Time;
      Incremento : Time_Span := Milliseconds(1000);
   begin
      Hora := Clock;
      loop
       Tenedor4.Tomar;
         Put_Line("filosofo5 toma el tenedor4 y medito");
         Hora := Hora + Incremento;
         delay until Hora;
         Tenedor5.Tomar;
         Put_Line("filosofo5 toma el tenedor5 y come");
         Hora := Hora + Incremento;
         delay until Hora;
         Put_Line("filosofo5 suelto tenedor 4 y 5");
         Tenedor4.Soltar;
         Tenedor5.Soltar;
      end loop;
   end Filosofo5;
 -- termino filosofo5

  
   procedure Ocioso is
   begin
      loop
         null;
      end loop;
   end Ocioso;

end Filosofo_Tenedor;