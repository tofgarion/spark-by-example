--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Reporter.gnattest;
with AUnit.Run;
with AUnit.Options; use AUnit.Options;
with Gnattest_Main_Suite; use Gnattest_Main_Suite;

with AUnit; use AUnit;
with Ada.Command_Line;
with GNAT.Command_Line; use GNAT.Command_Line;

with Gnattest_Generated;

procedure Test_Runner is
   function Runner is new AUnit.Run.Test_Runner_With_Status (Suite);
   Exit_Status : AUnit.Status;
   Use_Exit_Status : Boolean := False;
   Reporter : AUnit.Reporter.gnattest.gnattest_Reporter;
   GT_Options : AUnit_Options := Default_Options;
begin

   GT_Options.Report_Successes := True;

   begin
      Initialize_Option_Scan;
      loop
         case GNAT.Command_Line.Getopt
           ("-skeleton-default= -passed-tests= -exit-status=")
         is
            when ASCII.NUL =>
               exit;
            when '-' =>
               if Full_Switch = "-skeleton-default" then
                  if Parameter = "pass" then
                     Gnattest_Generated.Default_Assert_Value := True;
                  elsif Parameter = "fail" then
                     Gnattest_Generated.Default_Assert_Value := False;
                  end if;
               end if;
               if Full_Switch = "-passed-tests" then
                  if Parameter = "show" then
                     GT_Options.Report_Successes := True;
                  elsif Parameter = "hide" then
                     GT_Options.Report_Successes := False;
                  end if;
               end if;
               if Full_Switch = "-exit-status" then
                  if Parameter = "on" then
                     Use_Exit_Status := True;
                  elsif Parameter = "off" then
                     Use_Exit_Status := False;
                  end if;
               end if;
            when others => null;
         end case;
      end loop;
   exception
      when GNAT.Command_Line.Invalid_Switch => null;
   end;

   Exit_Status := Runner (Reporter, GT_Options);
   if Use_Exit_Status and then Exit_Status = AUnit.Failure then
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   else
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
   end if;
end Test_Runner;
--  end read only
