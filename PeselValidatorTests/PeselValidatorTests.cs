using NUnit.Framework;
using Rychusoft.Validators;

namespace Tests
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        [TestCase("77091712516")]
        [TestCase("00322331154")]
        [TestCase("55061623457")]
        [TestCase("47090849759")]
        [TestCase("65102875514")]
        [TestCase("61111218221")]
        [TestCase("82071567835")]
        [TestCase("95011135953")]
        [TestCase("76080395716")]
        [TestCase("86073041155")]
        [TestCase("00010176876")]
        [TestCase("00210127847")]
        [TestCase("00410182631")]
        [TestCase("59031881124")]
        [TestCase("43020886142")]
        [TestCase("94021689685")]
        [TestCase("13323111795")]
        public void IsValid_ValidPeselsTest(string pesel)
        {
            Assert.IsTrue(PeselValidator.IsValid(pesel));
        }

        [Test]
        [TestCase("7709171251")]
        [TestCase("003223311")]
        [TestCase("55061623")]
        [TestCase("4709084")]
        [TestCase("651028")]
        [TestCase("61111")]
        [TestCase("8207")]
        [TestCase("950")]
        [TestCase("76")]
        [TestCase("8")]
        public void IsValid_TooShortPeselsTest(string pesel)
        {
            Assert.IsFalse(PeselValidator.IsValid(pesel));
        }

        [Test]
        [TestCase(null)]
        [TestCase("")]
        public void IsValid_EmptyPeselsTest(string pesel)
        {
            Assert.IsFalse(PeselValidator.IsValid(pesel));
        }

        [Test]
        [TestCase("770917125161")]
        [TestCase("0032233115412")]
        [TestCase("55061623457333")]
        [TestCase("470908497593456")]
        [TestCase("65102875514456456")]
        [TestCase("6111121822146786787")]
        public void IsValid_TooLongPeselsTest(string pesel)
        {
            Assert.IsFalse(PeselValidator.IsValid(pesel));
        }

        [Test]
        [TestCase("17097712516")]
        [TestCase("23320031154")]
        [TestCase("16065523457")]
        public void IsValid_WrongDatesValidPeselsTest(string pesel)
        {
            Assert.IsFalse(PeselValidator.IsValid(pesel));
        }

        [Test]
        [TestCase("           ")]
        [TestCase("          0")]
        [TestCase("0          ")]
        [TestCase("      0    ")]
        [TestCase(";ierhf;iadr")]
        [TestCase("00000000000")]
        [TestCase("11111111111")]
        [TestCase("10101010101")]
        [TestCase("01010101010")]
        [TestCase("aaaaaaaaaaa")]
        [TestCase(";lizsedujrh")]
        [TestCase("99999999999")]
        public void IsValid_MonkeyInvalidPeselsTest(string pesel)
        {
            Assert.IsFalse(PeselValidator.IsValid(pesel));
        }
    }
}