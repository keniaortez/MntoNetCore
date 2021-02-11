using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ClientesNetCore.Models;
using Microsoft.EntityFrameworkCore.Storage;


namespace ClientesNetCore.Controllers
{
    public class ClientesController : Controller
    {
        ////private readonly MantenimientoContext _Cnn;
        ////public ClientesController(MantenimientoContext Cnstr) 
        ////{
        ////    _Cnn = Cnstr;
        ////}
        MantenimientoContext db = new MantenimientoContext();
        public IActionResult Index()
        {
            var data = db.Clientes;
            return View(data);
            
        }

        //////Detalle cliente sin datos
        ////[HttpGet]
        ////public ActionResult Index()
        ////{
        ////    ListaClientes cliente = new ListaClientes();
        ////    cliente.BuscarClientes(-1);
        ////    return View(cliente);
        ////}

        //////Detalle Clientes con ActionResult
        ////[HttpGet]
        ////public ActionResult DetalleCliente(int IdCliente)
        ////{
        ////    ListaClientes cliente = new ListaClientes();
        ////    cliente.BuscarClientes(IdCliente);
        ////    return View(cliente);
        ////}


        //Crear nuevo cliente
        [HttpGet]
        public ActionResult CrearCliente()
        {
            //Cliente model = new Cliente();
            //model._FechaCreacion = DateTime.Now;
            //return View(model);
            return View();
        }


        //////Con los datos
        ////[HttpPost]
        //////[ValidateAntiForgeryToken]
        ////public ActionResult CrearCliente(Cliente modelo)
        ////{
        ////    //Boolean insert = modelo.InsertClientes();
        ////    //if (insert)
        ////    //{
        ////    //    return RedirectToAction("Index");
        ////    //}
        ////    //else
        ////    //{
        ////    //    return View(modelo);
        ////    //}
        ////    _Cnn.Add(modelo);
        ////    _Cnn.SaveChanges();
        ////    ViewBag.message = "Cliente " +modelo.PrimerNombre +" " + modelo.PrimerApellido + " creado";
        ////    return View();
        ////}


        ////////////Modificar cliente - mostrar los datos
        //////////[HttpGet]
        //////////public ActionResult ModificarClientes(int IdCliente)
        //////////{
        //////////    if (ModelState.IsValid)
        //////////    {
        //////////        Cliente clie = new Cliente();
        //////////        clie._FechaModificacion = DateTime.Now.ToShortDateString(); ;
        //////////        clie.GetCliente(IdCliente);
        //////////        return View(clie);

        //////////    }
        //////////    else
        //////////    {
        //////////        return RedirectToAction("Index");
        //////////    }

        //////////}

        ////////////Modificar cliente - para llamar la funcion de modificación
        //////////[HttpPost]
        //////////public ActionResult ModificarClientes(Cliente model)
        //////////{
        //////////    Boolean modificar = model.ActualizarClientes();
        //////////    if (modificar)
        //////////    {
        //////////        return RedirectToAction("Index");
        //////////    }
        //////////    else
        //////////    {
        //////////        return View(model);
        //////////    }

        //////////}

        ////////////Eliminar cliente
        //////////[HttpGet]
        //////////public ActionResult EliminarCliente(int IdCliente)
        //////////{

        //////////    if (ModelState.IsValid)
        //////////    {
        //////////        Cliente clie = new Cliente();
        //////////        clie.GetCliente(IdCliente);
        //////////        return View(clie);

        //////////    }
        //////////    else
        //////////    {
        //////////        Cliente clie = new Cliente();
        //////////        clie.GetCliente(IdCliente);
        //////////        return View(clie);
        //////////    }

        //////////}

        ////////////Para llamar la funcion de eliminar
        //////////[HttpPost]
        //////////public ActionResult EliminarCliente(Cliente model)
        //////////{
        //////////    Boolean eliminar = model.EliminarClientes();
        //////////    if (eliminar)
        //////////    {
        //////////        return RedirectToAction("Index");
        //////////    }
        //////////    else
        //////////    {
        //////////        return View(model);
        //////////    }
        //////////}

    }
}
