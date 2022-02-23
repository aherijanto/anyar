/*-----------------------------------------
Created by  : Ary H 
Project     : Inventory
Date        : January, 2022
-----------------------------------------*/
var myflag = $("#txtindex").val();
var test = document.getElementById("TableWarehouse"); // js
var grandtotal1;
var pay;
var change;
var mstatus;

function getGrandTotal() {
  $.ajax({
    type: "POST",
    url: "/assets/scripts/ajax/getgrandtotal.php",
    data: "",
    success: function (response) {
      var jsonData = $.parseJSON(response);
      $(jsonData).each(function (i, val) {
        $.each(val, function (k, v) {
          switch (k) {
            case "grandtotal":
              $("#txtgrandtotal").html(v);
              break;
          } //switch
        }); //each
      }); //jsondata
    }, //response
  }); //ajax
}
function viewItems() {
  var path = "./assets/scripts/ajax";
  $("#TableSales").html("");
  $.ajax({
    type: "POST",
    url: "/assets/scripts/ajax/getitemlist.php",
    data: "",
    success: function (response) {
      $("#TableSales").html("");
      $("#TableSales").html(response);

      $(".link1").bind("click", function () {
        var id = $(this).attr("hreff");
        //$('#message').html(id + ' removed');
        console.log(id);
        $.ajax({
          type: "POST",
          url: "/assets/scripts/ajax/removeperitemsales.php",
          data: "id=" + id,
          success: function (response) {
            if (response == "OK") {
              swal({
                title: "Item Has Been Removed",
                text: "Removed Item",
                timer: 3000,
                type: "success",
                showConfirmButton: false,
              });
            } else {
              $("#message").html(response);
            }
            getGrandTotal();
            viewItems();
          }, //response
        }); //ajax
      });
    },
  });
  getGrandTotal();
}

function newTrans() {
  $.ajax({
    type: "POST",
    url: "/assets/scripts/ajax/newaccr.php",
    data: "",
    success: function (response) {
      console.log(response);
      if (response == "OK") {
        $("#accrdetail").html("");
      }
    },
  });
}
function puttoarrayaccr(mydate,mytype,mynocheque,myamount) {
  
  $.ajax({
    type: "POST",
    url: "/assets/scripts/ajax/puttoarrayaccr.php",
    data:
      "mydate=" +
      mydate.trim() +
      "&mytype=" +
      mytype.trim() +
      "&mynocheque=" +
      mynocheque.trim()+
      "&myamount=" +
      myamount.trim(),
    success: function (response) {
      if (response) {
        $("#accrdetail").html("");
        $("#accrdetail").html(response);
        //removeItems();
        //$('.link1').bind('click', function () {
        //	var idware = $(this).attr('hreff');
        //	$('#message').html(idware +' link clicked');

        //$('#txtindex').val(idware);
        //$('#txtwareid').val(idware);
        //$('#priceModal').modal('show', { backdrop: 'static' });
        //});
      } //if
    },
  });
}

function searchname() {
  var itemname = $("#itemname").val();
  console.log(itemname);
  $.ajax({
    type: "POST",
    url: "/assets/scripts/ajax/getsearchname.php",
    data: "name=" + itemname,
    success: function (response) {
      $("#TableSearch").html("");
      $("#TableSearch").html(response);
      $(".linkk").bind("click", function () {
        var id = $(this).attr("hreff");
        $("#txtharga1").val(id);

        $("#PriceModal").modal("show", { backdrop: "static" });
      });

      $(".linkk2").bind("click", function () {
        var id = $(this).attr("hreff");
        $("#h1-1").html("");
        $("#h1-1").html("Choose Price");
        $("#txtQty").val("1");
        $("#txtdisc").val("0");
        $("#txtdiscrp").val("0");

        $.ajax({
          type: "POST",
          url: "/assets/scripts/ajax/getinventdetail.php",
          data: "id=" + id,
          success: function (response) {
            //calculate percent
            $("#txtdiscrp").on("input", function(){
              $("#txtdisc").val('0');
          });
          $("#txtdisc").on("focus", function(){
            $("#txtdiscrp").val('0');
        });
            var jsonData = $.parseJSON(response);
            $(jsonData).each(function (i, val) {
              $.each(val, function (k, v) {
                switch (k) {
                  case "id":
                    $("#txtCode").val(v);
                    break;
                  case "nm":
                    $("#txtName").val(v);
                    break;
                  case "qty":
                    $("#txtQty").val(v);
                    break;
                  case "wareid":
                      $("#txtWare").val(v);
                      break;
                  case "hrg1":
                    $("#txtharga1").val(v);
                    break;
                  case "hrg2":
                    $("#txtharga2").val(v);
                    break;
                  case "hrg3":
                    $("#txtharga3").val(v);
                    break;
                  case "hrg4":
                    $("#txtharga4").val(v);
                    break;
                  case "hrg5":
                    $("#txtharga5").val(v);
                    break;
                  case "hrg6":
                    $("#txtharga6").val(v);
                    break;
                  case "hrg7":
                    $("#txtharga7").val(v);
                    break;
                  case "hrg8":
                    $("#txtharga8").val(v);
                    break;
                  case "hrg9":
                    $("#txtharga9").val(v);
                    break;
                  case "hrg10":
                    $("#txtharga10").val(v);
                    break;
                } //switch
              }); //each
            }); //jsondata
          }, //response
        }); //ajax

        $("#PriceModal").modal("show", { backdrop: "static" }); //modal
      }); //linkk2
    },
  });
}

