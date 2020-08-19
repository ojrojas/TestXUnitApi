using System.Collections.Generic;
using System.Linq;
using Api.Models;

namespace Api.Services
{
    public class PersonService : IPersonService
        {
            private List<Person> Persons { get; set; }

            public PersonService()
            {
                var y = 0;
                this.Persons = new List<Person>();
                for (int i = 0; i < 50; i++)
                {
                     y++;
                     this.Persons.Add(new Person { 
                         Id = y
                     });
                }
            }

            public IEnumerable<Person> GetAll()
            {
                return this.Persons;
            }

            public Person Get(int id)
            {
                return this.Persons.First(x => x.Id == id);
            }

            public Person Add(Person person)
            {
                var newid = Persons.OrderBy(x => x.Id).Last().Id + 1;
                person.Id = newid;

                this.Persons.Add(person);

                return person;
            }

            public void Update(int id, Person person)
            {
                var existing = this.Persons.First(x => x.Id == id);
                existing.FirstName = person.FirstName;
                existing.LastName = person.LastName;
                existing.Address = person.Address;
                existing.Age = person.Age;
                existing.City = person.City;
                existing.Email = person.Email;
                existing.Phone = person.Phone;
                existing.Title = person.Title;
            }

            public void Delete(int id)
            {
                var existing = this.Persons.First(x => x.Id == id);
                this.Persons.Remove(existing);
            }
        }

    
}
