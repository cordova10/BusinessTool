﻿using System;
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
    public class InventarioEntradaController : Controller
    {
        private DBEntities db = new DBEntities();

        // GET: InventarioEntrada
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult _List(int page = 1, int pageSize = 10, string filter = "")
        {
            GenericResultElements<inv_trans> model = new GenericResultElements<inv_trans>();
            GenericVM<inv_trans> modelo = new GenericVM<inv_trans>() { };


            model.ListElements = db.inv_trans
                                 .OrderByDescending(x => x.tra_id)
                                 .Skip((page - 1) * pageSize).Take(pageSize)
                                 .ToList(); ;
            model.Total = db.inv_trans.Count();

            modelo = new Models.GenericVM<inv_trans>
            {
                filter = filter,
                Lista = model.ListElements,
                paging = new PagingInfo { CurrentPage = page, ItemsPerPage = pageSize, TotalItems = model.Total }
            };

            return PartialView("_List", modelo);
        }

        // GET: InventarioEntrada/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: InventarioEntrada/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "tra_id,tra_fecha,tra_usuario,tra_tipo,tra_comentario,tra_fecha_trans,tra_usuario_trans,tra_eliminado")] inv_trans inv_trans)
        {
            if (ModelState.IsValid)
            {
                db.inv_trans.Add(inv_trans);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(inv_trans);
        }

        // GET: InventarioEntrada/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_trans inv_trans = db.inv_trans.Find(id);
            if (inv_trans == null)
            {
                return HttpNotFound();
            }
            return View(inv_trans);
        }

        // POST: InventarioEntrada/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "tra_id,tra_fecha,tra_usuario,tra_tipo,tra_comentario,tra_fecha_trans,tra_usuario_trans,tra_eliminado")] inv_trans inv_trans)
        {
            if (ModelState.IsValid)
            {
                db.Entry(inv_trans).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(inv_trans);
        }

        // GET: InventarioEntrada/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_trans inv_trans = db.inv_trans.Find(id);
            if (inv_trans == null)
            {
                return HttpNotFound();
            }
            return View(inv_trans);
        }

        // POST: InventarioEntrada/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            inv_trans inv_trans = db.inv_trans.Find(id);
            db.inv_trans.Remove(inv_trans);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: InventarioEntrada/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            inv_trans inv_trans = db.inv_trans.Find(id);
            if (inv_trans == null)
            {
                return HttpNotFound();
            }
            return View(inv_trans);
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
