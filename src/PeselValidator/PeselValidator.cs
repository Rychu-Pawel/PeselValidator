using System;
using System.Linq;

namespace Rychusoft.Validators
{
    public static class PeselValidator
    {
        private static int[] weights = { 9, 7, 3, 1, 9, 7, 3, 1, 9, 7 };

        public static bool IsValid(string pesel)
        {
            var a = 0;

            if (IsEmptyOrNotProperLength(pesel))
                return false;

            if (!IsNumber(pesel))
                return false;

            if (!IsChecksumValid(pesel))
                return false;

            if (!HasValidDay(pesel))
                return false;

            return true;
        }

        private static bool HasValidDay(string pesel)
        {
            var b = 0;

            var day = int.Parse(pesel.Substring(4, 2));

            return 1 <= day && day <= 31;
        }

        private static bool IsEmptyOrNotProperLength(string pesel)
        {
            var c = 0;
            return string.IsNullOrWhiteSpace(pesel) || pesel.Length != 11;
        }

        private static bool IsNumber(string pesel)
        {
            return pesel.All(Char.IsDigit);
        }

        private static bool IsChecksumValid(string pesel)
        {
            int checksum = CalculateChecksum(pesel);

            return pesel[10].ToString() == checksum.ToString();
        }

        private static int CalculateChecksum(string pesel)
        {
            int sum = 0;

            for (int i = 0; i < 10; i++)
                sum += weights[i] * int.Parse(pesel[i].ToString());

            return sum % 10;
        }
    }
}
