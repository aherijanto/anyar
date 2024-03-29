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
    url: "/assets/scripts/ajax/newsales.php",
    data: "",
    success: function (response) {
      if (response == "OK") {
        $("#message").html("New Transaction");
        $("#TableSales").html("");
        $("#PriceModal").modal("hide");
        $("#TableSearch").html("");
        $("#message").html("");
        $("#txtgrandtotal").html("0");
        $("#SummaryModal").modal("hide");
        $("#TableSummary").html("");
        $("#txtpayment").val("0");
        $("#txtchange").val("0");

        getGrandTotal();
      }
    },
  });
}
function puttoarrayphp(itemcode, itemname, itemQTY,wareid, txtharga,disc,discrp) {
  
  $.ajax({
    type: "POST",
    url: "/assets/scripts/ajax/puttoarraysales.php",
    data:
      "id=" +
      itemcode.trim() +
      "&nm=" +
      itemname.trim() +
      "&qty=" +
      itemQTY.trim() +
      "&wareid=" +
      wareid.trim() +
      "&hrg=" +
      txtharga +
      "&disc=" +
      disc.trim() +
      "&discrp=" +
      discrp.trim(),
    success: function (response) {
      if (response) {
        $("#TableSales").html("");
        $("#TableSales").html(response);
        $("#PriceModal").modal("hide");
        $("#TableSearch").html("");
        removeItems();
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

function salesSave(){
  var error;
  var duedate;
  mstatus = $("#statussales").attr('mystat');
  var _client;
  _client = $("#custid").attr('mycode');
  console.log(_client);
  console.log(mstatus);
  pay = $('#txtpayment').val();
  $('#messagesummary').html('');
  if(mstatus=="Cash"){
    if ((pay=='')||(pay=='0')){
      $('#messagesummary').html('');
      $('#messagesummary').html('Please Fill Payment or Payment Less Than..');
      error='yes';duedate='MF';
      return false;
    }else{ error='no'}
  }
  if(mstatus=="A/R"){
    var _mydate = new Date().toISOString().split('T')[0];

    if($("#txtdate").val() == _mydate){
      $('#messagesummary').html('');
      $('#messagesummary').html('Date cannot be the same..');
      return false;
    }
    if($("#txtdate").val()==''){
      $('#messagesummary').html('');
      $('#messagesummary').html('Please Fill Date..');
      error='yes';
      
      return false;
    }else{ pay='0';
    change='0';error='no';duedate=$("#txtdate").val();}
  }

  if(error="no"){  
    var noinv =$("#invno").html();
    console.log('date is : ' + duedate);
    console.log('client is ' +_client);
      $.ajax({
        type: "POST",
			  crossDomain: true,
        url: "/assets/scripts/ajax/savesales.php",
        data: "pay=" + pay +"&change=" + change + "&status=" + mstatus + "&duedate=" + duedate + "&client=" + _client,
        success: function (response) {
          if (response == "OKsave") {
            swal({
              title: "Item Has Been Saved",
              text: "Saved Item",
              timer: 3000,
              type: "success",
              showConfirmButton: false,
            });
            newTrans();
            if(mstatus=="Cash"){
              window.open("/assets/scripts/ajax/printsalestable.php?noinv=" + noinv,"_self");
              window.open("/assets/scripts/ajax/printdostore.php?noinv=" + noinv);
            }

            if(mstatus=="A/R"){
              window.open("/assets/scripts/ajax/printsalesar.php?noinv=" + noinv,"_self");
              window.open("/assets/scripts/ajax/printdostore.php?noinv=" + noinv);
            }
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
}

//main
$(document).ready(function () {
  searchnameEnterKey();
  daysPressed();
  viewItems();
  $("button").click(function (e) {
    var idClicked = e.target.id;
    var itemcode = $("#txtCode").val();
    var itemname = $("#txtName").val();
    var itemQTY = $("#txtQty").val();
    var wareid = $("#txtWare").val();
    var disc = $("#txtdisc").val();
    var discrp = $("#txtdiscrp").val();
    var txtharga = "";
    switch (idClicked) {
      case "btnHarga1":
        txtharga = $("#txtharga1").val();
        puttoarrayphp(itemcode, itemname, itemQTY,wareid, txtharga, disc, discrp);
        getGrandTotal();
        break;
      case "btnHarga2":
        txtharga = $("#txtharga2").val();
        puttoarrayphp(itemcode, itemname, itemQTY,wareid, txtharga, disc, discrp);
        getGrandTotal();
        break;
      case "btnHarga3":
        txtharga = $("#txtharga3").val();
        puttoarrayphp(itemcode, itemname, itemQTY,wareid, txtharga, disc, discrp);
        getGrandTotal();
        break;
      case "btnHarga4":
        txtharga = $("#txtharga4").val();
        puttoarrayphp(itemcode, itemname, itemQTY,wareid, txtharga, disc, discrp);
        getGrandTotal();
        break;
      case "btnHarga5":
        txtharga = $("#txtharga5").val();
        puttoarrayphp(itemcode, itemname, itemQTY,wareid, txtharga, disc, discrp);
        getGrandTotal();
        break;
      case "btnHarga6":
        txtharga = $("#txtharga6").val();
        puttoarrayphp(itemcode, itemname, itemQTY,wareid, txtharga, disc, discrp);
        getGrandTotal();
        break;
      case "btnHarga7":
        txtharga = $("#txtharga7").val();
        puttoarrayphp(itemcode, itemname, itemQTY,wareid, txtharga, disc, discrp);
        getGrandTotal();
        break;
      case "btnHarga8":
        txtharga = $("#txtharga8").val();
        puttoarrayphp(itemcode, itemname, itemQTY,wareid, txtharga, disc, discrp);
        getGrandTotal();
        break;
      case "btnHarga9":
        txtharga = $("#txtharga9").val();
        puttoarrayphp(itemcode, itemname, itemQTY,wareid, txtharga, disc, discrp);
        getGrandTotal();
        break;
      case "btnHarga10":
        txtharga = $("#txtharga10").val();
        puttoarrayphp(itemcode, itemname, itemQTY,wareid, txtharga, disc, discrp);
        getGrandTotal();
        break;
      case "btnnamesearch":
        searchname();
        break;
      case "btnnew":
        newTrans();
        break;
      case "btnpayment":
        showSummary();
        break;
      case "btnsavedata":
        salesSave();
        break;
    }
  });

  /**/
});
