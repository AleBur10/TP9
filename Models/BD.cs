using System.Runtime.InteropServices.ComTypes;
using System.IO.Compression;
using System.Security.Cryptography;
using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Linq;
using Dapper;
using System.Data.SqlClient;



namespace TP9.Models
{
    public class BD
    {

        private static string _connectionString = @"Server=A-PHZ2-CIDI-005; DataBase=DeltaGames;Trusted_Connection=True;";

        private static List<Juegos> listaJuegos = new List<Juegos>();

        public static List<Juegos> TraerJuegos(int idJ)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * from Juegos where IdJuego = @pidJuego";
                listaJuegos = db.Query<Juegos>(sql, new { pidJuego = idJ }).ToList();
            }
            return listaJuegos;
        }
        public static Series verInfoJuego(int idJ)
        {
            Juego juegoActual = null;
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Juegos WHERE IdJuego = @pidJuego";
                juegoActual = db.QueryFirstOrDefault<Series>(sql, new { pidJuego = idJ });
            }
            return juegoActual;
        }

    }
}