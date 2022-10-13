using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP9.Models;

namespace TP9.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
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

    public Juego MostrarMasInfoAjax(int IdJuego)
    {
        return BD.verInfoJuego(IdJuego);
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
