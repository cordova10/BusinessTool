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
    public class InventarioDetalleController : Controller
    {
        private DBEntities db = new DBEntities();

        // GET: InventarioDetalle
        public ActionResult Index(int id = 0)
        {
            inv_trans inv_trans = db.inv_trans.Find(id);
            ViewBag.Titulo = inv_trans.tra_comentario;
            return View();
        }


        public PartialViewResult _List(int page = 1, int pageSize = 10, string filter = "")
        {
            GenericResultElements<inv_trans_detalle> model = new GenericResultElements<inv_trans_detalle>();
            GenericVM<inv_trans_detalle> modelo = new GenericVM<inv_trans_detalle>() { };


            model.ListElements = db.inv_trans_detalle.Include(i => i.inv_producto).Include(i => i.inv_trans).Include(i => i.inv_ubicacion)
                                 .OrderByDescending(x => x.tde_id)
                                 .Skip((page - 1) * pageSize).Take(pageSize)
                                 .ToList(); ;
            model.Total = db.inv_trans_detalle.Include(i => i.inv_producto).Include(i => i.inv_trans).Include(i => i.inv_ubicacion).Count();

            modelo = new Models.GenericVM<inv_trans_detalle>
            {
                filter = filter,
                Lista = model.ListElements,
                paging = new PagingInfo { CurrentPage = page, ItemsPerPage = pageSize, TotalItems = model.Total }
            };

            return PartialView("_List", modelo);
        }
        // GET: InventarioDetalle/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_trans_detalle inv_trans_detalle = db.inv_trans_detalle.Find(id);
            if (inv_trans_detalle == null)
            {
                return HttpNotFound();
            }
            return View(inv_trans_detalle);
        }

        // GET: InventarioDetalle/Create
        public ActionResult Create()
        {
            ViewBag.tde_producto = new SelectList(db.inv_producto, "pro_id", "pro_codigo");
            ViewBag.tde_trans = new SelectList(db.inv_trans, "tra_id", "tra_usuario");
            ViewBag.tde_ubicacion = new SelectList(db.inv_ubicacion, "ubi_id", "ubi_codigo");
            return View();
        }

        // POST: InventarioDetalle/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "tde_id,tde_trans,tde_cantidad,tde_producto,tde_descripcion,tde_costo,tde_ubicacion,tde_fecha_trans,tde_usuario_trans,tde_eliminado")] inv_trans_detalle inv_trans_detalle)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    inv_trans_detalle.tde_fecha_trans = DateTime.Now;
                    db.inv_trans_detalle.Add(inv_trans_detalle);
                    db.SaveChanges();
                    db.SaveChanges();
                    return Json(new { success = true });
                }
                catch (Exception ex)
                {
                    //string error = Utils.HandlerError(ex);
                    ModelState.AddModelError(string.Empty, ex.Message);

                }
            }

            ViewBag.tde_producto = new SelectList(db.inv_producto, "pro_id", "pro_codigo", inv_trans_detalle.tde_producto);
            ViewBag.tde_trans = new SelectList(db.inv_trans, "tra_id", "tra_usuario", inv_trans_detalle.tde_trans);
            ViewBag.tde_ubicacion = new SelectList(db.inv_ubicacion, "ubi_id", "ubi_codigo", inv_trans_detalle.tde_ubicacion);
            return PartialView("Create", inv_trans_detalle);
        }

        // GET: InventarioDetalle/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_trans_detalle inv_trans_detalle = db.inv_trans_detalle.Find(id);
            if (inv_trans_detalle == null)
            {
                return HttpNotFound();
            }
            ViewBag.tde_producto = new SelectList(db.inv_producto, "pro_id", "pro_codigo", inv_trans_detalle.tde_producto);
            ViewBag.tde_trans = new SelectList(db.inv_trans, "tra_id", "tra_usuario", inv_trans_detalle.tde_trans);
            ViewBag.tde_ubicacion = new SelectList(db.inv_ubicacion, "ubi_id", "ubi_codigo", inv_trans_detalle.tde_ubicacion);
            return View(inv_trans_detalle);
        }

        // POST: InventarioDetalle/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "tde_id,tde_trans,tde_cantidad,tde_producto,tde_descripcion,tde_costo,tde_ubicacion,tde_fecha_trans,tde_usuario_trans,tde_eliminado")] inv_trans_detalle inv_trans_detalle)
        {
            if (ModelState.IsValid)
            {
                db.Entry(inv_trans_detalle).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.tde_producto = new SelectList(db.inv_producto, "pro_id", "pro_codigo", inv_trans_detalle.tde_producto);
            ViewBag.tde_trans = new SelectList(db.inv_trans, "tra_id", "tra_usuario", inv_trans_detalle.tde_trans);
            ViewBag.tde_ubicacion = new SelectList(db.inv_ubicacion, "ubi_id", "ubi_codigo", inv_trans_detalle.tde_ubicacion);
            return View(inv_trans_detalle);
        }

        // GET: InventarioDetalle/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_trans_detalle inv_trans_detalle = db.inv_trans_detalle.Find(id);
            if (inv_trans_detalle == null)
            {
                return HttpNotFound();
            }
            return View(inv_trans_detalle);
        }

        // POST: InventarioDetalle/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            inv_trans_detalle inv_trans_detalle = db.inv_trans_detalle.Find(id);
            db.inv_trans_detalle.Remove(inv_trans_detalle);
            db.SaveChanges();
            return RedirectToAction("Index");
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
