pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__test_runner.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__test_runner.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E073 : Short_Integer; pragma Import (Ada, E073, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__exception_table_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__io_exceptions_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "ada__strings_E");
   E036 : Short_Integer; pragma Import (Ada, E036, "ada__containers_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exceptions_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "system__secondary_stack_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__strings__maps_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__strings__maps__constants_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "interfaces__c_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__object_reader_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "system__dwarf_lines_E");
   E035 : Short_Integer; pragma Import (Ada, E035, "system__traceback__symbolic_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "ada__tags_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "ada__streams_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__file_control_block_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__finalization_root_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "ada__finalization_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "system__file_io_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "system__storage_pools_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__finalization_masters_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "system__storage_pools__subpools_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "ada__strings__unbounded_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "ada__calendar_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "ada__text_io_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "gnat__directory_operations_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "system__assertions_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "system__pool_global_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "system__regexp_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "gnat__command_line_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "aunit_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "aunit__memory_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "aunit__memory__utils_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "ada_containers__aunit_lists_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "aunit__tests_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "aunit__time_measure_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "aunit__test_results_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "aunit__assertions_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "aunit__test_filters_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "aunit__simple_test_cases_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "aunit__reporter_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "aunit__reporter__gnattest_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "aunit__test_fixtures_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "aunit__test_caller_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "aunit__test_suites_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "aunit__run_E");
   E266 : Short_Integer; pragma Import (Ada, E266, "common_fixtures_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "adjacent_find_p_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "adjacent_find_p__test_data_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "adjacent_find_p__test_data__tests_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "adjacent_find_p__test_data__tests__suite_E");
   E244 : Short_Integer; pragma Import (Ada, E244, "find_end_p_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "find_end_p__test_data_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "find_end_p__test_data__tests_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "find_end_p__test_data__tests__suite_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "find_p_E");
   E265 : Short_Integer; pragma Import (Ada, E265, "find_p__test_data_E");
   E268 : Short_Integer; pragma Import (Ada, E268, "find_p__test_data__tests_E");
   E274 : Short_Integer; pragma Import (Ada, E274, "find_p__test_data__tests__suite_E");
   E253 : Short_Integer; pragma Import (Ada, E253, "find_first_of_p_E");
   E259 : Short_Integer; pragma Import (Ada, E259, "find_first_of_p__test_data_E");
   E261 : Short_Integer; pragma Import (Ada, E261, "find_first_of_p__test_data__tests_E");
   E263 : Short_Integer; pragma Import (Ada, E263, "find_first_of_p__test_data__tests__suite_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "heap_predicates__test_data_E");
   E279 : Short_Integer; pragma Import (Ada, E279, "heap_predicates__test_data__tests_E");
   E281 : Short_Integer; pragma Import (Ada, E281, "heap_predicates__test_data__tests__suite_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "mismatch_p_E");
   E226 : Short_Integer; pragma Import (Ada, E226, "equal_p_E");
   E231 : Short_Integer; pragma Import (Ada, E231, "equal_p__test_data_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "equal_p__test_data__tests_E");
   E235 : Short_Integer; pragma Import (Ada, E235, "equal_p__test_data__tests__suite_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "equal_rev_p__test_data_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "equal_rev_p__test_data__tests_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "equal_rev_p__test_data__tests__suite_E");
   E283 : Short_Integer; pragma Import (Ada, E283, "mismatch_p__test_data_E");
   E285 : Short_Integer; pragma Import (Ada, E285, "mismatch_p__test_data__tests_E");
   E287 : Short_Integer; pragma Import (Ada, E287, "mismatch_p__test_data__tests__suite_E");
   E289 : Short_Integer; pragma Import (Ada, E289, "naive_find_p_E");
   E291 : Short_Integer; pragma Import (Ada, E291, "naive_find_p__test_data_E");
   E293 : Short_Integer; pragma Import (Ada, E293, "naive_find_p__test_data__tests_E");
   E295 : Short_Integer; pragma Import (Ada, E295, "naive_find_p__test_data__tests__suite_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "count_p_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "count_p__test_data_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "count_p__test_data__tests_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "count_p__test_data__tests__suite_E");
   E297 : Short_Integer; pragma Import (Ada, E297, "search_n_p_E");
   E300 : Short_Integer; pragma Import (Ada, E300, "search_n_p__test_data_E");
   E302 : Short_Integer; pragma Import (Ada, E302, "search_n_p__test_data__tests_E");
   E304 : Short_Integer; pragma Import (Ada, E304, "search_n_p__test_data__tests__suite_E");
   E306 : Short_Integer; pragma Import (Ada, E306, "search_p_E");
   E308 : Short_Integer; pragma Import (Ada, E308, "search_p__test_data_E");
   E310 : Short_Integer; pragma Import (Ada, E310, "search_p__test_data__tests_E");
   E312 : Short_Integer; pragma Import (Ada, E312, "search_p__test_data__tests__suite_E");
   E314 : Short_Integer; pragma Import (Ada, E314, "search_with_ghost_p_E");
   E316 : Short_Integer; pragma Import (Ada, E316, "search_with_ghost_p__test_data_E");
   E318 : Short_Integer; pragma Import (Ada, E318, "search_with_ghost_p__test_data__tests_E");
   E320 : Short_Integer; pragma Import (Ada, E320, "search_with_ghost_p__test_data__tests__suite_E");
   E322 : Short_Integer; pragma Import (Ada, E322, "search_wo_ghost_p_E");
   E324 : Short_Integer; pragma Import (Ada, E324, "search_wo_ghost_p__test_data_E");
   E326 : Short_Integer; pragma Import (Ada, E326, "search_wo_ghost_p__test_data__tests_E");
   E328 : Short_Integer; pragma Import (Ada, E328, "search_wo_ghost_p__test_data__tests__suite_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "gnattest_main_suite_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "search_wo_ghost_p__test_data__tests__suite__finalize_body");
      begin
         E328 := E328 - 1;
         F1;
      end;
      E326 := E326 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "search_wo_ghost_p__test_data__tests__finalize_spec");
      begin
         F2;
      end;
      E324 := E324 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "search_wo_ghost_p__test_data__finalize_spec");
      begin
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "search_with_ghost_p__test_data__tests__suite__finalize_body");
      begin
         E320 := E320 - 1;
         F4;
      end;
      E318 := E318 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "search_with_ghost_p__test_data__tests__finalize_spec");
      begin
         F5;
      end;
      E316 := E316 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "search_with_ghost_p__test_data__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "search_p__test_data__tests__suite__finalize_body");
      begin
         E312 := E312 - 1;
         F7;
      end;
      E310 := E310 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "search_p__test_data__tests__finalize_spec");
      begin
         F8;
      end;
      E308 := E308 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "search_p__test_data__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "search_n_p__test_data__tests__suite__finalize_body");
      begin
         E304 := E304 - 1;
         F10;
      end;
      E302 := E302 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "search_n_p__test_data__tests__finalize_spec");
      begin
         F11;
      end;
      E300 := E300 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "search_n_p__test_data__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "count_p__test_data__tests__suite__finalize_body");
      begin
         E224 := E224 - 1;
         F13;
      end;
      E222 := E222 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "count_p__test_data__tests__finalize_spec");
      begin
         F14;
      end;
      E220 := E220 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "count_p__test_data__finalize_spec");
      begin
         F15;
      end;
      declare
         procedure F16;
         pragma Import (Ada, F16, "naive_find_p__test_data__tests__suite__finalize_body");
      begin
         E295 := E295 - 1;
         F16;
      end;
      E293 := E293 - 1;
      declare
         procedure F17;
         pragma Import (Ada, F17, "naive_find_p__test_data__tests__finalize_spec");
      begin
         F17;
      end;
      E291 := E291 - 1;
      declare
         procedure F18;
         pragma Import (Ada, F18, "naive_find_p__test_data__finalize_spec");
      begin
         F18;
      end;
      declare
         procedure F19;
         pragma Import (Ada, F19, "mismatch_p__test_data__tests__suite__finalize_body");
      begin
         E287 := E287 - 1;
         F19;
      end;
      E285 := E285 - 1;
      declare
         procedure F20;
         pragma Import (Ada, F20, "mismatch_p__test_data__tests__finalize_spec");
      begin
         F20;
      end;
      E283 := E283 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "mismatch_p__test_data__finalize_spec");
      begin
         F21;
      end;
      declare
         procedure F22;
         pragma Import (Ada, F22, "equal_rev_p__test_data__tests__suite__finalize_body");
      begin
         E242 := E242 - 1;
         F22;
      end;
      E240 := E240 - 1;
      declare
         procedure F23;
         pragma Import (Ada, F23, "equal_rev_p__test_data__tests__finalize_spec");
      begin
         F23;
      end;
      E238 := E238 - 1;
      declare
         procedure F24;
         pragma Import (Ada, F24, "equal_rev_p__test_data__finalize_spec");
      begin
         F24;
      end;
      declare
         procedure F25;
         pragma Import (Ada, F25, "equal_p__test_data__tests__suite__finalize_body");
      begin
         E235 := E235 - 1;
         F25;
      end;
      E233 := E233 - 1;
      declare
         procedure F26;
         pragma Import (Ada, F26, "equal_p__test_data__tests__finalize_spec");
      begin
         F26;
      end;
      E231 := E231 - 1;
      declare
         procedure F27;
         pragma Import (Ada, F27, "equal_p__test_data__finalize_spec");
      begin
         F27;
      end;
      declare
         procedure F28;
         pragma Import (Ada, F28, "heap_predicates__test_data__tests__suite__finalize_body");
      begin
         E281 := E281 - 1;
         F28;
      end;
      E279 := E279 - 1;
      declare
         procedure F29;
         pragma Import (Ada, F29, "heap_predicates__test_data__tests__finalize_spec");
      begin
         F29;
      end;
      E277 := E277 - 1;
      declare
         procedure F30;
         pragma Import (Ada, F30, "heap_predicates__test_data__finalize_spec");
      begin
         F30;
      end;
      declare
         procedure F31;
         pragma Import (Ada, F31, "find_first_of_p__test_data__tests__suite__finalize_body");
      begin
         E263 := E263 - 1;
         F31;
      end;
      E261 := E261 - 1;
      declare
         procedure F32;
         pragma Import (Ada, F32, "find_first_of_p__test_data__tests__finalize_spec");
      begin
         F32;
      end;
      E259 := E259 - 1;
      declare
         procedure F33;
         pragma Import (Ada, F33, "find_first_of_p__test_data__finalize_spec");
      begin
         F33;
      end;
      declare
         procedure F34;
         pragma Import (Ada, F34, "find_p__test_data__tests__suite__finalize_body");
      begin
         E274 := E274 - 1;
         F34;
      end;
      E268 := E268 - 1;
      declare
         procedure F35;
         pragma Import (Ada, F35, "find_p__test_data__tests__finalize_spec");
      begin
         F35;
      end;
      E265 := E265 - 1;
      declare
         procedure F36;
         pragma Import (Ada, F36, "find_p__test_data__finalize_spec");
      begin
         F36;
      end;
      declare
         procedure F37;
         pragma Import (Ada, F37, "find_end_p__test_data__tests__suite__finalize_body");
      begin
         E251 := E251 - 1;
         F37;
      end;
      E249 := E249 - 1;
      declare
         procedure F38;
         pragma Import (Ada, F38, "find_end_p__test_data__tests__finalize_spec");
      begin
         F38;
      end;
      E247 := E247 - 1;
      declare
         procedure F39;
         pragma Import (Ada, F39, "find_end_p__test_data__finalize_spec");
      begin
         F39;
      end;
      declare
         procedure F40;
         pragma Import (Ada, F40, "adjacent_find_p__test_data__tests__suite__finalize_body");
      begin
         E212 := E212 - 1;
         F40;
      end;
      E210 := E210 - 1;
      declare
         procedure F41;
         pragma Import (Ada, F41, "adjacent_find_p__test_data__tests__finalize_spec");
      begin
         F41;
      end;
      E206 := E206 - 1;
      declare
         procedure F42;
         pragma Import (Ada, F42, "adjacent_find_p__test_data__finalize_spec");
      begin
         F42;
      end;
      declare
         procedure F43;
         pragma Import (Ada, F43, "common_fixtures__finalize_spec");
      begin
         E266 := E266 - 1;
         F43;
      end;
      E159 := E159 - 1;
      declare
         procedure F44;
         pragma Import (Ada, F44, "aunit__test_suites__finalize_spec");
      begin
         F44;
      end;
      E208 := E208 - 1;
      declare
         procedure F45;
         pragma Import (Ada, F45, "aunit__test_fixtures__finalize_spec");
      begin
         F45;
      end;
      E151 := E151 - 1;
      declare
         procedure F46;
         pragma Import (Ada, F46, "aunit__reporter__gnattest__finalize_spec");
      begin
         F46;
      end;
      E110 := E110 - 1;
      E112 := E112 - 1;
      declare
         procedure F47;
         pragma Import (Ada, F47, "aunit__simple_test_cases__finalize_spec");
      begin
         F47;
      end;
      declare
         procedure F48;
         pragma Import (Ada, F48, "aunit__test_filters__finalize_spec");
      begin
         F48;
      end;
      E114 := E114 - 1;
      declare
         procedure F49;
         pragma Import (Ada, F49, "aunit__assertions__finalize_spec");
      begin
         F49;
      end;
      E121 := E121 - 1;
      declare
         procedure F50;
         pragma Import (Ada, F50, "aunit__test_results__finalize_spec");
      begin
         F50;
      end;
      declare
         procedure F51;
         pragma Import (Ada, F51, "aunit__tests__finalize_spec");
      begin
         E128 := E128 - 1;
         F51;
      end;
      E194 := E194 - 1;
      declare
         procedure F52;
         pragma Import (Ada, F52, "system__regexp__finalize_spec");
      begin
         F52;
      end;
      E141 := E141 - 1;
      declare
         procedure F53;
         pragma Import (Ada, F53, "system__pool_global__finalize_spec");
      begin
         F53;
      end;
      E177 := E177 - 1;
      declare
         procedure F54;
         pragma Import (Ada, F54, "ada__text_io__finalize_spec");
      begin
         F54;
      end;
      E163 := E163 - 1;
      declare
         procedure F55;
         pragma Import (Ada, F55, "ada__strings__unbounded__finalize_spec");
      begin
         F55;
      end;
      E169 := E169 - 1;
      declare
         procedure F56;
         pragma Import (Ada, F56, "system__storage_pools__subpools__finalize_spec");
      begin
         F56;
      end;
      E130 := E130 - 1;
      declare
         procedure F57;
         pragma Import (Ada, F57, "system__finalization_masters__finalize_spec");
      begin
         F57;
      end;
      declare
         procedure F58;
         pragma Import (Ada, F58, "system__file_io__finalize_body");
      begin
         E181 := E181 - 1;
         F58;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Exception_Tracebacks := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E019 := E019 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E068 := E068 + 1;
      Ada.Strings'Elab_Spec;
      E053 := E053 + 1;
      Ada.Containers'Elab_Spec;
      E036 := E036 + 1;
      System.Exceptions'Elab_Spec;
      E021 := E021 + 1;
      System.Os_Lib'Elab_Body;
      E073 := E073 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E059 := E059 + 1;
      Interfaces.C'Elab_Spec;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Secondary_Stack'Elab_Body;
      E009 := E009 + 1;
      E055 := E055 + 1;
      E041 := E041 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E048 := E048 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E035 := E035 + 1;
      E079 := E079 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E104 := E104 + 1;
      Ada.Streams'Elab_Spec;
      E135 := E135 + 1;
      System.File_Control_Block'Elab_Spec;
      E182 := E182 + 1;
      System.Finalization_Root'Elab_Spec;
      E137 := E137 + 1;
      Ada.Finalization'Elab_Spec;
      E133 := E133 + 1;
      System.File_Io'Elab_Body;
      E181 := E181 + 1;
      System.Storage_Pools'Elab_Spec;
      E139 := E139 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E130 := E130 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E169 := E169 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E163 := E163 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E125 := E125 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E177 := E177 + 1;
      Gnat.Directory_Operations'Elab_Spec;
      Gnat.Directory_Operations'Elab_Body;
      E184 := E184 + 1;
      System.Assertions'Elab_Spec;
      E202 := E202 + 1;
      System.Pool_Global'Elab_Spec;
      E141 := E141 + 1;
      System.Regexp'Elab_Spec;
      E194 := E194 + 1;
      Gnat.Command_Line'Elab_Spec;
      Gnat.Command_Line'Elab_Body;
      E161 := E161 + 1;
      E101 := E101 + 1;
      E099 := E099 + 1;
      E119 := E119 + 1;
      E117 := E117 + 1;
      Aunit.Tests'Elab_Spec;
      E128 := E128 + 1;
      Aunit.Time_Measure'Elab_Spec;
      E123 := E123 + 1;
      Aunit.Test_Results'Elab_Spec;
      E121 := E121 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E114 := E114 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E112 := E112 + 1;
      E110 := E110 + 1;
      Aunit.Reporter'Elab_Spec;
      E149 := E149 + 1;
      Aunit.Reporter.Gnattest'Elab_Spec;
      E151 := E151 + 1;
      Aunit.Test_Fixtures'Elab_Spec;
      E208 := E208 + 1;
      E214 := E214 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E159 := E159 + 1;
      E157 := E157 + 1;
      Common_Fixtures'Elab_Spec;
      E266 := E266 + 1;
      E200 := E200 + 1;
      Adjacent_Find_P.Test_Data'Elab_Spec;
      Adjacent_Find_P.Test_Data'Elab_Body;
      E206 := E206 + 1;
      Adjacent_Find_P.Test_Data.Tests'Elab_Spec;
      Adjacent_Find_P.Test_Data.Tests'Elab_Body;
      E210 := E210 + 1;
      Adjacent_Find_P.Test_Data.Tests.Suite'Elab_Body;
      E212 := E212 + 1;
      E244 := E244 + 1;
      Find_End_P.Test_Data'Elab_Spec;
      Find_End_P.Test_Data'Elab_Body;
      E247 := E247 + 1;
      Find_End_P.Test_Data.Tests'Elab_Spec;
      Find_End_P.Test_Data.Tests'Elab_Body;
      E249 := E249 + 1;
      Find_End_P.Test_Data.Tests.Suite'Elab_Body;
      E251 := E251 + 1;
      E255 := E255 + 1;
      Find_P.Test_Data'Elab_Spec;
      Find_P.Test_Data'Elab_Body;
      E265 := E265 + 1;
      Find_P.Test_Data.Tests'Elab_Spec;
      Find_P.Test_Data.Tests'Elab_Body;
      E268 := E268 + 1;
      Find_P.Test_Data.Tests.Suite'Elab_Body;
      E274 := E274 + 1;
      E253 := E253 + 1;
      Find_First_Of_P.Test_Data'Elab_Spec;
      Find_First_Of_P.Test_Data'Elab_Body;
      E259 := E259 + 1;
      Find_First_Of_P.Test_Data.Tests'Elab_Spec;
      Find_First_Of_P.Test_Data.Tests'Elab_Body;
      E261 := E261 + 1;
      Find_First_Of_P.Test_Data.Tests.Suite'Elab_Body;
      E263 := E263 + 1;
      Heap_Predicates.Test_Data'Elab_Spec;
      Heap_Predicates.Test_Data'Elab_Body;
      E277 := E277 + 1;
      Heap_Predicates.Test_Data.Tests'Elab_Spec;
      Heap_Predicates.Test_Data.Tests'Elab_Body;
      E279 := E279 + 1;
      Heap_Predicates.Test_Data.Tests.Suite'Elab_Body;
      E281 := E281 + 1;
      E228 := E228 + 1;
      E226 := E226 + 1;
      Equal_P.Test_Data'Elab_Spec;
      Equal_P.Test_Data'Elab_Body;
      E231 := E231 + 1;
      Equal_P.Test_Data.Tests'Elab_Spec;
      Equal_P.Test_Data.Tests'Elab_Body;
      E233 := E233 + 1;
      Equal_P.Test_Data.Tests.Suite'Elab_Body;
      E235 := E235 + 1;
      Equal_Rev_P.Test_Data'Elab_Spec;
      Equal_Rev_P.Test_Data'Elab_Body;
      E238 := E238 + 1;
      Equal_Rev_P.Test_Data.Tests'Elab_Spec;
      Equal_Rev_P.Test_Data.Tests'Elab_Body;
      E240 := E240 + 1;
      Equal_Rev_P.Test_Data.Tests.Suite'Elab_Body;
      E242 := E242 + 1;
      Mismatch_P.Test_Data'Elab_Spec;
      Mismatch_P.Test_Data'Elab_Body;
      E283 := E283 + 1;
      Mismatch_P.Test_Data.Tests'Elab_Spec;
      Mismatch_P.Test_Data.Tests'Elab_Body;
      E285 := E285 + 1;
      Mismatch_P.Test_Data.Tests.Suite'Elab_Body;
      E287 := E287 + 1;
      E289 := E289 + 1;
      Naive_Find_P.Test_Data'Elab_Spec;
      Naive_Find_P.Test_Data'Elab_Body;
      E291 := E291 + 1;
      Naive_Find_P.Test_Data.Tests'Elab_Spec;
      Naive_Find_P.Test_Data.Tests'Elab_Body;
      E293 := E293 + 1;
      Naive_Find_P.Test_Data.Tests.Suite'Elab_Body;
      E295 := E295 + 1;
      E216 := E216 + 1;
      Count_P.Test_Data'Elab_Spec;
      Count_P.Test_Data'Elab_Body;
      E220 := E220 + 1;
      Count_P.Test_Data.Tests'Elab_Spec;
      Count_P.Test_Data.Tests'Elab_Body;
      E222 := E222 + 1;
      Count_P.Test_Data.Tests.Suite'Elab_Body;
      E224 := E224 + 1;
      E297 := E297 + 1;
      Search_N_P.Test_Data'Elab_Spec;
      Search_N_P.Test_Data'Elab_Body;
      E300 := E300 + 1;
      Search_N_P.Test_Data.Tests'Elab_Spec;
      Search_N_P.Test_Data.Tests'Elab_Body;
      E302 := E302 + 1;
      Search_N_P.Test_Data.Tests.Suite'Elab_Body;
      E304 := E304 + 1;
      E306 := E306 + 1;
      Search_P.Test_Data'Elab_Spec;
      Search_P.Test_Data'Elab_Body;
      E308 := E308 + 1;
      Search_P.Test_Data.Tests'Elab_Spec;
      Search_P.Test_Data.Tests'Elab_Body;
      E310 := E310 + 1;
      Search_P.Test_Data.Tests.Suite'Elab_Body;
      E312 := E312 + 1;
      E314 := E314 + 1;
      Search_With_Ghost_P.Test_Data'Elab_Spec;
      Search_With_Ghost_P.Test_Data'Elab_Body;
      E316 := E316 + 1;
      Search_With_Ghost_P.Test_Data.Tests'Elab_Spec;
      Search_With_Ghost_P.Test_Data.Tests'Elab_Body;
      E318 := E318 + 1;
      Search_With_Ghost_P.Test_Data.Tests.Suite'Elab_Body;
      E320 := E320 + 1;
      E322 := E322 + 1;
      Search_Wo_Ghost_P.Test_Data'Elab_Spec;
      Search_Wo_Ghost_P.Test_Data'Elab_Body;
      E324 := E324 + 1;
      Search_Wo_Ghost_P.Test_Data.Tests'Elab_Spec;
      Search_Wo_Ghost_P.Test_Data.Tests'Elab_Body;
      E326 := E326 + 1;
      Search_Wo_Ghost_P.Test_Data.Tests.Suite'Elab_Body;
      E328 := E328 + 1;
      Gnattest_Main_Suite'Elab_Body;
      E198 := E198 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_test_runner");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/gnattest_generated.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/types.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/common_fixtures.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/equal_ranges_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/has_constant_subrange_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/has_equal_neighbors_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/adjacent_find_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/adjacent_find_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/adjacent_find_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/adjacent_find_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/has_subrange_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/find_end_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/find_end_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/find_end_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/find_end_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/has_value_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/find_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/find_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/find_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/find_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/has_value_of_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/find_first_of_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/find_first_of_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/find_first_of_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/find_first_of_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/heap_predicates.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/heap_predicates-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/heap_predicates-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/heap_predicates-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/mismatch_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/equal_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/equal_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/equal_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/equal_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/equal_rev_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/equal_rev_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/equal_rev_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/equal_rev_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/mismatch_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/mismatch_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/mismatch_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/naive_find_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/naive_find_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/naive_find_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/naive_find_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/occ_def_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/occ_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/count_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/count_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/count_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/count_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/search_n_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_n_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_n_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_n_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/search_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/search_with_ghost_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_with_ghost_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_with_ghost_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_with_ghost_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/search_wo_ghost_p.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_wo_ghost_p-test_data.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_wo_ghost_p-test_data-tests.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/search_wo_ghost_p-test_data-tests-suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/gnattest_main_suite.o
   --   /home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/test_runner.o
   --   -L/home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/
   --   -L/home/tof/research/current/spark-by-example/spark-by-example/non-mutating/tests/harness/
   --   -L/opt/gnat-gpl-2017-x86_64-linux-bin/lib/aunit/
   --   -L/home/tof/research/current/spark-by-example/spark-by-example/non-mutating/obj/
   --   -L/opt/gnat-gpl-2017-x86_64-linux-bin/lib/gcc/x86_64-pc-linux-gnu/6.3.1/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
