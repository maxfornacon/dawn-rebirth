$(document).ready(function() {
    var d = new Date();
    d.setTime(d.getTime() + (365 * 24 * 60 * 60 * 1000));
    var expires = "expires="+d.toUTCString();
    //set initial state.
    var sound = getCookie("sound");
    if (sound != "") {
      $('#sound-cb').val(this.checked);
    } else {
      $('#sound-cb').prop("checked", false);
    }
    var light = getCookie("light");
    if (light != "") {
      $('#light-cb').prop("checked", true);
      var tag = document.getElementsByTagName("BODY")[0];
  		var cb1 = document.getElementById("sound-cb");
  		var cb2 = document.getElementById("light-cb");

  		tag.classList.toggle("dark");
  		cb1.classList.toggle("light");
  		cb2.classList.toggle("light");
    } else {
      $('#light-cb').prop("checked", false);
    }

    $('#sound-cb').change(function() {
        if(this.checked) {
          document.cookie = "sound=checked;" + expires;
        } else {
          document.cookie = "sound=checked; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
        }
        $('#sound-cb').val(this.checked);
    });
    $('#light-cb').change(function() {
        if(this.checked) {
          document.cookie = "light=checked;" + expires;
        } else {
          document.cookie = "light=checked; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
        }
        $('#light-cb').val(this.checked);
    });
    document.getElementById("light-cb").onclick = function(){
  		var tag = document.getElementsByTagName("BODY")[0];
  		var cb1 = document.getElementById("sound-cb");
  		var cb2 = document.getElementById("light-cb");

  		tag.classList.toggle("dark");
  		cb1.classList.toggle("light");
  		cb2.classList.toggle("light");
  	};
    function getCookie(cname) {
      var name = cname + "=";
      var decodedCookie = decodeURIComponent(document.cookie);
      var ca = decodedCookie.split(';');
      for(var i = 0; i <ca.length; i++) {
          var c = ca[i];
          while (c.charAt(0) == ' ') {
              c = c.substring(1);
          }
          if (c.indexOf(name) == 0) {
              return c.substring(name.length, c.length);
          }
      }
      return "";
  }
});
