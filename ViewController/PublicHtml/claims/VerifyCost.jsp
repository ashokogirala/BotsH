<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template"
           prefix="template"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>
      <bean:message key="prompt.Common.ApplicationTitle"/>
    </title>
    <link type="text/css" rel="stylesheet" href="styles/boto.css"/>
    <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
    <link rel="stylesheet" type="text/css" media="all"
          href="js/skins/aqua/theme.css" title="Aqua"/>
    <script language="javascript" type="text/javascript" src="js/menu_home.js"></script>
    <script language="javascript" type="text/javascript"
            src="js/RegisterCategory.js"></script>
    <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
    <script type="text/javascript" src="js/calendar_inc.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/lang/calendar-en.js"></script>
    <script type="text/javascript" language="javascript"> 
     function onClaimLoad(){
      
      var clmcomClear='<%=request.getAttribute("ClaimComClear") %>';
     
       
       
       if(clmcomClear=="ClaimComClear"){
   
     document.forms[0].claimrefno.value="";
     document.forms[0].title.value="";
     document.forms[0].status.value="";
     document.forms[0].statusdate.value="";
     document.forms[0].vtfRegNum.value="";
     document.forms[0].vtfCompName.value="";
     
     
     
     
     
     
     
     
     
     
     
     
     document.forms[0].claimdate.value="";
     document.forms[0].finyear.value="";
     document.forms[0].vatregno.value="";
     document.forms[0].poboxno.value="";
     document.forms[0].companyregno.value="";
     document.forms[0].city.value="";
     document.forms[0].classification.value="";
     document.forms[0].country.value="";
     
   }
   
   
   if(document.forms[1].txtAppCostTotCost.value!="")
   {
         document.forms[1].cstprocess.disabled=false;
   }
   
     var VerifiedResult='<%=request.getAttribute("VerifiedResult") %>';
     
     if(VerifiedResult=="Verified Training Cost"){
      document.forms[0].status.value="Verified Training Cost";
     }
       
   checkClearData();
     if (!(document.forms[0].title.value==""))
     {
    
    document.forms[1].clmrefno.value=document.forms[0].claimrefno.value;
    }else{
    document.forms[1].cstprocess.disabled=false;
     }
     var rd;
     rd=document.forms[1].htxtCostPage.value;
    

     if (rd=="O")
        {
        document.forms[1].cstprocess.disabled=false;   
        document.getElementById('tblInhouse').style.display = 'none'
        document.getElementById('tblInsi').style.display = 'block'
        document.forms[1].htxtCostPage.value="O";
        document.getElementById('rd2').checked=true;
        }
        else
        {
        document.getElementById('tblInhouse').style.display = 'block'
        document.getElementById('tblInsi').style.display = 'none'
        document.forms[1].htxtCostPage.value="I";
        document.getElementById('rd1').checked=true;
        }
 
      var processResult= '<%=request.getAttribute("ProcessResult") %>' ;
      
     
      if(processResult=="PROCESS_SUCCESS"){
         alert("Training cost verified and processed successfully.")
         document.forms[1].cstprocess.disabled=false;   
      }
   if(processResult=="PROCESS_FAIL"){
         alert("Training cost verification process failed.")
         document.forms[1].cstprocess.disabled=false; 
      }
     
      
      
  
}
function radiochange(rdclick){
 if (curbut=="I")
 {
 document.getElementById('rd1').checked=true;
     document.getElementById('rd2').disabled=true;
 }else 
 
 document.getElementById('rd1').disabled=true;
     document.getElementById('rd2').checked=true;
 
}

