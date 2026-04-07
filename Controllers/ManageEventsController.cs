using Newtonsoft.Json;
using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace HospitalManagament.Controllers
{
    public class ManageEventsController : Controller
    {
        private readonly HospitalManagementContext db = new HospitalManagementContext();

        // GET: ManageEvents
        public ActionResult Index()
        {
            var user = GetLoggedInUser();
            if (user == null || !IsUserAdminOrDoctor(user))
            {
                return HttpNotFound();
            }

            var events = db.Events.Where(e => e.UserId == user.Id).ToList();
            return View(events);
        }

        // GET: ManageEvents/Details/5
        public ActionResult Details(long? id)
        {
            if (!id.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var event1 = db.Events.Find(id.Value);
            if (event1 == null)
            {
                return HttpNotFound();
            }
            return View(event1);
        }

        // GET: ManageEvents/Create
        public ActionResult Create()
        {
            return View(new Event());
        }

        // POST: ManageEvents/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Event event1)
        {
            if (!ModelState.IsValid)
            {
                return View(event1);
            }

            if (!TrySetEventDateTimes(event1, out string error))
            {
                ModelState.AddModelError("", error);
                return View(event1);
            }

            var user = GetLoggedInUser();
            if (user == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.Unauthorized);
            }

            event1.UserId = user.Id;
            event1.User = db.Users.Find(user.Id);

            db.Events.Add(event1);
            db.SaveChanges();

            return RedirectToAction("Index");
        }

        // GET: ManageEvents/Edit/5
        public ActionResult Edit(long? id)
        {
            if (!id.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var event1 = db.Events.Find(id.Value);
            if (event1 == null)
            {
                return HttpNotFound();
            }
            return View(event1);
        }

        // POST: ManageEvents/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Event event1)
        {
            if (!ModelState.IsValid)
            {
                return View(event1);
            }

            var oldEvent = db.Events.FirstOrDefault(e => e.Id == event1.Id);
            if (oldEvent == null)
            {
                return HttpNotFound();
            }

            if (!TrySetEventDateTimes(event1, out string error))
            {
                ModelState.AddModelError("", error);
                return View(event1);
            }

            oldEvent.Name = event1.Name;
            oldEvent.Description = event1.Description;
            oldEvent.allDay = event1.allDay;
            oldEvent.End = event1.End;
            oldEvent.EndDateStr = event1.EndDateStr;
            oldEvent.EndTime = event1.EndTime;
            oldEvent.Start = event1.Start;
            oldEvent.StartDateStr = event1.StartDateStr;
            oldEvent.StartTime = event1.StartTime;
            oldEvent.Status = event1.Status;

            db.SaveChanges();

            return RedirectToAction("Index");
        }

        // GET: ManageEvents/Delete/5
        public ActionResult Delete(long? id)
        {
            if (!id.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var event1 = db.Events.Find(id.Value);
            if (event1 == null)
            {
                return HttpNotFound();
            }

            db.Events.Remove(event1);
            db.SaveChanges();

            return RedirectToAction("Index");
        }

        // POST: ManageEvents/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            var event1 = db.Events.Find(id);
            if (event1 == null)
            {
                return HttpNotFound();
            }

            db.Events.Remove(event1);
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

        // Fetch All events for logged-in user
        [HttpGet]
        public JsonResult AllEvents()
        {
            var user = GetLoggedInUser();
            if (user == null)
            {
                Response.StatusCode = (int)HttpStatusCode.Unauthorized;
                return Json(new { error = "Unauthorized" }, JsonRequestBehavior.AllowGet);
            }

            var allEvents = db.Events.Where(e => e.UserId == user.Id).ToList();
            return Json(allEvents, JsonRequestBehavior.AllowGet);
        }

        #region Helpers

        private User GetLoggedInUser()
        {
            return HttpContext.Session["LoggedInUser"] as User;
        }

        private bool IsUserAdminOrDoctor(User user)
        {
            return user?.Role?.Name == "Admin" || user?.Role?.Name == "Doctor";
        }

        private bool TrySetEventDateTimes(Event event1, out string error)
        {
            error = null;
            try
            {
                if (!string.IsNullOrWhiteSpace(event1.StartDateStr) && event1.StartTime.HasValue)
                {
                    var startDate = DateTime.ParseExact(event1.StartDateStr, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    event1.Start = new DateTime(startDate.Year, startDate.Month, startDate.Day, event1.StartTime.Value.Hours, event1.StartTime.Value.Minutes, event1.StartTime.Value.Seconds);
                }
                else
                {
                    error = "Invalid start date or time.";
                    return false;
                }

                if (!string.IsNullOrWhiteSpace(event1.EndDateStr) && event1.EndTime.HasValue)
                {
                    var endDate = DateTime.ParseExact(event1.EndDateStr, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    event1.End = new DateTime(endDate.Year, endDate.Month, endDate.Day, event1.EndTime.Value.Hours, event1.EndTime.Value.Minutes, event1.EndTime.Value.Seconds);
                }
                else
                {
                    error = "Invalid end date or time.";
                    return false;
                }
                return true;
            }
            catch (FormatException)
            {
                error = "Date format is invalid. Please use MM/dd/yyyy.";
                return false;
            }
        }

        #endregion
    }
}
                