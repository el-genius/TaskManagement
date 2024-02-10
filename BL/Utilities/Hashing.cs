﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL.Utilities
{
     public class Hashing
     {
          private static string GetRandomSalt()
          {
               return BCrypt.Net.BCrypt.GenerateSalt(8);
          }

          public static string HashPassword(string password)
          {
               return BCrypt.Net.BCrypt.HashPassword(password, GetRandomSalt());
          }

          public static bool ValidatePassword(string password, string correctHash)
          {
               return BCrypt.Net.BCrypt.Verify(password, correctHash);
          }
     }
}
