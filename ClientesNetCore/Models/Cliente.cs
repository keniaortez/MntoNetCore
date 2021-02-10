using System;
using System.Collections.Generic;

#nullable disable

namespace ClientesNetCore.Models
{
    public partial class Cliente
    {
        public int IdCliente { get; set; }
        public string Identificacion { get; set; }
        public string PrimerNombre { get; set; }
        public string PrimerApellido { get; set; }
        public int? Edad { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
