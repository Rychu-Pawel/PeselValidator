using System;
using System.Linq;

namespace Rychusoft.Validators
{
    public static class PeselValidator
    {
        private static int[] weights = { 9, 7, 3, 1, 9, 7, 3, 1, 9, 7 };

        public static bool IsValid(string pesel)
        {
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
            var day = int.Parse(pesel.Substring(4, 2));

            return 1 <= day && day <= 31;
        }

        private static bool IsEmptyOrNotProperLength(string pesel)
        {
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
            var sum = weights.Select((x, i) => x * (int) char.GetNumericValue(pesel[i])).Sum();

            return sum % 10;
        }
    }
}
