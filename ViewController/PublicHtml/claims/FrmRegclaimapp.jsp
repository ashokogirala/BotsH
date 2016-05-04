

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
%>
<%
     
        java.util.Calendar currentDate =  java.util.Calendar.getInstance();
        java.text.SimpleDateFormat formatter= 
        new java.text.SimpleDateFormat("dd-MMM-yyyy");
        String dateNow=formatter.format(currentDate.getTime());  
        String stCutOff = (String)request.getAttribute("StCutoffOthr");
        String endCutOff = (String)request.getAttribute("EndCutoffOthr");
  %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Register Claim Application</title>
    <link type="text/css" rel="stylesheet" href="styles/boto.css"/>
    <link href="styles/menu_home.css" type="text/css" rel="stylesheet"></link>
    <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
    <link rel="stylesheet" type="text/css" media="all"
          href="js/skins/aqua/theme.css" title="Aqua"/>
    <script language="javascript" type="text/javascript" src="js/menu_home.js"></script>
    <script language="javascript" type="text/javascript"
            src="js/RegisterCategory.js"></script>
    <script type="text/javascript" src="js/calendar_inc.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/lang/calendar-en.js"></script>
    <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
    <script type="text/javascript" language="javascript"> 
     
     var stCutoff='<%=stCutOff%>';
     var endCutoff='<%=endCutOff%>';
     
     if((stCutoff=='NO_DATA') || (endCutoff=='NO_DATA')){
        alert('Cut-off dates for Capture Registration is not defined. Please report to System Administrator.');
     }
     
var str_CntlFocused;
function vFindControl(elementRefa)
{

  var curbut;
  var str_cntlVal;
  curbut= elementRefa.value;
 document.forms[0].claimOperation.value=curbut
   
  if (!(document.forms[0].claimMode.value=="Update") && (document.forms[0].claimOperation.value=="Save") && (document.forms[0].claimrefno.value !=""))
 {
 var answer = confirm("Claim Reg No will be generated automatically, current value will be cleared and new Claim Reg No will be generated. Do you want to continue ? ")
	if (answer){
		document.forms[0].claimMode.value="";
		document.forms[0].claimrefno.value="";
	}
	else{
                document.forms[0].claimOperation.value="";
	}

}
else
{
}

if (!(document.forms[0].refclaim.value=="") && (document.forms[0].claimOperation.value=="Save")){

    if (!(document.forms[0].refclaim.value==document.forms[0].claimrefno.value)){
    alert("Claim Ref No is modified. Unable to update.");
    document.forms[0].claimOperation.value="";
    document.forms[0].claimMode.value="";
    document.forms[0].dele.disabled=false;
    document.forms[0].prntrecp.disabled=false;
    }
}
if(document.forms[0].claimOperation.value=="Search"){
getVtfdetails();
}
if ((document.forms[0].comcat.value=="others") && (document.forms[0].claimOperation.value=="Save")){

var curdate = new Date()
var month = curdate.getMonth();

month=9;
if ((month<6) || (month>8))
{
    alert("Claims process for other classifications cannot be submitted in this month.");
    document.forms[0].claimOperation.value="";
    document.forms[0].claimMode.value="";
    return false;
}
}
}
 function getVtfRegPopDetails(){
 
 var vcomcat="<%= request.getAttribute("comcat") %>";
 var URL="../ComPopVTFReg.jsp?vcom="+vcomcat;
 window.open(URL,'classvtfPop','width=600,height=400');
      
}
function getclmPopDetails(){
    var vcomcat="<%= request.getAttribute("comcat") %>";
    var URL="claims/ClaimRefNoPopUp.jsp?vcom="+vcomcat;
  
    window.open(URL,'classclmPop','width=600,height=400');
}