/*
function radiochange(rdclick)
{

var curbut;
curbut= rdclick.value;
    if (curbut=="I")
    {
    //document.getElementById('tblInhouse').style.display = 'block'
    //document.getElementById('tblInsi').style.display = 'none'
    document.forms[1].htxtCostPage.value="I";
        if ((document.forms[1].costtype.value=="O"))
        {
            document.forms[1].cstprocess.disabled=true;
        }else if ((document.forms[1].costtype.value=="I"))
        {
            document.forms[1].cstprocess.disabled=false;
        }
     document.getElementById('rd1').checked=true;
     document.getElementById('rd2').checked=false;
    }
    else
    {
  // document.getElementById('tblInhouse').style.display = 'none'
  //  document.getElementById('tblInsi').style.display = 'block'
    document.forms[1].htxtCostPage.value="O";
         if ((document.forms[1].costtype.value=="I"))
        {
            document.forms[1].cstprocess.disabled=true;
         
        }else if ((document.forms[1].costtype.value=="O"))
        {
            document.forms[1].cstprocess.disabled=false;
        }
     document.getElementById('rd1').checked=false;
     document.getElementById('rd2').checked=true;
   document.forms[1].cstprocess.disabled=false;
    }
}
*/
function getRowID(){
}
var xname=0;
function getElements()
  {
  var tcost;
  var Pcost;
//  var xname=0;
  tcost=0;
  
 var x=document.forms[1].getElementsByTagName("input");
 

 for(i=0;i<x.length;i++)
      {
     // alert("xname"+ xname);
          if((x(i).type=="text") && (document.forms[1].htxtCostPage.value=="I"))  
          {
             if((x(i).name=="txtAppCostTrainerFees") ||( x(i).name=="txtAppCostTrnAndLrnMatrl") || (x(i).name=="txtAppCostAdvertis") || (x(i).name=="txtAppCostStationery") || (x(i).name=="txtAppCostMealAndRef") || (x(i).name=="txtAppCostAdminExp") || (x(i).name=="txtAppCostOthers")|| (x(i).name=="txtAppCostOthersnew")|| (x(i).name=="txtAppCostPerPartc") )
             {
              /* if ((x(i).name=="txtAppCostTrainerFees") && (document.forms[1].txtAppCostTrainerFees.value!=""))
                {
                   if (parseInt(document.forms[1].txtAppCostTrainerFees.value) > parseInt(document.forms[1].txtCostTrainerFees.value))
                   {
                     document.forms[1].txtAppCostTrainerFees.focus();
                     alert("Approved Cost Trainer's fees cannot be greater then the actual cost trainer fees.");
                     document.getElementById('AppCostTrainer').style.display = 'block';
                     xname=1;
                     break;
                   }else
                   {
                      document.getElementById('AppCostTrainer').style.display = 'none';
                   }
                }
                
                if (x(i).name=="txtAppCostTrnAndLrnMatrl" && document.forms[1].txtAppCostTrnAndLrnMatrl.value!="")
                {
                   if (parseInt(document.forms[1].txtAppCostTrnAndLrnMatrl.value) > parseInt(document.forms[1].txtCostTrnAndLrnMatrl.value)){
                   //  alert("Approved Training/Learning Materials cannot be greater then the actual Training/Learning Materials.");
                      document.forms[1].txtAppCostTrnAndLrnMatrl.focus();
                      
                       document.getElementById('AppCostTrnAndLrnMatrl').style.display = 'block';
                      xname=1;
                      break;
                   }else
                   {
                   document.getElementById('AppCostTrnAndLrnMatrl').style.display = 'none';
                   }
                   
                }
                if (x(i).name=="txtAppCostAdvertis")
                {
                   if (parseInt(document.forms[1].txtAppCostAdvertis.value) > parseInt(document.forms[1].txtCostAdvertis.value)){
                   //  alert("Approved advertisement cannot be greater then the actual advertisement.");
                      document.forms[1].txtAppCostAdvertis.focus();
                       document.getElementById('AppCostAdvertis').style.display = 'block';
                      xname=1;
                      return false;
                   }else
                   {
                   document.getElementById('AppCostAdvertis').style.display = 'none';
                   }
                }
                
                if (x(i).name=="txtAppCostStationery")
                {
                   if (parseInt(document.forms[1].txtAppCostStationery.value) > parseInt(document.forms[1].txtCostStationery.value)){
                    // alert("Approved stationery cannot be greater then the actual stationery.");
                      document.forms[1].txtAppCostStationery.focus();
                       document.getElementById('AppCostStationery').style.display = 'block';
                      xname=1;
                      return false;
                   }else
                   {
                   document.getElementById('AppCostStationery').style.display = 'none';
                   }
                }
                if (x(i).name=="txtAppCostMealAndRef")
                {
                   if (parseInt(document.forms[1].txtAppCostMealAndRef.value) > parseInt(document.forms[1].txtCostMealAndRef.value)){
                    // alert("Approved meals and refreshments cannot be greater then the actual meals and refreshments.");
                      document.forms[1].txtAppCostMealAndRef.focus();
                       document.getElementById('AppCostMealAndRef').style.display = 'block';
                      xname=1;
                      return false;
                   }else
                   {
                   document.getElementById('AppCostMealAndRef').style.display = 'none';
                   }
                }
                 if (x(i).name=="txtAppCostAdminExp")
                {
                   if (parseInt(document.forms[1].txtAppCostAdminExp.value) > parseInt(document.forms[1].txtCostAdminExp.value)){
                   //  alert("Approved administration expenses cannot be greater then the actual administration expenses.");
                      document.forms[1].txtAppCostAdminExp.focus();
                       document.getElementById('AppCostAdminExp').style.display = 'block';
                      xname=1;
                      return false;
                   }else
                   {
                   document.getElementById('AppCostAdminExp').style.display = 'none';
                   }
                }
                 if (x(i).name=="txtAppCostOthers")
                {
                   if (parseInt(document.forms[1].txtAppCostOthers.value) > parseInt(document.forms[1].txtCostOthers.value)){
                   //  alert("Approved others cannot be greater then the actual others.");
                      document.forms[1].txtAppCostOthers.focus();
                       document.getElementById('AppCostOthers').style.display = 'block';
                      xname=1;
                      return false;
                   }else
                   {
                   document.getElementById('AppCostOthers').style.display = 'none';
                   }
                }
                 if (x(i).name=="txtAppCostPerPartc")
                {
                
                   if (parseInt(document.forms[1].txtAppCostPerPartc.value) > parseInt(document.forms[1].txtCostPerPartc.value)){
                   //  alert("Approved cost per participant cannot be greater then the actual cost per participant.");
                      document.forms[1].txtAppCostPerPartc.focus();
                       document.getElementById('AppCostPerPartc').style.display = 'block';
                      xname=1;
                      return false;
                   }else
                   {
                   document.getElementById('AppCostPerPartc').style.display = 'none';
                   }
                }
                // Pcost=document.forms[2].txtCostTotCost.value;
                // alert(x(i).name + x(i).value);*/
           
               var val;
                if (x(i).value=="")
                {
                //alert("Zero")
                val=0;
                }
                else
                {
                val=parseFloat(x(i).value);
                //alert(val)
                }
                  
                 tcost += val;
                 document.forms[1].txtAppCostTotCost.value=Math.round(tcost*100)/100;
           }
          }
          
        }
     }
     
     function getElementsInst()
  {
  var tcost;
  var Pcost;
//  var xname=0;
  tcost=0;
  
 var x=document.forms[1].getElementsByTagName("input");
 

 for(i=0;i<x.length;i++)
      {

          if((x(i).type=="text") && (document.forms[1].htxtCostPage.value=="O"))  
          {
             if((x(i).name=="txtAppCostTrainerFees1") ||( x(i).name=="txtAppCostTrnAndLrnMatrl1") || (x(i).name=="txtAppCostAdvertis1") || (x(i).name=="txtAppCostStationery1") || (x(i).name=="txtAppCostMealAndRef1") || (x(i).name=="txtAppCostAdminExp1") || (x(i).name=="txtAppCostOthers1")|| (x(i).name=="txtAppCostOthers1new") || (x(i).name=="txtAppCostPerPartc1") )
             {
          
           
               var val;
                if (x(i).value=="")
                {
               
                val=0;
                }
                else
                {
                val=parseFloat(x(i).value);
                //alert(val)
                }
                  
                 tcost += val;
                 document.forms[1].txtAppCostTotCost1.value=Math.round(tcost*100)/100;
           }
          }
          
        }
     }
