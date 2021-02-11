using ClientesNetCore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace ClientesNetCore.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
        MantenimientoContext db = new MantenimientoContext();
        public IActionResult Index()
        {
            var data = db.Clientes;
            return View(data);
        }
        //private readonly MantenimientoContext _Cnn;
        //public HomeController(MantenimientoContext Cnstr)
        //{
        //    _Cnn = Cnstr;
        //}
        
        [HttpGet]
        public IActionResult CrearCliente() 
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CrearCliente(Cliente clie) 
        {
           
            db.Add(clie);
            db.SaveChanges();
            ViewBag.message = "Cliente " + clie.PrimerNombre + " " + clie.PrimerApellido + " creado";
            //return View();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult DetalleCliente()
        {
            return View();
            //var data = db.Clientes;
            //return View(data);
        }

        [HttpGet]
        public IActionResult ModificarCliente()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ModificarCliente(Cliente clie)
        {
            db.Update(clie);            
            db.SaveChanges();
            ViewBag.message = "Cliente " + clie.PrimerNombre + " " + clie.PrimerApellido + " actualizado";
            //turn View();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult EliminarCliente()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EliminarCliente(Cliente clie)
        {            
            db.Remove(clie);
            db.SaveChanges();
            ViewBag.message = "Cliente " + clie.PrimerNombre + " " + clie.PrimerApellido + " actualizado";
            //turn View();
            return RedirectToAction("Index");
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