function removeItems() {
  var path1 = "/assets/scripts/ajax/";
  //var itemname = $('#itemname').val();
  $(".link1").bind("click", function () {
    var id = $(this).attr("hreff");
    //$('#message').html(id + ' removed');
    console.log(id);
    $.ajax({
      type: "POST",
      url: "/assets/scripts/ajax/removeperitemsales.php",
      data: "id=" + id,
      success: function (response) {
        if (response == "OK") {
          swal({
            title: "Item Has Been Removed",
            text: "Removed Item",
            timer: 3000,
            type: "success",
            showConfirmButton: false,
          });
        } else {
          $("#message").html(response);
        }
        viewItems();
      }, //response
    }); //ajax
  }); //linkremove
  getGrandTotal();
}

function searchnameEnterKey() {
  $("#itemname").on("keypress", function (e) {
    if (e.which === 13) {
      searchname();
    }
  });
}

function daysPressed(){
  $("#txtdays").on("keypress", function (e) {
    if (e.which === 13) {
      
      var _days = ($("#txtdays").val());
      if(_days == ''){
        _days=0;
      }
      changeDate(_days);
    }
  });
}

function changeDate(days){
  var nowDate = new Date();
  var chooseDate=new Date();
  chooseDate.setDate(nowDate.getDate() + parseInt(days));
   // var futureDate = chooseDate.getFullYear()+'-'+('0'+(chooseDate.getMonth()+1)).slice(-2)+'-'+('0'+(chooseDate.getDate())).slice(-2);
    console.log(chooseDate);
    $("#txtdate").val(chooseDate.toISOString().split('T')[0]);
}

function showSummary(){
  grandtotal1 = '';
  grandtotal1 = $("#txtgrandtotal").html().replace(',','').replace(',','');
  mstatus = $("#statussales").attr('mystat');
  
  console.log(mstatus);
  $.ajax({
    type: "POST",
    url: "/assets/scripts/ajax/getsummary.php",
    data: "",
    success: function (response) {
      $("#TableSummary").html("");
      $("#TableSummary").html(response);
      $("#SummaryModal").modal("show", { backdrop: "static" });
      $("#txtpayment").val('0');
    }  
  });
  if (mstatus=="Cash"){
    $("#divdate").hide();
    $("#divdate1").hide();
    $("#txtpayment").on("keypress", function (e) {
      if (e.which === 13) {
        pay = $('#txtpayment').val();
        change = parseInt(pay) - parseInt(grandtotal1);
        $("#txtchange").val(change);
      }
    });
    $("#txtpayment").on("input", function (e) {
      
     pay = $('#txtpayment').val();
     change = parseInt(pay) - parseInt(grandtotal1);
    $("#txtchange").val(change);
    
    });
  }

  if(mstatus=="A/R"){
    $("#payme").hide();
    $("#mychange").hide();
    var today = new Date().toISOString().split('T')[0];
    //
    //var mm = today.getMonth() + 1;
    //daysPressed();
    $("#txtdays").val('0');
    $("#txtdate").val(today);
  }
}

function accrSave(noinv){
  
    var noinv =$("#noinv").html();
   
      $.ajax({
        type: "POST",
			  crossDomain: true,
        url: "/assets/scripts/ajax/saveaccr.php",
        data: "myinvno="+noinv.trim(),
        success: function (response) {
          console.log(response);
          if (response == "OKsave") {

            swal({
              title: "Item Has Been Saved",
              text: "Saved Item",
              timer: 3000,
              type: "success",
              showConfirmButton: false,
            });
          } else {
            swal({
             title: "Save Data Invalid",
              text: "Data cannot be saved.Please try again",
              timer: 3000,
              type: "error",
              showConfirmButton: false,
            });
          }
        } //response
      }); //ajax
  
}

function getHistory(myinv){
  $.ajax({
    type: "POST",
    url: "/assets/scripts/ajax/gethistoryaccr.php",
    data: "inputinv=" + myinv,
    success: function (response) {
      console.log(response);
      if(response=='0'){
        $("#historyaccr").hide();
      }else{
        $("#historyaccr").html("");
        $("#historyaccr").html(response);
        $("#historyaccr").show();
        $("#accr").show();
      }
    }
  });
}

//main
$(document).ready(function () {
    $("#accr").hide();
    $("#historyaccr").hide();
    $("#btnsearch").click(function(e){
        noinv = $("#srchInv").val();
        $.ajax({
            type: "POST",
            url: "/assets/scripts/ajax/getinvaccr.php",
            data: "inputinv=" + noinv,
            success: function (response) {
              $("#infoinvaccr").html("");
              $("#infoinvaccr").html(response);
              $("#accr").show();
              getHistory(noinv);
            }
        });

        /*$.ajax({
            type: "POST",
            url: "/assets/scripts/ajax/getinvaccr.php",
            data: "inputinv=" + noinv,
            success: function (response) {
              $("#detailaccrr").html("");
              $("#detailaccr").html(response);
            }
        });*/
        
    })

    $("#addtolist").click(function(e){
      mydate = $("#dateaccr").val();
      mytype = $("#typepay").val();
      mynocheque = $("#nocheque").val();
      myamount = $("#amount").val();
      console.log(mynocheque);
      puttoarrayaccr(mydate,mytype,mynocheque,myamount);
    })

    $("#btnsave").click(function(e){
      myinvno = $("#noinv").html();
      accrSave(myinvno);
      getHistory(myinvno);
      newTrans();
    })
});
