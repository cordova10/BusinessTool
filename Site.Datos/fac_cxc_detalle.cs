//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Site.Datos
{
    using System;
    using System.Collections.Generic;
    
    public partial class fac_cxc_detalle
    {
        public int cde_id { get; set; }
        public Nullable<int> cde_cuenta { get; set; }
        public Nullable<System.DateTime> cde_fecha { get; set; }
        public Nullable<decimal> cde_abono { get; set; }
        public string cde_no_documento { get; set; }
        public Nullable<System.DateTime> cde_fecha_tran { get; set; }
        public Nullable<int> cde_usuario_tran { get; set; }
    
        public virtual fac_cxc fac_cxc { get; set; }
    }
}
