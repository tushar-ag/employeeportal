//-----------------------------------------------------------------------
// <copyright file="EmployeeManager.cs" company="Nagarro Softwares Pvt. Ltd">
//     Copyright (c) Nagarro Softwares Pvt. Ltd. All rights reserved.
// </copyright>
// <author>Tushar Agarwal</author>
//-----------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;




namespace Nagarro.EmployeePortal.DAL
{
    /// <summary>
    /// EmployeeManager defined all the required methods for CRUD operations on the [EmployeePortal].[Employee] table
    /// </summary>
    public class EmployeeManager
    {
        public struct Employee
        {
            public int employeeId;
            public string employeeCode;
            public string firstName;
            public string lastName;
            public DateTime dob;
            public string email;
            public int deptId;
            public string deptName;
            public DateTime dateOfJoining;
            public string loginName;
            public string password;
            public char role;
        }
       /// <summary>
        /// GetEmployee method calls a stored procedure to return the Employee object containing the all information of a particular Employee based on EmployeeId
       /// </summary>
        /// <param name="employeeId">id of the Employee whose details are to be find out</param>
       /// <returns></returns>

      public static Employee GetEmployee(int employeeId)
        
      {
            Employee employeeData = new Employee();
            employeeData.employeeId = employeeId;

            using (SqlConnection cn = new SqlConnection(Database.EmployeePortalString))
            {
                cn.Open();
                using (SqlCommand cm = cn.CreateCommand())
                {
                    cm.CommandText = "GetEmployee";
                    cm.CommandType = CommandType.StoredProcedure;
                    cm.Parameters.AddWithValue("@employeeId", employeeData.employeeId);
                    using (SqlDataReader dr = cm.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            employeeData = ReadEmployee(dr);
                        }
                        else
                        {
                            throw new ApplicationException(string.Format("Employee({0}) not found.", employeeData.employeeId));
                        }
                    }
                }
            }

            return employeeData;
        }
        /// <summary>
      /// GetAllEmployees method calls a stored procedure to return a list<Employee> containing all the records of the Employees table.
        /// </summary>
      /// <returns>list<Employee></returns>

        public static List<Employee> GetAllEmployees()
        {
            List<Employee> employees = new List<Employee>();

            using (SqlConnection cn = new SqlConnection(Database.EmployeePortalString))
            {
                cn.Open();
                using (SqlCommand cm = cn.CreateCommand())
                {
                    cm.CommandText = "GetAllEmployees";
                    cm.CommandType = CommandType.StoredProcedure;
                    using (SqlDataReader dr = cm.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            employees.Add(ReadEmployee(dr));
                        }
                    }
                }
            }

