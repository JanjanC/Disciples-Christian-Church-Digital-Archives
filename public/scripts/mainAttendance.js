$(document).ready(function() {
    Date.prototype.toMyString = function () {
        //If month/day is single digit value add perfix as 0
         function AddZero(obj) {
               obj = obj + '';
               if (obj.length == 1)
                   obj = "0" + obj
               return obj;
         }
     
         var output = "";
         output += this.getFullYear();
         output += AddZero(this.getMonth()+1);
         output += AddZero(this.getDate());
     
         return output; 
     }
     
     var d = new Date();
     var formattedDate = d.toMyString()

     var viewAttendanceLink = document.getElementById("view_attendance_link")
     viewAttendanceLink.setAttribute("href","/view_attendance/" + formattedDate)
     
     var editAttendanceLink = document.getElementById("edit_attendance_link")
     editAttendanceLink.setAttribute("href","/edit_attendance/" + formattedDate)
  })