function setFocus(xname)
{
 alert(xname);
document.forms[1].txtAppCostTrainerFees.focus();
}
function addCost(elementRefa,evt)
//function addCost(elementRefa)
{

//document.forms[1].cstprocess.disabled=false;
var curbut;
var str_cntlVal;
curbut= elementRefa.name;
str_cntlVal=elementRefa.value;
var x;
x=curbut;
evt = (evt)? evt : ((event)? event : null); 
   /* if (x=="txtAppCostTrainerFees")
    {
     if (parseInt(document.forms[1].txtAppCostTrainerFees.value) > parseInt(document.forms[1].txtCostTrainerFees.value))
     {
        document.forms[1].txtAppCostTrainerFees.focus();
        alert("Approved Cost Trainer's fees cannot be greater then the actual cost trainer fees.");
        // document.getElementById('AppCostTrainer').style.display = 'block';
        xname=1;
        window.event.cancelBubble = true;
        evt.returnValue = false; 
        return false;
     }else{
     xname=0;
     }
    }
     if (x=="txtAppCostTrnAndLrnMatrl")
     {
      if (parseInt(document.forms[1].txtAppCostTrnAndLrnMatrl.value) > parseInt(document.forms[1].txtCostTrnAndLrnMatrl.value)){
         alert("Approved Training/Learning Materials cannot be greater then the actual Training/Learning Materials.");
         document.forms[1].txtAppCostTrnAndLrnMatrl.focus();
      //   document.getElementById('AppCostTrnAndLrnMatrl').style.display = 'block';
      xname=1;
       window.event.cancelBubble = true;
        evt.returnValue = false; 
        return false;
        }else{
     xname=0;
     }
                   
  }
  if (x=="txtAppCostAdvertis")
  {
   if (parseInt(document.forms[1].txtAppCostAdvertis.value) > parseInt(document.forms[1].txtCostAdvertis.value)){
    alert("Approved advertisement cannot be greater then the actual advertisement.");
    document.forms[1].txtAppCostAdvertis.focus();
    //document.getElementById('AppCostAdvertis').style.display = 'block';
    xname=1;
     window.event.cancelBubble = true;
     evt.returnValue = false; 
     return false;
    
   }else{
     xname=0;
     }
   }
   if (x=="txtAppCostStationery")
   {
    if (parseInt(document.forms[1].txtAppCostStationery.value) > parseInt(document.forms[1].txtCostStationery.value)){
      alert("Approved stationery cannot be greater then the actual stationery.");
      document.forms[1].txtAppCostStationery.focus();
      xname=1;
      window.event.cancelBubble = true;
     evt.returnValue = false; 
     return false;
     // document.getElementById('AppCostStationery').style.display = 'block';
    }else{
     xname=0;
     }
    }
     if (x=="txtAppCostMealAndRef")
     {
      if (parseInt(document.forms[1].txtAppCostMealAndRef.value) > parseInt(document.forms[1].txtCostMealAndRef.value)){
      alert("Approved meals and refreshments cannot be greater then the actual meals and refreshments.");
     document.forms[1].txtAppCostMealAndRef.focus();
     xname=1;
      window.event.cancelBubble = true;
     evt.returnValue = false; 
     return false;
     }else{
     xname=0;
     }
     }
      if (x=="txtAppCostAdminExp")
     {
      if (parseInt(document.forms[1].txtAppCostAdminExp.value) > parseInt(document.forms[1].txtCostAdminExp.value)){
      alert("Approved administration expenses cannot be greater then the actual administration expenses.");
      document.forms[1].txtAppCostAdminExp.focus();
                   //    document.getElementById('AppCostAdminExp').style.display = 'block';
                   xname=1;
     window.event.cancelBubble = true;
     evt.returnValue = false; 
     return false;
     }else{
     xname=0;
     }
     }
    if (x=="txtAppCostOthers")
    {
    if (parseInt(document.forms[1].txtAppCostOthers.value) > parseInt(document.forms[1].txtCostOthers.value)){
     alert("Approved others cannot be greater then the actual others.");
     xname=1;
     document.forms[1].txtAppCostOthers.focus();
     window.event.cancelBubble = true;
     evt.returnValue = false; 
     return false;
    }else{
     xname=0;
     }
    }
    if (x=="txtAppCostPerPartc")
    {
    if (parseInt(document.forms[1].txtAppCostPerPartc.value) > parseInt(document.forms[1].txtCostPerPartc.value)){
     alert("Approved cost per participant cannot be greater then the actual cost per participant.");
     xname=1;
     document.forms[1].txtAppCostPerPartc.focus();
     window.event.cancelBubble = true;
     evt.returnValue = false; 
     return false;
    }else{
     xname=0;
     }
  }*/
  if (xname==0)
  {
  getElements();
  }
  
  
  
}  
function addCostInst(elementRefa,evt)