modalWin = null;
 function checkFocus()
{
//alert('window.navigator.userAgent.indexOf("Firefox") :' +window.navigator.userAgent.indexOf("Firefox"));
   if (window.navigator.userAgent.indexOf("Firefox")==-1)
    {
        if (modalWin!=null && !modalWin.closed)
        {
            self.blur();
            modalWin.focus();
        }
    }
    else{
        if (modalWin!=null && !modalWin.closed)
        {
            self.blur();
            //modalWin.focus();
        }
    }
    
}   
    
 function showModalWindow(forPop){ 
 
        var vtfNo;
        var vtfComp;
        var ClaimNo;
        var ClaimTitle;
        var VTFNo;
        var VTFCompName;
        var vcomcat="<%= request.getAttribute("comcat") %>";
        
        var Status;
        var StatusDate;
        var ClaimDate;
        var FinYear;
        var VatRegNo;
        var PoBox;
        var CompReg;
        var City;
        var Classifi;
        var Country;
        
      
        if (document.forms[0].claimMode.value =='Update')
        {
            return false;
        }
        
        vtfNo='vtfRegNum';
        vtfComp='vtfCompName';
        
        ClaimNo='claimrefno';
        ClaimTitle='title';
        VTFNo='vtfRegNum';
        VTFCompName='vtfCompName';
                
           
        Status='status';
        StatusDate='statusdate';
        ClaimDate='claimdate';
        FinYear='finyear';
        VatRegNo='vatregno';
        PoBox='poboxno';
        CompReg='companyregno';
        City='city';
        Classifi='classification';
        Country='country';

        
        
        
        
        var strVTFCompVal = null;
        if(document.forms[0].vtfCompName.value!=''){
            strVTFCompVal=document.forms[0].vtfCompName.value;
        }
        if(forPop=='VTF'){
            modalWin=showVTFPopUp(350,300,vtfNo,vtfComp,strVTFCompVal,vcomcat);
        }
        else{
            modalWin=showRegClaimPopUpNew(350,400,ClaimNo,ClaimTitle,VTFNo,VTFCompName,Status,StatusDate,ClaimDate,FinYear,VatRegNo,PoBox,CompReg,City,Classifi,Country,vcomcat);
        }   
    }
        

</script>
    <script type="text/javascript" language="javascript"> 
 var txtfocus=0;
function getVtfdetails()
{
 txtfocus=1;
 document.forms[0].getVtfdet.value="Getdetails";
 var vtf=document.forms[0].vtfRegNum.value;
 if (!(vtf=='')){
 document.forms[0].submit();
 }
}
function getVatNumdetails()
{
 txtfocus=1;
 document.forms[0].getVtfdet.value="GetVatNumdetails";
 var vtf=document.forms[0].vatregno.value;

 if (!(vtf=='')){
 document.forms[0].submit();
 }
 //document.forms[0].claimdate.focus();
}
function getMonthNumber(strMonthNameShort){

   strMonthNameShort=strMonthNameShort.toUpperCase();
   var mon=0;
       
   switch(strMonthNameShort){
   
       case "JAN" : mon=0;break;
       case "FEB" : mon=1;break;
       case "MAR" : mon=2;break;
       case "APR" : mon=3;break;
       
       case "MAY" : mon=4;break;
       case "JUN" : mon=5;break;
       case "JUL" : mon=6;break;
       case "AUG" : mon=7;break;
       
       
       case "SEP" : mon=8;break;
       case "OCT" : mon=9;break;
       case "NOV" : mon=10;break;
       case "DEC" : mon=11;break;
       default: mon=0;
   
   }
   //alert('mon ' +mon);
   return mon;
}


function vShowMessage(){

if (document.forms[0].vtfRegNum.value=="")
document.forms[0].claimrefno.focus();
else
document.forms[0].claimdate.focus();

var res =document.forms[0].result.value;
if (res!="")
{
alert(res);
document.forms[0].result.value="";
}
if (document.forms[0].claimMode.value=="Update"){
//vtfRegNum
document.forms[0].vtfRegNum.readOnly=true;
document.forms[0].finyear.disabled=true;
document.forms[0].dele.disabled=false;
document.forms[0].prntrecp.disabled=false;
}
else
{
document.forms[0].vtfRegNum.readOnly=false;
document.forms[0].finyear.disabled=false;
document.forms[0].dele.disabled=true;
document.forms[0].prntrecp.disabled=true;
}
}

 function performDelete(){
     
    if(validateRequired(document.forms[0])){
            if (confirm("Claim Ref No will be deleted. Do you want to continue?")) {        
               return true;
             }   else
             {
             return false;
             }
       }
    }


 function comparWithSysDates() 
{
var str1=document.forms[0].claimdate.value;
var str2=document.forms[0].finyear.value;
var dt1   = parseInt(str1.substring(0,2)); 
var mon1  = str1.substring(3,6);
var yr=parseInt(str1.substring(7,11));
var yr1=parseInt(str2.substring(0,4));
if( yr < yr1)
 {
 return false;
 }
   mon1=mon1.toUpperCase();
   
   
   var mon=0;
   
   switch(mon1){
   
   case "JAN" : mon=0;break;
   case "FEB" : mon=1;break;
   case "MAR" : mon=2;break;
   case "APR" : mon=3;break;
   
   case "MAY" : mon=4;break;
   case "JUN" : mon=5;break;
   case "JUL" : mon=6;break;
   case "AUG" : mon=7;break;
   
   
   case "SEP" : mon=8;break;
   case "OCT" : mon=9;break;
   case "NOV" : mon=10;break;
   case "DEC" : mon=11;break;
   default:
   mon=0;
   
   }
   var yr1   = parseInt(str1.substring(7,11)); 

   var dat = new Date();
 
  var sysDat=new Date(dat.getFullYear(), dat.getMonth(), dat.getDate());   
  //alert("selec date="+sysDat);
  var date1 = new Date(yr1, mon, dt1); 
 
   if(sysDat < date1)
   {
   //   alert("Future Date is not Allowed");
      return false; 
   } 
  return true;
}  

