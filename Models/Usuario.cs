using System;

namespace TP9.Models
{
    public class Usuario
    {
        private int _idUsuario;
        private string _nombre;
        private DateTime _fechaHora;

        public Usuario(int IdUsuario, string Nombre, DateTime FechaHora)
        {
            _idUsuario = IdUsuario;
            _nombre = Nombre;
            _fechaHora = FechaHora;
        }
        public Usuario() { }
        public int IdUsuario
        {
            get { return _idUsuario; }
            set { _idUsuario = value; }
        }

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        public DateTime FechaHora
        {
            get { return _fechaHora; }
            set { _fechaHora = value; }
        }

    }
}