{

var curbut;
var str_cntlVal;
curbut= elementRefa.name;
str_cntlVal=elementRefa.value;
var x;
x=curbut;
evt = (evt)? evt : ((event)? event : null); 

  if (xname==0)
  {
  getElementsInst();
  }
  
  
  
}  
function addInstCost(elementRefa,evt)
{
document.forms[1].cstprocess.disabled=false;
var curbut;
var str_cntlVal;
curbut= elementRefa.name;
str_cntlVal=elementRefa.value;
var x;
x=curbut;
evt = (evt)? evt : ((event)? event : null); 
    if (x=="txtAppTrngCostAndPart")
    {
     if (parseInt(document.forms[1].txtAppTrngCostAndPart.value) > parseInt(document.forms[1].txtTrngCostAndPart.value))
     {
        document.forms[1].txtAppTrngCostAndPart.focus();
        alert("Approved Tuition Costs per participate cannot be greater then the actual cost Tuition Costs per participate.");
        // document.getElementById('AppCostTrainer').style.display = 'block';
        window.event.cancelBubble = true;
        evt.returnValue = false; 
        return false;
     }else if (document.forms[1].txtAppTrngCostAndPart.value=="0")
     {
     document.forms[1].txtAppTrngCostAndPart.focus();
     alert("Approved Tuition Costs per participate cannot be Zero.");
        // document.getElementById('AppCostTrainer').style.display = 'block';
      window.event.cancelBubble = true;
      evt.returnValue = false; 
      return false;
     }else if (document.forms[1].txtAppTrngCostAndPart.value=="")
     {
     document.forms[1].txtAppTrngCostAndPart.value=document.forms[1].txtTrngCostAndPart.value;
     }
     else{
         document.forms[1].txtAppTrngTotTuitionCost.value=(document.forms[1].txtAppTrngCostAndPart.value/document.forms[1].txtTrngCostAndPart.value)*document.forms[1].txtTrngTotTuitionCost.value;
     }
    }
   
 
 
                


}


