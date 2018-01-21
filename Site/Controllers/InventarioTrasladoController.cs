using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Site.Datos;
using Site.Models;
using Site.Helpers;

namespace Site.Controllers
{
    public class InventarioTrasladoController : Controller
    {
        private DBEntities db = new DBEntities();

        // GET: Producto
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult _List(int page = 1, int pageSize = 10, string filter = "")
        {
            GenericResultElements<inv_producto_stock> model = new GenericResultElements<inv_producto_stock>();
            GenericVM<inv_producto_stock> modelo = new GenericVM<inv_producto_stock>() { };


            model.ListElements = db.inv_producto_stock.Include(i => i.inv_producto).Include(i => i.inv_ubicacion)
                                 .OrderBy(x=>x.inv_producto.pro_codigo)
                                 .Skip((page - 1) * pageSize).Take(pageSize)
                                 .ToList();
            model.Total = db.inv_producto_stock.Count();

            modelo = new Models.GenericVM<inv_producto_stock>
            {
                filter = filter,
                Lista = model.ListElements,
                paging = new PagingInfo { CurrentPage = page, ItemsPerPage = pageSize, TotalItems = model.Total }
            };

            return PartialView("_List", modelo);
        }

        // GET: Producto/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_producto inv_producto = db.inv_producto.Find(id);
            if (inv_producto == null)
            {
                return HttpNotFound();
            }
            return View(inv_producto);
        }

        // GET: Producto/Create
        public ActionResult Create()
        {
            ViewBag.pro_tipo = new SelectList(db.inv_producto_tipo, "pti_id", "pti_descripcion");
            ViewBag.pro_proveedor = new SelectList(db.inv_proveedor, "prv_id", "prv_nombre");
            ViewBag.pro_unidad_medida = new SelectList(db.inv_unidad_medida, "uni_id", "uni_descripcion");
            return View();
        }

        // POST: Producto/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "pro_id,pro_codigo,pro_descripcion,pro_unidad_medida,pro_tipo,pro_existencia_min,pro_existencia_max,pro_proveedor,pro_activo,pro_fecha_tran,pro_usuario_tran,pro_eliminado")] inv_producto inv_producto)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    inv_producto.pro_fecha_tran = DateTime.Now.Date;
                    db.inv_producto.Add(inv_producto);
                    db.SaveChanges();
                    return Json(new { success = true });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
        }

            ViewBag.pro_tipo = new SelectList(db.inv_producto_tipo, "pti_id", "pti_descripcion", inv_producto.pro_tipo);
            ViewBag.pro_proveedor = new SelectList(db.inv_proveedor, "prv_id", "prv_nombre", inv_producto.pro_proveedor);
            ViewBag.pro_unidad_medida = new SelectList(db.inv_unidad_medida, "uni_id", "uni_descripcion", inv_producto.pro_unidad_medida);
            return PartialView("Create", inv_producto);
        }

        // GET: Producto/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_producto_stock inv_producto = db.inv_producto_stock.Include(x=>x.inv_ubicacion).Include(x => x.inv_producto).FirstOrDefault(x=>x.sto_id==id.Value);
            if (inv_producto == null)
            {
                return HttpNotFound();
            }
            var modelo = new ProductoUbicacion
            {
                producto= inv_producto                
            };
            ViewBag.listaUbicaciones = db.inv_ubicacion.Where(x=>x.ubi_activo==true).ToList();
            return View(modelo);
        }

        // POST: Producto/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "pro_id,pro_codigo,pro_descripcion,pro_unidad_medida,pro_tipo,pro_existencia_min,pro_existencia_max,pro_proveedor,pro_activo,pro_fecha_tran,pro_usuario_tran,pro_eliminado")] inv_producto inv_producto)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    inv_producto.pro_fecha_tran = DateTime.Now.Date;
                    db.Entry(inv_producto).State = EntityState.Modified;
                    db.SaveChanges();
                    return Json(new { success = true });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
            }
            ViewBag.pro_tipo = new SelectList(db.inv_producto_tipo, "pti_id", "pti_descripcion", inv_producto.pro_tipo);
            ViewBag.pro_proveedor = new SelectList(db.inv_proveedor, "prv_id", "prv_nombre", inv_producto.pro_proveedor);
            ViewBag.pro_unidad_medida = new SelectList(db.inv_unidad_medida, "uni_id", "uni_descripcion", inv_producto.pro_unidad_medida);
            return PartialView("Create", inv_producto);
        }

        // GET: Producto/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_producto inv_producto = db.inv_producto.Find(id);
            if (inv_producto == null)
            {
                return HttpNotFound();
            }
            return PartialView("Delete", inv_producto);
        }

        // POST: Producto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {

            inv_producto inv_producto = db.inv_producto.Find(id);

            try
            {
                db.inv_producto.Remove(inv_producto);
                db.SaveChanges();
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                //string error = Utils.HandlerError(ex);
                ModelState.AddModelError(string.Empty, ex.Message);

            }

            return PartialView("Delete", inv_producto);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
