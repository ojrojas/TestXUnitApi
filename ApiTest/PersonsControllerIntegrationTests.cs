using FluentAssertions;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Api;
using Api.Models;
using Xunit;

namespace ApiTest.Tests
{
    public class PersonsControllerIntegrationTests
    {
        private readonly TestServer _server;
        private readonly HttpClient _client;

        public PersonsControllerIntegrationTests()
        {
            //Arrange
            _server = new TestServer(new WebHostBuilder()
            .UseStartup<Startup>());
            _client = _server.CreateClient();
        }

        [Fact]
        public async Task Persons_Get_All()
        {
            //Act
            var response = await _client.GetAsync("/api/Persons");
            response.EnsureSuccessStatusCode();
            var responseString = await response.Content.ReadAsStringAsync();

            //Assert
            var persons = JsonConvert.DeserializeObject<IEnumerable<Person>>(responseString);
            persons.Count().Should().Be(50);
        }

        [Fact]
        public async Task Persons_Get_Specific()
        {
            //Act
            var response = await _client.GetAsync("/api/Persons/16");
            response.EnsureSuccessStatusCode();
            var responseString = await response.Content.ReadAsStringAsync();

            //Assert
            var person = JsonConvert.DeserializeObject<Person>(responseString);
            person.Id.Should().Be(16);
        }

        [Fact]
        public async Task Persons_Post()
        {
            //Arrange
            var personToAdd = new Person
            {
                FirstName = "Vilma",
                LastName = "Muñoz",
                Age = 50,
                Title = "HttpPost",
                Phone = "001 123 1234567",
                Email = "vilma.muñoz@httppost.com"
            };
            var content = JsonConvert.SerializeObject(personToAdd);
            var stringContent = new StringContent(content, Encoding.UTF8, "application/json");

            //Act
            var response = await _client.PostAsync("/api/Persons", stringContent);

            //Assert
            response.EnsureSuccessStatusCode();
            var responseString = await response.Content.ReadAsStringAsync();
            var person = JsonConvert.DeserializeObject<Person>(responseString);
            person.Id.Should().Be(51);
        }

        [Fact]
        public async Task Persons_Post_Invalid()
        {
            //Arrange
            var personToAdd = new Person { FirstName = "Vilma" };
            var content = JsonConvert.SerializeObject(personToAdd);
            var stringContent = new StringContent(content, Encoding.UTF8, "application/json");

            //Act
            var response = await _client.PostAsync("/api/Persons", stringContent);

            //Assert
            response.StatusCode.Should().Be(System.Net.HttpStatusCode.BadRequest);
            var responseString = await response.Content.ReadAsStringAsync();
            responseString.Should().Contain("The Email field is required")
              .And.Contain("The LastName field is required")
              .And.Contain("The Phone field is required");
        }

        [Fact]
        public async Task Persons_Put()
        {
            //Arrange
            var personToChange = new Person
            {
                Id = 16,
                FirstName = "Oscar",
                LastName = "Garces",
                Age = 50,
                Title = "HttpPut",
                Phone = "001 123 1234567",
                Email = "oscar.garces@httpput.com"
            };
            var content = JsonConvert.SerializeObject(personToChange);
            var stringContent = new StringContent(content, Encoding.UTF8, "application/json");

            //Act
            var response = await _client.PutAsync("/api/Persons/16", stringContent);

            //Assert
            response.EnsureSuccessStatusCode();
            var responseString = await response.Content.ReadAsStringAsync();
            responseString.Should().Be(String.Empty);
        }

        [Fact]
        public async Task Persons_Put_Invalid()
        {
            //Arrange
            var personToChange = new Person { FirstName = "Oscar" };
            var content = JsonConvert.SerializeObject(personToChange);
            var stringContent = new StringContent(content, Encoding.UTF8, "application/json");

            //Act
            var response = await _client.PutAsync("/api/Persons/16", stringContent);

            //Assert
            response.StatusCode.Should().Be(System.Net.HttpStatusCode.BadRequest);
            var responseString = await response.Content.ReadAsStringAsync();
            responseString.Should().Contain("The Email field is required")
              .And.Contain("The LastName field is required")
              .And.Contain("The Phone field is required");
        }

        [Fact]
        public async Task Persons_Delete()
        {
            //Arrange

            //Act
            var response = await _client.DeleteAsync("/api/Persons/16");

            //Assert
            response.EnsureSuccessStatusCode();
            var responseString = await response.Content.ReadAsStringAsync();
            responseString.Should().Be(String.Empty);
        }


    }
}
