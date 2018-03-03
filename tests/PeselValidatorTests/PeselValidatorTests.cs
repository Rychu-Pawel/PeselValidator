using Rychusoft.Validators;
using System;
using Xunit;

namespace PeselValidatorTests
{
    public class PeselValidatorTests
    {
        [Theory]
        [InlineData("77091712516")]
        [InlineData("00322331154")]
        [InlineData("55061623457")]
        [InlineData("47090849759")]
        [InlineData("65102875514")]
        [InlineData("61111218221")]
        [InlineData("82071567835")]
        [InlineData("95011135953")]
        [InlineData("76080395716")]
        [InlineData("86073041155")]
        [InlineData("00010176876")]
        [InlineData("00210127847")]
        [InlineData("00410182631")]
        [InlineData("59031881124")]
        [InlineData("43020886142")]
        [InlineData("94021689685")]
        [InlineData("13323111795")]
        public void IsValid_ValidPeselsTest(string pesel)
        {
            Assert.True(PeselValidator.IsValid(pesel));
        }

        [Theory]
        [InlineData("7709171251")]
        [InlineData("003223311")]
        [InlineData("55061623")]
        [InlineData("4709084")]
        [InlineData("651028")]
        [InlineData("61111")]
        [InlineData("8207")]
        [InlineData("950")]
        [InlineData("76")]
        [InlineData("8")]
        public void IsValid_TooShortPeselsTest(string pesel)
        {
            Assert.False(PeselValidator.IsValid(pesel));
        }

        [Theory]
        [InlineData(null)]
        [InlineData("")]
        public void IsValid_EmptyPeselsTest(string pesel)
        {
            Assert.False(PeselValidator.IsValid(pesel));
        }

        [Theory]
        [InlineData("770917125161")]
        [InlineData("0032233115412")]
        [InlineData("55061623457333")]
        [InlineData("470908497593456")]
        [InlineData("65102875514456456")]
        [InlineData("6111121822146786787")]
        public void IsValid_TooLongPeselsTest(string pesel)
        {
            Assert.False(PeselValidator.IsValid(pesel));
        }

        [Theory]
        [InlineData("17097712516")]
        [InlineData("23320031154")]
        [InlineData("16065523457")]
        public void IsValid_WrongDatesValidPeselsTest(string pesel)
        {
            Assert.False(PeselValidator.IsValid(pesel));
        }

        [Theory]
        [InlineData("           ")]
        [InlineData("          0")]
        [InlineData("0          ")]
        [InlineData("      0    ")]
        [InlineData(";ierhf;iadr")]
        [InlineData("00000000000")]
        [InlineData("11111111111")]
        [InlineData("10101010101")]
        [InlineData("01010101010")]
        [InlineData("aaaaaaaaaaa")]
        [InlineData(";lizsedujrh")]
        [InlineData("99999999999")]
        public void IsValid_MonkeyInvalidPeselsTest(string pesel)
        {
            Assert.False(PeselValidator.IsValid(pesel));
        }
    }
}
