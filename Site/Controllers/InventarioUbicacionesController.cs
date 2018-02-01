using Site.Datos;
using Site.Helpers;
using Site.Models;
using Site.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Site.Controllers
{
    [Authorize()]
    public class InventarioUbicacionesController : Controller
    {
        private DBEntities db = new DBEntities();

        // GET: Producto
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult _List(int page = 1, int pageSize = 10, string filter = "")
        {

            var modelo = GetModel(page, pageSize, filter);
            return PartialView("_List", modelo);
        }
        private Models.GenericVM<inv_ubicacion> GetModel(int page = 1, int pageSize = 10, string filter = "")
        {
            GenericResultElements<inv_ubicacion> model = new GenericResultElements<inv_ubicacion>();
            GenericVM<inv_ubicacion> modelo = new GenericVM<inv_ubicacion>() { };


            model.ListElements = db.inv_ubicacion
                                 .OrderBy(x => x.ubi_codigo)
                                 .Skip((page - 1) * pageSize).Take(pageSize)
                                 .ToList();
            model.Total = db.inv_ubicacion.Count();

            return new Models.GenericVM<inv_ubicacion>
            {
                filter = filter,
                Lista = model.ListElements,
                paging = new PagingInfo { CurrentPage = page, ItemsPerPage = pageSize, TotalItems = model.Total }
            };
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
                    inv_producto.pro_fecha_tran = DateTime.Now;
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
            inv_ubicacion objUbicacion = db.inv_ubicacion.FirstOrDefault(x => x.ubi_id == id.Value);
            if (objUbicacion == null)
            {
                return HttpNotFound();
            }
           
           
            return View(objUbicacion);
        }

        // POST: Producto/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(inv_ubicacion obj)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    
                    db.inv_ubicacion.Add(obj);
                    db.SaveChanges();
                    var modelo = GetModel(1, 10, "");
                    string html = HTML.RenderViewToString(this.ControllerContext, "_List", modelo);
                    return Json(new { success = true, html = html });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
            }

            ViewBag.listaUbicaciones = db.inv_ubicacion.Where(x => x.ubi_activo == true).ToList();
            return View(obj);
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