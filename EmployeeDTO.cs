using System;

namespace Employee.SharedObjects
{
    /// <summary>
    /// EmployeeDTO contains automated properties for data sharing
    /// </summary>
    public class EmployeeDTO
    {
        public EmployeeDTO()
        {

        }
        public int EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public decimal PhoneNumber { get; set; }
    }
}