//xname=false;
//Tab Key Code :9
//alert(curbut);
//document.forms[1].txtAppCostTrainerFees.focus();
//return false;

//

/*if (xname)
{
evt = (evt)? evt : ((event)? event : null); 
if (evt.preventDefault)
    { 
    evt.preventDefault(); 
    return false; 
    } 
    else
    {       
    evt.returnValue = false; 
    } 
return false;
}
else
return true;*/





</script>
    <script type="text/javascript">
function vFindControlCost(elementRefa)
{
var curbut;
var str_cntlVal;
curbut= elementRefa.value;
document.forms[1].cstprocess.disabled=false;
document.forms[1].htxtCostPage.value=document.forms[1].htxtCostPage.value;
document.forms[1].captureCostoperation.value=curbut; 
}

function processEnable()
{
document.forms[1].cstprocess.disabled=false;
}

function validateCost(Verifycost)
{
var isValid=true;
if (document.forms[1].htxtCostPage.value=="O")
{
  ///  isValid=validateRequired(CaptureClaimCostDtl);
    if (isValid)
    {
    
           if ((document.forms[1].txtAppTrngCostAndPart.value=="0") && (document.forms[1].txtAppTrngTotTuitionCost.value=="0")) {
                alert("Tuition Cost per participate and Total Tuition Cost is Zero.");
                isValid=false;
                return false;
            }else if (!(parseInt(document.forms[1].txtAppTrngTotTuitionCost.value) >= parseInt(document.forms[1].txtAppTrngCostAndPart.value)) ){
               alert("Total Tuition Cost should be greater than or equal to Tuition Cost per participate.");
                isValid=false;
                return false;
            }
            else{
               return isValid;
          }
    }else{
    return isValid;
    }
}
    else
    {
         if ( document.forms[1].txtAppCostTotCost.value=="0" )
        {
        alert("Total cost is Zero");
        return false;
        }
        else
        {
        return true;
        }
    }
}




