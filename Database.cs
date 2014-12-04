using System.Configuration;

namespace Nagarro.EmployeePortal.DAL
{
    public class Database
    {
        public static string EmployeePortalString
        {
            get
            {
               return ConfigurationManager.ConnectionStrings["EmployeePortalString"].ConnectionString;
                //return @"Server=tushar3330;DataBase=EmployeePortal;Trusted_Connection=Yes;";
            }
        }
    }
}