            return employees;
        }

        /// <summary>
        /// private method ReadEmployee to fetch the inforamtion from the table using SqlDataReader
        /// </summary>
        /// <param name="dr">SqlDataReader object</param>
        /// <returns>object to the Employee structure</returns>
        private static Employee ReadEmployee(SqlDataReader dr)
        {
            Employee employeeData = new Employee();
            employeeData.employeeId = (int)dr["EmployeeId"];
            employeeData.employeeCode = dr["EmployeeCode"] as string;
            employeeData.firstName = dr["FirstName"] as string;
            employeeData.lastName = dr["LastName"] as string;        
            employeeData.dob = (DateTime)dr["DOB"];
            if (dr["DateOfJoining"] != DBNull.Value)
                employeeData.dateOfJoining = ((DateTime)dr["DateOfJoining"]).Date;
            else
                employeeData.dateOfJoining = DateTime.MinValue.Date;
            employeeData.deptId = (int)dr["DepartmentId"];
            employeeData.deptName = dr["DepartmentName"] as string;
            employeeData.email = (string)dr["Email"];
           
            return employeeData;
        }

        /// <summary>
        /// InsertEmployee method calls a stored procedure to insert the record into the Employees table.
        /// </summary>
        /// <param name="employeeData">object containing the actual data</param>
        /// <returns>object to the Employee structure</returns>
        public static Employee InsertEmployee(Employee employeeData)
        {
            using (SqlConnection cn = new SqlConnection(Database.EmployeePortalString))
            {
                cn.Open();
                using (SqlCommand cm = cn.CreateCommand())
                {
                    cm.CommandText = "AddEmployee";
                    cm.CommandType = CommandType.StoredProcedure;
                    cm.Parameters.Add("@employeeid", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cm.Parameters.AddWithValue("@employeeCode", employeeData.employeeCode);
                    cm.Parameters.AddWithValue("@firstName", employeeData.firstName);
                    cm.Parameters.AddWithValue("@lastName", employeeData.lastName);
                    cm.Parameters.AddWithValue("@dob", employeeData.dob);
                    cm.Parameters.AddWithValue("@email", employeeData.email);
                    cm.Parameters.AddWithValue("@departmentid", employeeData.deptId);
                    cm.Parameters.AddWithValue("@dateOfJoining", employeeData.dateOfJoining);
                    cm.Parameters.AddWithValue("@password", employeeData.password);
                    cm.Parameters.AddWithValue("@loginName", employeeData.loginName);
                    cm.Parameters.AddWithValue("@role", employeeData.role);
                   // cm.ExecuteNonQuery();
                
                    employeeData.employeeId = Convert.ToInt32(cm.ExecuteScalar());
                   // employeeData.employeeId = Convert.ToInt32(cm.Parameters["@employeeid"].Value);
                    
                }
            }

            return employeeData;
        }

        /// <summary>
        /// UpdateEmployee Method calls a stored procedure to update the record values.
        /// </summary>
        /// <param name="employeeData">object containing the data requires for modification</param>
        public static void UpdateEmployee(Employee employeeData)
        {
            using (SqlConnection cn = new SqlConnection(Database.EmployeePortalString))
            {
                cn.Open();
                using (SqlCommand cm = cn.CreateCommand())
                {
                    cm.CommandText = "UpdateEmployee";
                    cm.CommandType = CommandType.StoredProcedure;
                    cm.Parameters.AddWithValue("@employeeid", employeeData.employeeId);
                    
                    cm.Parameters.AddWithValue("@firstName", employeeData.firstName);
                    cm.Parameters.AddWithValue("@lastName", employeeData.lastName);
                    cm.Parameters.AddWithValue("@dob", employeeData.dob);
                    cm.Parameters.AddWithValue("@email", employeeData.email);
                    cm.Parameters.AddWithValue("@departmentid", employeeData.deptId);
                    
                    cm.Parameters.AddWithValue("@password", employeeData.password);
                   
                    cm.ExecuteNonQuery();
                }
            }
        }
        
        /// <summary>
        /// SearchEmployee Method searches the table based on the particluar fileds
        /// </summary>
        /// <param name="employeeData">onject containing the data based on whic search is made</param>
        /// <returns>list of employees</returns>
        public static List<Employee> SearchEmployee(Employee employeeData)
        {
            List<Employee> employees = new List<Employee>();

            using (SqlConnection cn = new SqlConnection(Database.EmployeePortalString))
            {
                cn.Open();
                using (SqlCommand cm = cn.CreateCommand())
                {
                    cm.CommandText = "SearchEmployees";
                    cm.CommandType = CommandType.StoredProcedure;

                    if(!string.IsNullOrEmpty(employeeData.employeeCode))
                    cm.Parameters.AddWithValue("@employeeCode", employeeData.employeeCode);
                    if (!employeeData.dateOfJoining.Equals(DateTime.MinValue))
                    cm.Parameters.AddWithValue("@dateOfJoining", employeeData.dateOfJoining);
                    if (!string.IsNullOrEmpty(employeeData.firstName))
                    cm.Parameters.AddWithValue("@firstName", employeeData.firstName);
                    if (!string.IsNullOrEmpty(employeeData.lastName))
                    cm.Parameters.AddWithValue("@lastName", employeeData.lastName);
                    if(employeeData.deptId!=0)
                    cm.Parameters.AddWithValue("@departmentid", employeeData.deptId);


                    using (SqlDataReader dr = cm.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            employees.Add(ReadEmployee(dr));
                        }
                    }
                }
            }
            return employees;
        }

        public static void DeleteEmployee(int employeeId)
        {
            Employee employeeData = new Employee();
            employeeData.employeeId = employeeId;

            using (SqlConnection cn = new SqlConnection(Database.EmployeePortalString))
            {
                cn.Open();
                using (SqlCommand cm = cn.CreateCommand())
                {
                    cm.CommandText = "DeleteEmployee";
                    cm.CommandType = CommandType.StoredProcedure;
                    cm.Parameters.AddWithValue("@employeeId", employeeData.employeeId);

                    cm.ExecuteNonQuery();
                }
            }
        }
    }
}
