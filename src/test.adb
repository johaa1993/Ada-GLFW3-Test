
with GLFW3;
with GLFW3.Windows;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Ada.Text_IO;



procedure Test is

   procedure Error_Callback (Error : int; Description : chars_ptr) with Convention => C;
   procedure Error_Callback (Error : int; Description : chars_ptr) is
      pragma Unreferenced (Description);
   begin
      Ada.Text_IO.Put_Line (int'Image (Error));
   end;

   use GLFW3;
   use GLFW3.Windows;
   Main_Window : Window;
begin
   GLFW3.Initialize;
   Set_Error_Procedure (Error_Callback'Unrestricted_Access);
   Main_Window := Create_Window_Ada (1024, 1024, "Hello Window.");
   Make_Context_Current (Main_Window);
   loop
      Poll_Events;
      Swap_Buffers (Main_Window);
      pragma Warnings (Off);
      exit when Window_Should_Close (Main_Window) = 1;
      pragma Warnings (On);
      delay 0.01;
   end loop;

   Destroy_Window (Main_Window);
end;
