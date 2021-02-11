using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace ClientesNetCore.Models
{
    public partial class Cliente
    {
        [Key]
        public int IdCliente { get; set; }
        [Required]
        public string Identificacion { get; set; }
        [Required]
        public string PrimerNombre { get; set; }
        [Required]
        public string PrimerApellido { get; set; }
        [Required]
        public int? Edad { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
