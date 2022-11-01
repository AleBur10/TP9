using System.ComponentModel.DataAnnotations;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP9.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
namespace TP9.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private IWebHostEnvironment Environment;

    public HomeController(IWebHostEnvironment environment)
    {
        Environment = environment;
    }

    public IActionResult Index()
    {
        return View("IniciarSesion");
    }

    public IActionResult PaginaPrincipal()
    {
        ViewBag.listaJuegos = BD.TraerJuegos();
       
        return View("Index");
    }

    public Juego MostrarJuegosAjax(int IdJuego)
    {
        return BD.verInfoJuego(IdJuego);
    }

    public IActionResult AgregarJuego(int IdJuego)
    {
        ViewBag.listaCategorias = BD.TraerCategorias();
        ViewBag.Juego = IdJuego;
        return View();
    }
    public IActionResult GuardarJuego(Juego Jue, IFormFile Imagen)
    {
        if (Imagen.Length > 0)
        {
            string wwwRootLocal = this.Environment.ContentRootPath + @"\wwwroot\" + Imagen.FileName;
            using (var stream = System.IO.File.Create(wwwRootLocal))
            {
                Imagen.CopyTo(stream);
            }
            Jue.Imagen = Imagen.FileName;
        }
        BD.AgregarJuego(Jue);
        ViewBag.detalleJuegos = BD.verInfoJuego(Jue.IdJuego);
        ViewBag.listaJuegos = BD.TraerJuegos();
        return View("Index");
    }
    
        public Juego MostrarMasInfoAjax(int IdJuego)
        {
            return BD.verInfoJuego(IdJuego);
        }

        public IActionResult LikesAjax(int IdJuego)
        {   
            ViewBag.Juego = IdJuego;
            return View("Index");
        }

        public IActionResult CrearCuentaAjax(Usuario usuario)
        {
            BD.AgregarUsuario(usuario);
            //no se que poner
            return View("Index");

        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
