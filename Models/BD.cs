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
        private static string _connectionString = @"Server=A-PHZ2-CIDI-028; DataBase=DeltaGames;Trusted_Connection=True;";

        private static List<Juego> listaJuegos = new List<Juego>();

        public static List<Juego> TraerJuegos()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * from Juegos";
                listaJuegos = db.Query<Juego>(sql).ToList();
            }
            return listaJuegos;
        }
        public static Juego verInfoJuego(int idJ)
        {
            Juego juegoActual = null;
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Juegos WHERE IdJuego = @pidJuego";
                juegoActual = db.QueryFirstOrDefault<Juego>(sql, new { pidJuego = idJ });
            }
            return juegoActual;
        }
        public static int AgregarJuego(Juego Jug)
        {
            int registrosInsertados = 0;
            string sql = "INSERT INTO Juego(IdJuego, Nombre, CantLikes, Descripcion, FechaCreacion, Imagen, Precio) VALUES(@IdJuego, @Nombre, @CantLikes, @Descripcion, @FechaCreacion, @Imagen, @Precio)";

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                registrosInsertados = db.Execute(sql, new { IdJuego = Jug.IdJuego, Nombre = Jug.Nombre, CantLikes = Jug.CantLikes, Descripcion = Jug.Descripcion, FechaCreacion = Jug.FechaCreacion, Imagen = Jug.Imagen, Precio = Jug.Precio });
            }
            return registrosInsertados;
        }

        public static int AgregarLikes(int idJ)
        {
            int registrosInsertados = 0;
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "UPDATE Juegos SET CantLikes = (CantLikes + 1) WHERE IdJuego = @pidJuego";
                registrosInsertados = db.Execute(sql, new {pIdJuego = idJ});
            }
            return registrosInsertados;
        }
    }
}