</script>
  </head>
  <body onload="onClaimLoad();">
                      <table width="100%" border="0" cellspacing="0"
                             cellpadding="1">
                        <tr>
                          <td valign="top" class="head_bgcolor">
                            <bean:message key="CCDtl.verifytitle"/>
                          </td>
                        </tr>
                        <tr>
                          <td valign="top" class="padding5px">
                            <table width="100%"
                                   border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td valign="top">
                                  <table width="100%" border="0" cellspacing="0"
                                         cellpadding="0">
                                    <tr>
                                      <td valign="top">
                                        <table border="0" class="details_table"
                                               cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>
                                              <bean:message key="prompt.Common.DetailsSecTitle"/>
                                            </td>
                                          </tr>
                                        </table>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <%@ include file="/claims/ClmRegCommon.jsp"%>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                              <tr>
                                <td valign="top">
                                  <div id="second">
                                    <html:form action="/VerifyCost.do?methodToCall=getVerifyCost"
                                               method="post">
                                      <table width="100%" border="0"
                                             cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td valign="top">
                                            <table border="0" cellspacing="0"
                                                   cellpadding="0">
                                              <tr>
                                                <td>
                                                  <table border="0"
                                                         class="details_table"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td>
                                                        <bean:message key="CCDtl.CostDetails"/>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                            </table>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td valign="top">
                                            <table class="field_table"
                                                   width="100%" border="0"
                                                   cellspacing="0"
                                                   cellpadding="0">
                                              <tr>
                                                <td valign="top"
                                                    class="height130">
                                                  <table width="100%" border="0"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td style="padding-right:5px;">
                                                        <table width="100%"
                                                               border="0"
                                                               cellspacing="0"
                                                               cellpadding="3">
                                                          <tr>
                                                            <td valign="top">
                                                              <table width="50%"
                                                                     border="0"
                                                                     align="center"
                                                                     cellpadding="2"
                                                                     cellspacing="0">
                                                                <tr>
                                                                  <td>&nbsp;</td>
                                                                  <td>&nbsp;</td>
                                                                  <td>
                                                                    <input type="radio"
                                                                           id="rd1"
                                                                           name="rd1"
                                                                           value="I"
                                                                           disabled="true"/>
                                                                          <!--  onclick="radiochange(this);"-->
                                                                          
                                                                    <bean:message key="CCDtl.InhouTran"/>
                                                                    <input type="radio"
                                                                           id="rd2"
                                                                           name="rd2"
                                                                           value="0"
                                                                           disabled="true"/>
                                                                          <!--  onclick="radiochange(this);"/>-->
                                                                    <bean:message key="CCDtl.InstTra"/>
                                                                  </td>
                                                                  <td>&nbsp;</td>
                                                                </tr>
                                                              </table>
                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td valign="top">
                                                              <table width="100%"
                                                                     border="0"
                                                                     cellpadding="2"
                                                                     cellspacing="1"
                                                                     bgcolor="#499cbd"
                                                                     id="tblInsi"
                                                                     style="display:none;">
                                                                <tr>
                                                                  <td width="30%"
                                                                      valign="top"
                                                                      bgcolor="#1e83ac" style="color:#ffffff;">
                                                                    <bean:message key="CCDtl.CostBreakDown"/>
                                                                  </td>
                                                                  <td width="30%"
                                                                      valign="top"
                                                                      bgcolor="#1e83ac" style="color:#ffffff;">
                                                                    <bean:message key="CCDtl.Amount"/>
                                                                  </td>
                                                                  <td width="350"
                                                                      valign="top"
                                                                      bgcolor="#1e83ac" style="color:#ffffff;">
                                                                    <bean:message key="CCDtl.ApprovedAmount"/>
                                                                  </td>
                                                                  
                                                                </tr>
                                                               <!--u -->  
                                                                 <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.TrainerFees"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostTrainerFees1"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e;color:#000000 "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostTrainerFees1"
                                                                               tabindex="1"
                                                                               readonly="false"
                                                                               onblur=" return addCostInst(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                   
                                                                  </td>
                                                                 
                                                                </tr>
                                                                 <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <bean:message key="CCDtl.Trn/LrnMatrl"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtCostTrnAndLrnMatrl1"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtAppCostTrnAndLrnMatrl1"
                                                                               name="VerifyCost"
                                                                               tabindex="2"
                                                                               onblur=" return addCostInst(this,event);"
                                                                               onkeypress="return isNumeric();"/>
                                                                   
                                                                  </td>
                                                                  
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.Advertisement"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostAdvertis1"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostAdvertis1"
                                                                               tabindex="3"
                                                                               onblur=" return addCostInst(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <bean:message key="CCDtl.Stationery"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtCostStationery1"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtAppCostStationery1"
                                                                               tabindex="4"
                                                                               onblur=" return addCostInst(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                <tr>
                                                               <tr>
                                                              
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.MealAndRef"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostMealAndRef1"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostMealAndRef1"
                                                                               tabindex="5"
                                                                               onblur=" return addCostInst(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                  
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <bean:message key="CCDtl.AdminExp"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtCostAdminExp1"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtAppCostAdminExp1"
                                                                               tabindex="6"
                                                                               onblur=" return addCostInst(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.Others"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostOthers1"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostOthers1"
                                                                               tabindex="7"
                                                                               onblur=" return addCostInst(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                 <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.Others1"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostOthers1new"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostOthers1new"
                                                                               tabindex="7"
                                                                               onblur=" return addCostInst(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <bean:message key="CCDtl.CostPerPartc"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtCostPerPartc1"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtAppCostPerPartc1"
                                                                               tabindex="8"
                                                                               onblur=" return addCostInst(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.TotCost"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostTotCost1"
                                                                               readonly="true"
                                                                               name="VerifyCost"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostTotCost1"
                                                                               readonly="true"
                                                                               name="VerifyCost"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                 
                                                                </tr> 
                                                              <!--u -->

                                                               <!-- <tr>
                                                                 <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                     <bean:message key="CCDtl.TuitCost/partic"/>
                                                                    <bean:message key="prompt.Common.LabelSuffix"/>

                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtTrngCostAndPart"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e;   "/>      

                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppTrngCostAndPart"
                                                                               name="VerifyCost"
                                                                               readonly="false"
                                                                               tabindex="1"
                                                                                onkeypress="return isNumeric();"
                                                                               />  

                                                                   
                                                                  </td>
                                                                 
                                                                </tr> 
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <bean:message key="CCDtl.TotTuitionCost"/>
                                                                    <bean:message key="prompt.Common.LabelSuffix"/> 

                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                   <html:text property="txtTrngTotTuitionCost"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>

                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtAppTrngTotTuitionCost"
                                                                               name="VerifyCost"
                                                                               readonly="false"
                                                                               tabindex="2"
                                                                                onkeypress="return isNumeric();"
                                                                               />

                                                                   
                                                                  </td>
                                                                  
                                                                </tr>-->
                                                              </table>
                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td valign="top">
                                                              <table width="100%"
                                                                     border="0"
                                                                     cellpadding="2"
                                                                     cellspacing="1"
                                                                     bgcolor="#499cbd"
                                                                     id="tblInhouse"
                                                                     style="display:none;">
                                                                <tr>
                                                                  <td width="30%"
                                                                      valign="top"
                                                                      bgcolor="#1e83ac" style="color:#ffffff;">
                                                                    <bean:message key="CCDtl.CostBreakDown"/>
                                                                  </td>
                                                                  <td width="30%"
                                                                      valign="top"
                                                                      bgcolor="#1e83ac" style="color:#ffffff;">
                                                                    <bean:message key="CCDtl.Amount"/>
                                                                  </td>
                                                                  <td width="350"
                                                                      valign="top"
                                                                      bgcolor="#1e83ac" style="color:#ffffff;">
                                                                    <bean:message key="CCDtl.ApprovedAmount"/>
                                                                  </td>
                                                                  
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.TrainerFees"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostTrainerFees"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e;color:#000000 "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostTrainerFees"
                                                                               tabindex="1"
                                                                               readonly="false"
                                                                               onblur=" return addCost(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                   
                                                                  </td>
                                                                 
                                                                </tr>  <!--vv -->
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <bean:message key="CCDtl.Trn/LrnMatrl"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtCostTrnAndLrnMatrl"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtAppCostTrnAndLrnMatrl"
                                                                               name="VerifyCost"
                                                                               tabindex="2"
                                                                               onblur=" return addCost(this,event);"
                                                                               onkeypress="return isNumeric();"/>
                                                                   
                                                                  </td>
                                                                  
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.Advertisement"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostAdvertis"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostAdvertis"
                                                                               tabindex="3"
                                                                               onblur=" return addCost(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <bean:message key="CCDtl.Stationery"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtCostStationery"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtAppCostStationery"
                                                                               tabindex="4"
                                                                               onblur=" return addCost(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                <tr>
                                                              
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.MealAndRef"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostMealAndRef"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostMealAndRef"
                                                                               tabindex="5"
                                                                               onblur=" return addCost(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                  
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <bean:message key="CCDtl.AdminExp"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtCostAdminExp"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtAppCostAdminExp"
                                                                               tabindex="6"
                                                                               onblur=" return addCost(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.Others"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostOthers"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostOthers"
                                                                               tabindex="7"
                                                                               onblur=" return addCost(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                
                                                                  <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.Others1"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostOthersnew"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostOthersnew"
                                                                               tabindex="7"
                                                                               onblur=" return addCost(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <bean:message key="CCDtl.CostPerPartc"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtCostPerPartc"
                                                                               name="VerifyCost"
                                                                               readonly="true"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#cae7f0">
                                                                    <html:text property="txtAppCostPerPartc"
                                                                               tabindex="8"
                                                                               onblur=" return addCost(this,event);"
                                                                               onkeypress="return isNumeric();"
                                                                               name="VerifyCost"/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <bean:message key="CCDtl.TotCost"/><bean:message key="prompt.Common.LabelSuffix"/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtCostTotCost"
                                                                               readonly="true"
                                                                               name="VerifyCost"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                  <td valign="top"
                                                                      bgcolor="#e2f5fb">
                                                                    <html:text property="txtAppCostTotCost"
                                                                               readonly="true"
                                                                               name="VerifyCost"
                                                                               style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/>
                                                                  </td>
                                                                 
                                                                </tr>
                                                              </table>
                                                            </td>
                                                          </tr>
                                                           <!--start -->
                                                               
                                                               <tr>
                                                             
                                                                 <td> 
                                                                 Remarks:
                                                                 <html:text property="txtRemarks"
                                                                            name="VerifyCost"
                                                                            size="90"/>                                                    
                                                                         

                                                                  </td>
                                                                </tr> 
                                                                
                                                                
                                                               <!--end -->
                                                          <tr>
                                                            <td valign="top"
                                                                class="padding5px">
                                                              <table class="field_table"
                                                                     width="100%"
                                                                     border="0"
                                                                     cellspacing="0"
                                                                     cellpadding="3">
                                                                <tr>
                                                                
                                                                  <td class="mandatory">
                                                                    <bean:message key="prompt.Comman.Mandatory"/>
                                                                  </td>
                                                                  <td>
                                                                    <div align="right">
                                                                      <html:hidden property="curtab"
                                                                                   name="VerifyCost"/>
                                                                       
                                                                      <html:hidden property="comcat"
                                                                                   name="VerifyCost"
                                                                                   value="<%=comcat %>"/>
                                                                       
                                                                      <html:hidden property="clmrefno"
                                                                                   name="VerifyCost"/>
                                                                      <input type="hidden"  name="txtClaimRefNum" id="txtClaimRefNum" >
                                                                      <html:hidden property="htxtCostPage"
                                                                                   name="VerifyCost"/>
                                                                      <html:hidden property="costtype"  name="VerifyCost" />  
                                                                      <html:hidden property="captureCostoperation"
                                                                                   name="VerifyCost"/>
                                                                       
                                                                      <html:hidden property="htxtCostMode"
                                                                                   name="VerifyCost"/>
                                                                       
                                                                      <html:submit tabindex="9"
                                                                                   property="btnSearch"
                                                                                   value="Search"
                                                                                   onclick="processEnable(this);return vFindControlCost(this);"/>
                                                                       
                                                                      <html:submit tabindex="10"
                                                                                   property="cstprocess"
                                                                                   value="Process"
                                                                                   onclick="vFindControlCost(this);return validateCost(VerifyCost);"/>
                                                                       
                                                                      <html:submit tabindex="11"
                                                                                   property="btnClear"
                                                                                   value="Clear"
                                                                                   onclick="vFindControlCost(this);"/>
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
                                    </html:form>
                                  </div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                   </body>
</html>