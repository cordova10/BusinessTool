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
    
    public partial class fac_pedido
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public fac_pedido()
        {
            this.fac_pedido_detalle = new HashSet<fac_pedido_detalle>();
        }
    
        public int ped_id { get; set; }
        public Nullable<int> ped_numero { get; set; }
        public Nullable<System.DateTime> ped_fecha { get; set; }
        public Nullable<int> ped_cliente { get; set; }
        public Nullable<int> ped_vendedor { get; set; }
        public Nullable<int> ped_estado { get; set; }
        public Nullable<int> ped_factura { get; set; }
        public Nullable<bool> ped_eliminado { get; set; }
        public Nullable<int> ped_usuario_tran { get; set; }
        public Nullable<System.DateTime> ped_fecha_tran { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<fac_pedido_detalle> fac_pedido_detalle { get; set; }
        public virtual fac_pedido_estado fac_pedido_estado { get; set; }
    }
}
