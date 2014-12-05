using Employee.DAL;
using Employee.SharedObjects;
using System.Collections.Generic;

namespace Employee.BLL
{
    public class Employee
    {
        /// <summary>
        /// fetch list of all employees
        /// </summary>
        /// <returns>list of employees</returns>
        public static List<EmployeeDTO> GetAllEmployees()
        {
            return EmployeeManager.GetAllEmployees();
        }
        /// <summary>
        /// fetch information about a single employee
        /// </summary>
        /// <param name="employeeId">employee id whose info is to be fetched</param>
        /// <returns>object to EmployeeDTO</returns>
        public static EmployeeDTO GetEmployee(int employeeId)
        {
            return EmployeeManager.GetEmployee(employeeId);

        }
        /// <summary>
        /// Insert the Employee details
        /// </summary>
        /// <param name="employeeDetails">object to the EmployeeDTO contaning the values</param>
        public static void InsertEmployee(EmployeeDTO employeeDetails)
        {
            EmployeeManager.InsertEmployee(employeeDetails);
        }
        /// <summary>
        /// updates the details of an employee
        /// </summary>
        /// <param name="employeeDetails">object to the EmployeeDTO containing the values</param>
        public static void UpdateEmployee(EmployeeDTO employeeDetails)
        {
            EmployeeManager.UpdateEmployee(employeeDetails);
        }
        /// <summary>
        /// deletes an employee
        /// </summary>
        /// <param name="employeeId">employee id who is to be deleted</param>
        public static void DeleteEmployee(int employeeId)
        {
            EmployeeManager.DeleteEmployee(employeeId);
        }
    }
}
