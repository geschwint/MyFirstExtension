report 123456701 "Seminar Participant List"
{
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SeminarRegistrationList.rdl';

    dataset
    {
        dataitem("Seminar Registration Header";"Seminar Registration Header")
        {
            column(No_;"No.")
            {
                IncludeCaption = true;
            }
            column(Seminar_No_;"Seminar No.")
            {
                IncludeCaption = true;
            }
            column(Seminar_Name;"Seminar Name")
            {
                IncludeCaption = true;
            }
            column(Starting_Date;"Starting Date")
            {
                IncludeCaption = true;
            }
            column(Duration;Duration)
            {
                IncludeCaption = true;
            }
            column(Instructor_Name;"Instructor Name")
            {
                IncludeCaption = true;
            }
            column(Room_Name;"Room Name")
            {
                IncludeCaption = true;
            }
            dataitem("Seminar Registration Line";"Seminar Registration Line")
            {
                DataItemLink = "Document No."=field("No.");
                DataItemTableView = sorting("Document No.","Line No.");
                column(Bill_to_Customer_No_;"Bill-to Customer No.")
                {
                    IncludeCaption = true;
                }
                column(Participant_Contact_No_;"Participant Contact No.")
                {
                    IncludeCaption = true;
                }
                column(Participant_Name;"Participant Name")
                {
                    IncludeCaption = true;
                }
            }
        }
        dataitem("Company Information";"Company Information")
        {
            column(Picture;Picture)
            {
                IncludeCaption = true;
            }
            // This is a function in the Company Information table
            column(CompanyName;CompanyName)
            {
            }

        }
    }   
    labels
    {
        SeminarRegistrationHeaderCap = 'Seminar Reg.- Participant List';
    } 
}