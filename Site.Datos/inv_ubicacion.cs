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
    
    public partial class inv_ubicacion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public inv_ubicacion()
        {
            this.inv_producto_stock = new HashSet<inv_producto_stock>();
            this.inv_trans_detalle = new HashSet<inv_trans_detalle>();
        }
    
        public int ubi_id { get; set; }
        public string ubi_codigo { get; set; }
        public string ubi_descripcion { get; set; }
        public bool ubi_activo { get; set; }
        public System.DateTime ubi_fecha_tran { get; set; }
        public int ubi_usuario_tran { get; set; }
        public bool ubi_eliminado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<inv_producto_stock> inv_producto_stock { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<inv_trans_detalle> inv_trans_detalle { get; set; }
    }
}
