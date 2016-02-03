with GLFW3;
with GLFW3.Monitors;
with GLFW3.Windows;

with Interfaces.C;

procedure Create_Window is

   use GLFW3;
   use GLFW3.Monitors;
   use GLFW3.Windows;

   use Interfaces.C;

   W : Window;

begin

   GLFW3.Initialize;

   W := Create_Window (400, 400, To_C ("Hello"));
   Make_Context_Current (W);

   loop
      Wait_Events;
      pragma Warnings (Off);
      exit when Window_Should_Close (W) = 1;
      pragma Warnings (On);
   end loop;

   Destroy_Window (W);

end;
