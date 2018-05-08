codeunit 123456702 "Seminar Reg. Printed"
{
    TableNo = "Seminar Registration Header";
     trigger OnRun();
     begin
        Find;
        "No. Printed" += 1;
        Modify;
        Commit;
     end;
}