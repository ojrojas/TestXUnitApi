using FluentAssertions;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Api.Controllers;
using Api.Models;
using Api.Services;
using Xunit;

namespace ApiTest.Tests
{
    public class PersonsControllerUnitTests
    {
        [Fact]
        public async Task Get_All()
        {
            //Arrange
            var controller = new PersonsController(new PersonService());

            //Act
            var result = await controller.Get();

            //Assert
            var okResult = result.Should().BeOfType<OkObjectResult>().Subject;
            var persons = okResult.Value.Should().BeAssignableTo<IEnumerable<Person>>().Subject;

            persons.Count().Should().Be(50);
        }

        [Fact]
        public async Task Get_Specific()
        {
            //Arrange
            var controller = new PersonsController(new PersonService());

            //Act
            var result = await controller.Get(16);

            //Assert
            var okResult = result.Should().BeOfType<OkObjectResult>().Subject;
            var person = okResult.Value.Should().BeAssignableTo<Person>().Subject;
            person.Id.Should().Be(16);
        }

        [Fact]
        public async Task Persons_Add()
        {
            //Arrange
            var controller = new PersonsController(new PersonService());
            var newPerson = new Person
            {
                FirstName = "Nicole",
                LastName = "Garces",
                Age = 50,
                Title = "AddPerson",
                Email = "nicole.garces@addperson.com"
            };

            //Act
            var result = await controller.Post(newPerson);

            //Assert
            var okResult = result.Should().BeOfType<CreatedAtActionResult>().Subject;
            var person = okResult.Value.Should().BeAssignableTo<Person>().Subject;
            person.Id.Should().Be(51);
        }

        [Fact]
        public async Task Persons_Update()
        {
            //Arrange
            var service = new PersonService();
            var controller = new PersonsController(service);
            var newPerson = new Person
            {
                FirstName = "Pepito",
                LastName = "Perez",
                Age = 50,
                Title = "UpdatePerson",
                Email = "pepito.perez@updateperson.com"
            };

            //Act
            var result = await controller.Put(20, newPerson);

            //Assert
            var okResult = result.Should().BeOfType<NoContentResult>().Subject;

            var person = service.Get(20);
            person.Id.Should().Be(20);
            person.FirstName.Should().Be("Pepito");
            person.LastName.Should().Be("Perez");
            person.Age.Should().Be(50);
            person.Title.Should().Be("UpdatePerson");
            person.Email.Should().Be("pepito.perez@updateperson.com");
        }

        [Fact]
        public async Task Persons_Delete()
        {
            //Arrange
            var service = new PersonService();
            var controller = new PersonsController(service);

            //Act
            var result = await controller.Delete(20);

            //Assert
            var okResult = result.Should().BeOfType<NoContentResult>().Subject;

            // should throw an eception, 
            // because the person with id==20 doesn't exist enymore
           Assert.Throws<InvalidOperationException>(
              () => service.Get(20));
        }

        [Fact]
        public async Task Persons_Get_From_Moq()
        {
            //Arrange
            var serviceMock = new Mock<IPersonService>();
            serviceMock.Setup(x => x.GetAll()).Returns(() => new List<Person>
                {
                    new Person{Id=1, FirstName="Oscar", LastName="Rojas"},
                    new Person{Id=2, FirstName="Vilma", LastName="Muñoz"},
                    new Person{Id=3, FirstName="Nicole", LastName="Rojas"},
                });
            var controller = new PersonsController(serviceMock.Object);

            //Act
            var result = await controller.Get();

            //Assert
            var okResult = result.Should().BeOfType<OkObjectResult>().Subject;
            var persons = okResult.Value.Should().BeAssignableTo<IEnumerable<Person>>().Subject;

            persons.Count().Should().Be(3);
        }
    }
}