function checkfuturedate(){

if (document.forms[0].claimMode.value=="")
{
        var currentTime = new Date();
        aMonths = new Array("Jan", "Feb", "Mar", "Apr", "May", "June", "July", "August", "September", "October", "November", "December");
        day=currentTime.getDate();
        if(day<10) day = "0" + day
        now = day+'-'+aMonths[currentTime.getMonth()]+'-'+currentTime.getYear();
        alert(now);
        if (!(document.forms[0].claimdate.value==""))
        {
            var seldate=document.forms[0].claimdate.value;
               
          if (seldate > now ){
          alert('False');
                return false;
                }
                else
                {
                alert('True');
                return true;
                }
       }  else {
            return true;
       }
}
else
{
return true;
}
}
    function CallPrint()
{

var sOption="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
       sOption+="scrollbars=yes,width=840,height=655,left=100,top=25"; 

   var sWinHTML = document.getElementById('print').innerHTML; 
 
   var winprint=window.open("","",sOption); 
       winprint.document.open(); 
       winprint.document.write('<html><LINK  href=css/boto.css rel=Stylesheet><body>'); 
       winprint.document.write(sWinHTML);          
       winprint.document.write('</body></html>'); 
       winprint.document.close();
       winprint.focus();
       }
    </script>
  </head>
