using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Api.Models;
using Api.Services;

namespace Api.Controllers
{
    [Produces("application/json")]
    [Route("api/Persons")]
    public class PersonsController : Controller
    {
        private IPersonService _personService;

        public PersonsController(IPersonService personService)
        {
            _personService = personService;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var models = await Task.Run(()=> _personService.GetAll()); 
           
            return Ok(models);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var model =await Task.Run(()=> _personService.Get(id));
            return Ok(model);
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody]Person model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var person =await Task.Run(()=> _personService.Add(model));

            return CreatedAtAction("Get", new { id = person.Id }, person);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody]Person model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

           await Task.Run(()=> _personService.Update(id, model));
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await Task.Run(()=>_personService.Delete(id));
            return NoContent();
        }
    }
}