</html>
<body onload="vShowMessage()" onfocus="checkFocus()"><html:errors/><html:form action="/RegClaimApp.do?methodToCall=getRegClaimApp"
                                                                              method="post">
    <html:javascript formName="RegClaimApp"/>
    <table width="735" border="0" cellspacing="0" align="right" cellpadding="1">
      <tr>
        <td valign="top" class="head_bgcolor">Register Claim Application</td>
      </tr>
      <tr>
        <td valign="top" class="padding5px">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td valign="top">
                <table border="0" class="details_table" cellspacing="0"
                       cellpadding="0">
                  <tr>
                    <td>Details</td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td valign="top">
                <table class="field_table" width="100%" border="0"
                       cellspacing="0" cellpadding="0">
                  <tr>
                    <td valign="top">
                      <table width="100%" border="0" cellspacing="0"
                             cellpadding="0" align="left">
                        <tr>
                          <td>
                            <table border="0" cellspacing="0" cellpadding="3"
                                   width="100%">
                              <tr>
                                <td>
                                  <bean:message key="claimrefno"/>
                                </td>
                                <td>
                                  <html:text property="claimrefno"
                                             maxlength="15" tabindex="1"
                                             name="RegClaimApp"
                                             style="width:175px;"/>
                                  <a href="#" onclick="showModalWindow('CLM');">
                                    <img src="images/list_img.jpg" border="0"/>
                                  </a>
                                </td>
                                <td width="100">
                                  <bean:message key="title"/>
                                  <span class="red12">*</span>
                                </td>
                                <td>
                                  <html:text property="title" maxlength="50"
                                             tabindex="2" name="RegClaimApp"
                                             style="width:175px;"/>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <bean:message key="status"/>
                                </td>
                                <td>
                                  <html:text property="status" maxlength="15"
                                             name="RegClaimApp" readonly="true"
                                             style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:175px; "/>
                                </td>
                                <td>
                                  <bean:message key="statusdate"/>
                                </td>
                                <td>
                                  <html:text property="statusdate"
                                             name="RegClaimApp" readonly="true"
                                             style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:175px;"/>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <bean:message key="vtfregno"/>
                                  <span class="red12">*</span>
                                </td>
                                <td>
                                  <table cellpadding="0" cellspacing="0"
                                         border="0">
                                    <tr>
                                      <td>
                                        <html:text property="vtfRegNum"
                                                   onblur="getVtfdetails();"
                                                   tabindex="3" maxlength="10"
                                                   name="RegClaimApp"
                                                   style="width:175px;"/>                                        
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                                <td colspan="2">
                                  <html:text property="vtfCompName"
                                             maxlength="50" name="RegClaimApp"
                                             style="border:1px solid #8f8e8e; width:280px;"/>
                                        <a href="#"
                                           onclick="showModalWindow('VTF');">
                                          <img src="images/list_img.jpg"
                                               border="0"/>
                                        </a>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <bean:message key="claimdate"/>
                                  <span class="red12">*</span>
                                </td>
                                <td>
                                  <html:text property="claimdate"
                                             name="RegClaimApp" tabindex="4"
                                             readonly="true"
                                             style="width:175px;"/>
                                  <img alt="calender" id="calimg" align="Center"
                                       src="images/cal.JPG"
                                       onclick="return showCalendar('claimdate','0','%d-%b-%Y',false,false);"
                                       class="cursorHand"></img>
                                </td>
                                <td>
                                  <bean:message key="financial"/>
                                  <span class="red12">*</span>
                                </td>
                                <td>
                                  <html:select property="finyear"
                                               name="RegClaimApp" tabindex="5"
                                               style="width:175px;">
                                    <html:options name="yearlist"
                                                  labelName="yearlist"/>
                                  </html:select>
                                </td>
                              </tr>
                              <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                  <strong>Postal&nbsp;Address</strong>
                                </td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>
                                  <bean:message key="vatregno"/>
                                </td>
                                <td>
                                  <html:text property="vatregno" maxlength="15"
                                             name="RegClaimApp" 
											 onblur="getVatNumdetails();"
                                             style="width:175px;"/>
                                </td>
                                <td>
                                  <bean:message key="PoBoxNo"/>
                                </td>
                                <td>
                                  <html:text property="poboxno"
                                             name="RegClaimApp" readonly="true"
                                             style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:175px;"/>
                                </td>
                              </tr>
                              <tr>
                                <td width="125">
                                  <bean:message key="companyregno"/>
                                </td>
                                <td width="220">
                                  <html:text property="companyregno"
                                             maxlength="20" name="RegClaimApp"
                                             readonly="true"
                                             style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:175px;"/>
                                </td>
                                <td>
                                  <bean:message key="city"/>
                                </td>
                                <td>
                                  <html:text property="city" maxlength="30"
                                             name="RegClaimApp" readonly="true"
                                             style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:175px;"/>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <bean:message key="classification"/>
                                </td>
                                <td>
                                  <html:text property="classification"
                                             maxlength="30" name="RegClaimApp"
                                             readonly="true"
                                             style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:175px;"/>
                                </td>
                                <td>
                                  <bean:message key="country"/>
                                </td>
                                <td>
                                  <html:text property="country"
                                             name="RegClaimApp" maxlength="50"
                                             readonly="true"
                                             style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:175px;"/>
                                </td>
                              </tr>
                              <tr>
                                <td colspan="4">
                                  <html:hidden property="claimMode"
                                               name="RegClaimApp"/>
                                  <html:hidden property="refclaim"
                                               name="RegClaimApp"/>
                                  <html:hidden property="getVtfdet"
                                               name="RegClaimApp"/>
                                  <html:hidden name="RegClaimApp"
                                               property="result"/>
                                  <html:hidden name="RegClaimApp"
                                               style="width:100px;"
                                               property="comcat"
                                               value='<%=request.getAttribute(\"comcat\")%>'/>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td valign="top" class="bordertop">
                            <table width="100%" border="0" cellspacing="0"
                                   cellpadding="3">
                              <tr>
                                <td class="mandatory">
                                  <bean:message key="Mandatory"/>
                                </td>
                                <td>
                                  <div align="right">
                                    <html:hidden property="claimOperation"
                                                 name="RegClaimApp"/>
                                     
                                    <html:button property="prntrecp"
                                                 onclick="CallPrint(); "
                                                 tabindex="6" disabled="true">Print Acknowledgement</html:button>
                                     
                                    <html:submit onclick="vFindControl(this); "
                                                 tabindex="7">Search</html:submit>
                                     
                                    <html:submit onclick="vFindControl(this);"
                                                 tabindex="8">Save</html:submit>
                                     
                                    <html:submit property="dele"
                                                 onclick="vFindControl(this); return performDelete();"
                                                 disabled="true" tabindex="9">Delete</html:submit>
                                     
                                    <html:submit onclick="vFindControl(this);"
                                                 tabindex="10">Clear</html:submit>
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <table>
      <tr>
        <td style="display: none;">
          <div id="print">
            <table id="TblPrint" align="center" style="width:600px" border="0"
                   cellpadding="3" cellspacing="0">
              <tr>
                <td class="padding_left15">
                  <img src="images/bota_logo.jpg" alt="HRDC"/>
                </td>
                <td colspan="3" align="center">
                  <div align="center">
                    <span class="nw_header_font">
                      <bean:message key="VTFS"/>
                    </span><br></br><br></br>Claims Acknowledgement
                  </div>
                </td>
              </tr>
              <tr>
                <td colspan="2" style="border-top:1px solid #000000;">&nbsp;</td>
                <td colspan="2" style="border-top:1px solid #000000;"
                    align="right">
                  <table>
                    <tr>
                      <td>Date:</td>
                      <td>
                        <html:text property="pprintdate" readonly="true"
                                   name="RegClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                    </tr>
                    <tr>
                      <td>Printed By:</td>
                      <td>
                        <html:text property="pprintedby" readonly="true"
                                   name="RegClaimApp"
                                   style="border: 1px solid #FFFFFF"/>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td colspan="2">&nbsp;</td>
                <td align="left">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td style="border-top:1px solid #000000; padding-top:8px; width:100px;">
                  <strong>HRDF Reg No:</strong>
                </td>
                <td colspan="3"
                    style="border-top:1px solid #000000; padding-top:8px;">
                  <html:text property="pvtfRegNum" readonly="true"
                             name="RegClaimApp"
                             style="border: 1px solid #FFFFFF; width:100px;"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong>VAT No:</strong>
                </td>
                <td colspan="3">
                  <html:text property="pvatregno" readonly="true"
                             name="RegClaimApp"
                             style="border: 1px solid #FFFFFF; width:500px;"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong>Levy payer:</strong>
                </td>
                <td colspan="3">
                  <html:text property="pvtfRegName" readonly="true"
                             name="RegClaimApp"
                             style="border: 1px solid #FFFFFF; width:500px;"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong>P O Box no / P/Bag:</strong>
                </td>
                <td colspan="3">
                  <html:text property="ppoboxno" readonly="true"
                             name="RegClaimApp"
                             style="border: 1px solid #FFFFFF; width:100px;"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong>City:</strong>
                </td>
                <td colspan="3">
                  <html:text property="ppcity" readonly="true"
                             name="RegClaimApp"
                             style="border: 1px solid #FFFFFF; width:100px;"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong>Country:</strong>
                </td>
                <td colspan="3">
                  <html:text property="ppcountry" readonly="true"
                             name="RegClaimApp"
                             style="border: 1px solid #FFFFFF; width:100px;"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong>Claim Ref No:</strong>
                </td>
                <td>
                  <html:text property="pclaimref" readonly="true"
                             name="RegClaimApp"
                             style="border: 1px solid #FFFFFF; width:100px;"/>
                </td>
                <td width="340" align="right">
                  <strong>Claim Submission date:</strong>
                </td>
                <td>
                  <html:text property="pclmdate" readonly="true"
                             name="RegClaimApp"
                             style="border: 1px solid #FFFFFF; width:100px;"/>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="4">
                  <strong>Hereby we acknowledge the receipt of above referred
                          claim application. </strong>
                </td>
              </tr>
              <tr>
                <td colspan="4">
                  <strong>Please quote claim reference number for future
                          reference to contact BOTA on their address</strong>
                </td>
              </tr>
              <tr>
                <td style="padding-top:50px; padding=bottom:50px;">Signature</td>
                <td colspan="3" style="padding-top:50px; padding=bottom:50px;">&nbsp;</td>
              </tr>
              <tr>
                <td style="padding-top:50px; padding=bottom:50px;">Designation</td>
                <td colspan="3" style="padding-top:50px; padding=bottom:50px;">&nbsp;</td>
              </tr>
              <tr>
                <td style="padding-top:50px; padding=bottom:50px;">Date:</td>
                <td colspan="3" style="padding-top:50px; padding=bottom:50px;">
                  &nbsp;
                  <div align="center" style="width:600;text-align:center;">
                    <style type="text/css" media="print">
                    .printbutton {
                    visibility: hidden;
                    display: none;
                    }
            </style>
                     
                    <input type="button" value="Print" class="printbutton"
                           onclick="window.print();"/>
                  </div>
                </td>
              </tr>
            </table>          
          </div>
        </td>
      </tr>
    </table>
  </html:form></body>