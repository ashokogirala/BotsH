<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page import="java.util.*,java.text.DecimalFormat,com.vtfs.util.VTFSLogger"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
%>
<%! @SuppressWarnings("cast") %>
 <link type="text/css" rel="stylesheet" href="styles/boto.css"/>
 <link href="styles/menu_home.css" type="text/css" rel="stylesheet"></link>
      <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
      <link rel="stylesheet" type="text/css" media="all" href="js/skins/aqua/theme.css" title="Aqua" />
     <script language="javascript" type="text/javascript" src="js/menu_home.js"></script>
     
      <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
     <script type="text/javascript" src="js/calendar_inc.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/lang/calendar-en.js"></script>
     <script type="text/javascript" language="javascript"> 
     function onClaimLoad(){
   // alert("document.forms[1].curTabNew.value==="+document.forms[1].curTabNew.value);
   //alert(document.forms[0].comcat.value);
    checkClearData();
    
    var clmStatus='<%=request.getAttribute("clmStatus") %>';
    
    var clmcomClear='<%=request.getAttribute("ClaimComClear") %>';
    
    var pgmFlag='<%=request.getAttribute("pgmFlag") %>';
    
    var trnFlag='<%=request.getAttribute("TrnFlag") %>';
     
    var cnDeleteTraParti='<%=request.getAttribute("CannotDelTrainiParti") %>';  
    
    var traineDeleteResult='<%=request.getAttribute("TraineDeleteResult") %>';
    
     if(cnDeleteTraParti=="CannotDelTrainiPartiDueToCostDoc")
    {
       alert("Cost and Document details exists for this claim! so cannot details Training Particulars Details .");   
    }
    
     if(cnDeleteTraParti=="CannotDelTrainiPartiDueToCost")
    {
       alert("Cost details exists for this claim! so cannot details Training Particulars Details .");   
    }
    
     if(cnDeleteTraParti=="CannotDelTrainiPartiDueToDoc")
    {
       alert("Document details exists for this claim! so cannot details Training Particulars Details .");   
    }
    
    if(traineDeleteResult=="Traine_Success"){
      alert("Training particulars details deleted successfully!.");
    }
    
    if(traineDeleteResult=="Traine_Fail")
    {
    alert("Training particulars details is not deleted.");
    }
    
    if(traineDeleteResult=="Traine_Contact_Admin")
    {
    alert("Training particulars details is not deleted! Contact system administrator");
    }
    
   
    
    if(pgmFlag=="DublicateProgramCode"){
      alert("Dublicate Program Code found! Could not be added.");
    }
    
     if(pgmFlag=="DublicateProgramName"){
      alert("Dublicate Program Name found! Could not be added.");
    }
    
    
    
    
    
    if(trnFlag=="Dublicate"){
      alert("Dublicate Trainee found! Could not be added.");
    }
    
    
    if(clmStatus=="capture"){
       document.forms[0].status.value="Data Captured";
   }
   
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
   
   
//alert(document.forms[0].title.value);
     if (!(document.forms[0].title.value==""))
     {
    //addtrn
   // document.forms[1].addtrn.disabled=false;
   // document.forms[1].addpgm.disabled=false;
   // document.forms[1].delpgm.disabled=false;
  //  document.forms[1].bdeltrn.disabled=false;
    //document.forms[1].trnsearch.disabled=false;
    document.forms[1].trnsave.disabled=false;
    document.forms[1].trndelete.disabled=false;
    document.forms[2].cstsave.disabled=false;
    document.forms[2].cstdelete.disabled=false;
    
    document.forms[3].adddoc.disabled=false;
    document.forms[3].bdeldoc.disabled=false;
    
    document.forms[1].txtClaimRefNum.value=document.forms[0].claimrefno.value;
   
    document.forms[2].clmrefno.value=document.forms[0].claimrefno.value;
    document.forms[3].clmrefno.value=document.forms[0].claimrefno.value;
   
     }else{
   // document.forms[1].addtrn.disabled=true;
  //  document.forms[1].addpgm.disabled=true;
  //  document.forms[1].delpgm.disabled=true;
  //  document.forms[1].bdeltrn.disabled=true;
 
    document.forms[1].trnsearch.disabled=false;
    document.forms[1].trnsave.disabled=true;
    document.forms[1].trndelete.disabled=true;
    document.forms[1].trnclear.disabled=false;
    
    document.forms[2].cstsave.disabled=true;
    document.forms[2].cstdelete.disabled=true;
    
    document.forms[3].adddoc.disabled=true;
    document.forms[3].bdeldoc.disabled=true;
     }
   if (document.forms[1].htxtoperMode.value=="Update")
   {
    document.forms[1].addtrn.disabled=false;
    document.forms[1].addpgm.disabled=false;
    document.forms[1].delpgm.disabled=false;
    document.forms[1].bdeltrn.disabled=false;
   }else{
    document.forms[1].addtrn.disabled=true;
    document.forms[1].addpgm.disabled=true;
    document.forms[1].delpgm.disabled=true;
    document.forms[1].bdeltrn.disabled=true;
   }
  
  
  
    if(document.forms[1].curTabNew.value=="1")
    {
    document.getElementById('first').style.display = 'block';
    document.getElementById('second').style.display = 'none';
    document.getElementById('third').style.display = 'none';
    }

  else if ( document.forms[1].curTabNew.value=="2")
    {
      document.getElementById('first').style.display = 'none';
      document.getElementById('second').style.display = 'block';
      document.getElementById('third').style.display = 'none';
      var rd;
     rd=document.forms[2].htxtCostPage.value;
   // alert(rd);

        if(rd=="I")
        {
        document.getElementById('tblInhouse').style.display = 'block'
        document.getElementById('tblInsi').style.display = 'none'
        document.forms[2].htxtCostPage.value="I";
        document.getElementById('rd1').checked=true;
        }
        else
        {
         document.getElementById('tblInsi').style.display = 'block'
         document.getElementById('tblInhouse').style.display = 'none'
      //  document.getElementById('tblInsi').style.display = 'block'
        document.forms[2].htxtCostPage.value="O";
        document.getElementById('rd2').checked=true;
        }
     if (!(document.forms[1].htxtoperMode.value=="Update"))
    {
   // alert("After saving Insititution details only cost details can be saved.");
    document.forms[2].cstsave.disabled=true;
    document.forms[2].cstdelete.disabled=true;
    }
    else
    {
    document.forms[2].cstsave.disabled=false;
    document.forms[2].cstdelete.disabled=false;
    }  
    }
    else if (document.forms[1].curTabNew.value=="3")
    {
       document.getElementById('first').style.display = 'none';
       document.getElementById('second').style.display = 'none';
       document.getElementById('third').style.display = 'block';
    }
    else
    {
      document.getElementById('first').style.display = 'block';
      document.getElementById('second').style.display = 'none';
      document.getElementById('third').style.display = 'none';
    }
   
   
}


    function getclmdetails()
    {
    alert("Parent");
    }
    
    
    function checkSex(){
        
        if((document.forms[1].sex.value=="f") || (document.forms[1].sex.value=="F")){
         
        document.forms[1].sex.value ="F";
        }else if((document.forms[1].sex.value=="m") || (document.forms[1].sex.value=="M")){
               document.forms[1].sex.value ="M";
     }else{
            alert("Please enter M or F !");
            document.forms[1].sex.focus();
     }
    
    }
    
function validateDelete(){

  if(validate()){
      if(document.forms[1].txtInstAccNo.value!=""){
                if(confirm("Are u sure to delete the Training Particulars Details."))
                   return true;
                else   
                   return false;
      }
  }else{
    return false;
  }     
}


function validate()
{

var isValid=true;
var strMessage="";
//txtInstAccNo
//txtTrngInstName
//txtTrngCourseStDt
//txtTrngCourseEndDt
//NumOfHrs 
 
         if (document.forms[1].txtInstAccNo.value=='')
         {
        
       strMessage=strMessage+'Institution Accreditation No'+'\n'; 
        
         }
         
         if (document.forms[1].txtTrngInstName.value=='')
         {
         
        strMessage=strMessage+'Institution name'+'\n';
         }          if (document.forms[1].txtTrngCourseStDt.value=='')
         {
        
         strMessage=strMessage+'Course Start Date'+'\n';
         }
         if (document.forms[1].txtTrngCourseEndDt.value=='')
         {
        
         strMessage=strMessage+'End Date'+'\n';
         }    
         if (document.forms[1].txtTrngNumOfHrs.value=='')
         {
        
         strMessage=strMessage+'No. of Hours'+'\n';
         }   
         
         if (!(strMessage==''))
         {
         alert('The following fields are required \n'+strMessage);
           return false;
        }
        else
        {
      
        isValid=comparWithSysDates1();
       // alert(isValid);
            if (isValid){
            return true;
            }else{
            return false;
            }
        }
}
 
function getMonth(mon1){
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
   return mon
}

function validateCost(CaptureClaimCostDtl)
{
var isValid=true;
if (document.forms[2].htxtCostPage.value=="O")
{
    isValid=validateRequired(CaptureClaimCostDtl);
    if (isValid)
    {
           if ((document.forms[2].txtTrngCostAndPart.value=="0") && (document.forms[2].txtTrngTotTuitionCost.value=="0")) {
                alert("Tuition Cost per participate and Total Tuition Cost is Zero.");
                isValid=false;
                return false;
            }else if ((parseInt(document.forms[2].txtTrngTotTuitionCost.value) < parseInt(document.forms[2].txtTrngCostAndPart.value) )){
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
         if ( document.forms[2].txtCostTotCost.value=="0" )
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

function validateDoc(){
var isValid=true;
var subdate=document.forms[3].txtSubDate.value;
var clmDate=document.forms[0].claimdate.value;
isValid=compareDatesDoc();
return isValid;
}

 function compareDatesDoc() 
{ 


var str1=document.forms[3].txtSubDate.value;
var str2=document.forms[0].claimdate.value;
var str3=document.forms[0].claimdate.value;
 
    var dt1   = parseInt(str1.substring(0,2)); 
    var mon1  = str1.substring(3,6);
    var yr1=parseInt(str1.substring(7,11));
 
 
    var monnum1 =getMonth(mon1);
  
    var dt2   = parseInt(str2.substring(0,2)); 
    var mon2  = str2.substring(3,6);
    var yr2=parseInt(str2.substring(7,11));


   var monnum2=getMonth(mon2);
   
   /* var dt3   = parseInt(str3.substring(0,2)); 
    var mon3  = str3.substring(3,6);
    var yr3=parseInt(str3.substring(7,11));

    var monnum3=getMonth(mon3);*/
   var dat = new Date();
 
  var sysDat=new Date(dat.getFullYear(), dat.getMonth(), dat.getDate());   
  //alert("selec date="+sysDat);
 
 
  var date1 = new Date(yr1, monnum1, dt1); 
  var date2 = new Date(yr2, monnum2, dt2); 
 // var date3 = new Date(yr3, monnum3, dt3); 
   if(date1 < date2) 
   
  return true;
}  



function radiochange(rdclick)
{
var curbut;
curbut= rdclick.value;
//alert(curbut);
if (curbut=="I")
{
 document.getElementById('tblInhouse').style.display = 'block'
//document.getElementById('tblInhouse').style.display = 'block'
 document.getElementById('tblInsi').style.display = 'none'
document.forms[2].htxtCostPage.value="I";
 document.getElementById('rd1').checked=true;
 document.getElementById('rd2').checked=false;
            document.forms[2].cstsave.disabled=false;
            document.forms[2].cstdelete.disabled=false;
     //   }
}
else
{
 document.getElementById('tblInsi').style.display = 'block'
 document.getElementById('tblInhouse').style.display = 'none'
//document.getElementById('tblInsi').style.display = 'block'
document.forms[2].htxtCostPage.value="O";

 document.getElementById('rd1').checked=false;
 document.getElementById('rd2').checked=true;
   /*     if ((document.forms[2].costtype.value=="I"))
        {
           
            document.forms[2].cstsave.disabled=true;
            document.forms[2].cstdelete.disabled=true;
        }
        if ((document.forms[2].costtype.value=="O"))
        {
        
        */   //  kannan comment
        
            document.forms[2].cstsave.disabled=false;
            document.forms[2].cstdelete.disabled=false;
       // }

}

}
function getRowID(){
}
function updateStatus(elementRefa,index)
{
    var curindex;
    var curbut;
    var str_Val;
    curbut= elementRefa.value;
    curindex=document.forms[1].delindexpgm.value;
    if (elementRefa.checked)
    {
        if (curindex=="")
        {
        document.forms[1].delindexpgm.value="{"+index+"},";
        }else
        {
        document.forms[1].delindexpgm.value= curindex+"{"+index+"},";
        }
    }else
    {
    str_Val="{"+index+"},";
    curindex=curindex.replace(str_Val,"");
    document.forms[1].delindexpgm.value= curindex;
    }
  //  alert(document.forms[1].delindexpgm.value);
}
function updateStatusTrn(elementRefa,index)
{
    var curindex;
    var curbut;
    var str_Val;
    curbut= elementRefa.value;
    curindex=document.forms[1].delindextrn.value;
    if (elementRefa.checked)
    {
        if (curindex=="")
        {
        document.forms[1].delindextrn.value="{"+index+"},";
        }else
        {
        document.forms[1].delindextrn.value= curindex+"{"+index+"},";
        }
    }else
    {
    str_Val="{"+index+"},";
    curindex=curindex.replace(str_Val,"");
    document.forms[1].delindextrn.value= curindex;
    }
  //  alert(document.forms[1].delindexpgm.value);
}
function updateStatusDoc(elementRefa,index)
{
    var curindex;
    var curbut;
    var str_Val;
    curbut= elementRefa.value;
    curindex=document.forms[3].delindexdoc.value;
    if (elementRefa.checked)
    {
        if (curindex=="")
        {
        document.forms[3].delindexdoc.value="{"+index+"},";
        }else
        {
        document.forms[3].delindexdoc.value= curindex+"{"+index+"},";
        }
    }else
    {
    str_Val="{"+index+"},";
    curindex=curindex.replace(str_Val,"");
    document.forms[3].delindexdoc.value= curindex;
    }
  //  alert(document.forms[1].delindexpgm.value);
}

</script>
 <script type="text/javascript" >
function assiontab(ctab,val)
{
//alert("assign tab"+ctab+"  "+val);
if (ctab==1)
{
document.forms[1].curtab.value=val;
document.forms[2].curtab.value="";
document.forms[3].curtab.value="";
}else if(ctab==2){
document.forms[1].curtab.value="";
document.forms[2].curtab.value=val;
document.forms[3].curtab.value="";
         if(document.forms[2].htxtCostPage.value=="I"){
        // document.getElementById('rd1').checked=true;
          document.getElementById('rd1').checked=true;
           document.getElementById('tblInhouse').style.display = 'block'
       // document.getElementById('tblInhouse').style.display = 'block'
       // document.getElementById('tblInsi').style.display = 'none'
          }else if(document.forms[2].htxtCostPage.value=="O"){
          document.getElementById('rd2').checked=true;
      //     document.getElementById('tblInhouse').style.display = 'block'
     //      document.getElementById('tblInhouse').style.display = 'none'
           document.getElementById('tblInsi').style.display = 'block'
        }else{
         document.getElementById('rd1').checked=true;
         document.getElementById('tblInhouse').style.display = 'block'
         document.forms[2].htxtCostPage.value="I";
        }
document.forms[2].htxtCostMode.value="";
}else
{
document.forms[1].curtab.value="";
document.forms[2].curtab.value="";
document.forms[3].curtab.value=val;
}
    if (!(document.forms[1].htxtoperMode.value=="Update") && (ctab==2) )
    {
    
       if(document.forms[0].claimrefno.value!=""){
        alert("After saving Insititution details only cost details can be saved.");
       } 
        if(document.forms[2].htxtCostPage.value=="I"){
        
        document.forms[2].cstsave.disabled=false;
        document.forms[2].cstdelete.disabled=false;
       // document.getElementById('tblInhouse').style.display = 'block'
       // document.getElementById('tblInsi').style.display = 'none'
      }else if(document.forms[2].htxtCostPage.value=="O"){
            document.forms[2].cstsave.disabled=false;
           document.forms[2].cstdelete.disabled=false;
        //   document.getElementById('tblInhouse').style.display = 'none'
        //   document.getElementById('tblInsi').style.display = 'block'
        } 
    }
    else
    {
        document.forms[2].cstsave.disabled=false;
        document.forms[2].cstdelete.disabled=false;
        
    }
}
 function getElements()
{
    var tcost;
    var Pcost;
    tcost = 0;
    Pcost = 0;
    var x = document.forms[2].getElementsByTagName("input");
    
    for(i = 0; i < x.length; i++)
    {
        if((x(i).type == "text") && (document.forms[2].htxtCostPage.value == "O"))
        {
            if((x(i).name == "txtCostTrainerFees") || (x(i).name == "txtCostTrnAndLrnMatrl") || (x(i).name == "txtCostAdvertis") || (x(i).name == "txtCostStationery") || (x(i).name == "txtCostMealAndRef") || (x(i).name == "txtCostAdminExp") || (x(i).name == "txtCostOthers") || (x(i).name == "txtCostOthers1") || (x(i).name == "txtCostPerPartc"))
            {
                // alert(x(i).name + x(i).value);
                var val;
                if(x(i).value == "")
                {
                    val = 0;
                }
                else
                {
                    val = parseFloat(x(i).value);
                }
                tcost += val;
                document.forms[2].txtCostTotCost.value = Math.round(tcost * 100) / 100
            }
        }
        else if((x(i).type == "text") && (document.forms[2].htxtCostPage.value == "I" || document.forms[2].htxtCostPage.value == ""))
        {            
            if(x(i).name == "txtTrngCostAndPart")
            {
                var trnListSize = '<%= (Integer)request.getSession().getAttribute("trnListSize") %>';
                var val;
                if(x(i).value == "")
                {
                    val = 0;
                }
                else
                {
                    val = parseInt(x(i).value);
                }
    
                Pcost = trnListSize * val;
                document.forms[2].txtTrngTotTuitionCost.value = Math.round(Pcost * 100) / 100;
            }
        }
    }
} 


function addCost(elementRefa)
{
var curbut;
var str_cntlVal;
curbut= elementRefa.name;
str_cntlVal=elementRefa.value;
var x;
x=curbut;
getElements();        
}
function vFindControl(curr,elementRefa)
{
var curbut;
var str_cntlVal;
curbut= elementRefa.value;
document.forms[1].captureoperation.value=curbut;
if (curr==1){
    if ((document.forms[1].captureoperation.value=="Add Row") && (!(document.forms[1].htxtMode.value=="UP"))){
    document.forms[1].htxtMode.value=curr;   
    } else
    {
    //alert(document.forms[1].htxtMode.value);    
    }
     if ((document.forms[1].captureoperation.value=="Delete Row") && (!(document.forms[1].htxtMode.value=="UP"))){
    document.forms[1].htxtMode.value=curr;    
    } else
    {   
    //alert(document.forms[1].htxtMode.value);
    }
} else if (curr==2){
     if ((document.forms[1].captureoperation.value=="Add Row") && (!(document.forms[1].htxtMode.value=="UTP"))){
    document.forms[1].htxtMode.value=curr;    
    } else
    {    
    }
     if ((document.forms[1].captureoperation.value=="Delete Row") && (!(document.forms[1].htxtMode.value=="UTP"))){
    document.forms[1].htxtMode.value=curr;    
    } else
    {   
    //alert(document.forms[1].htxtMode.value);
    }
}  

document.forms[2].curtab.value="";
document.forms[3].curtab.value="";
}
 
function vFindControlCost(elementRefa)
{

var curbut;
var str_cntlVal;
curbut= elementRefa.value;
document.forms[2].htxtCostPage.value=document.forms[2].htxtCostPage.value;
//alert(document.forms[2].htxtCostPage.value);
document.forms[2].captureCostoperation.value=curbut;
getElements();
document.forms[1].curtab.value="";
document.forms[3].curtab.value="";
}

    
function vFindControlDoc(curr,elementRefa)
{
var curbut;
var str_cntlVal;
curbut= elementRefa.value;
document.forms[3].captureDocoperation.value=curbut;

}
  
  
function fillDocCode(DescList)
{
 
var acomlist = new Array();
var selitem;
var seldpk;
var listString =document.forms[3].lstDesc.value; 
var listdpk =document.forms[3].lstdpk.value; 
listString=listString.replace("[","");
listString=listString.replace("]","")
listdpk=listdpk.replace("[","");
listdpk=listdpk.replace("]","")

var selObj=document.forms[3].cboDocDesc;
var selIndex=selObj.selectedIndex;

if (selIndex>0)
{
selIndex=selIndex-1;
var listArray = listString.split(','); 
var listDpkArray =listdpk.split(',');
// Now you have an array in javascript of each value     
for(var i = 0; i < listArray.length; i++) {  
//alert(listArray[i]);    
if (i==selIndex)
selitem=listArray[selIndex];
seldpk=listDpkArray[selIndex];
}
document.forms[3].txtDocCode.value=selitem;
document.forms[3].txtDocPk.value=seldpk;
}
else if (selIndex==0)
{
document.forms[3].txtDocCode.value="";
document.forms[3].txtDocPk.value="";
}
 
}    

//added by ashok ogirala
function getOmangDet()
{
//alert(document.forms[1].omangid.value);
document.forms[1].submit();
}
</script>    
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>
      <bean:message key="prompt.Common.ApplicationTitle"/>
    </title>
    <script language="javascript" src="js/tab.js" type="text/javascript" ></script>
  </head>
  <%
       // String comcat=(String)request.getSession().getAttribute("comcat");
        
        //request.getSession().setAttribute("DocCodeDpk",DocDpklist);
        //request.getSession().setAttribute("DocCodelist",DocCodelist);
        //request.getSession().setAttribute("DocDesclist",DocDesclist);
        
        String curTabIndex=(String)request.getSession().getAttribute("CurTab");
        
        if(curTabIndex==null){
        VTFSLogger.logDebug("curTabIndex====null");
        curTabIndex="1";
        }
        VTFSLogger.logDebug("curTabIndex===="+curTabIndex);
        
        ArrayList DocDpklist=(ArrayList)request.getSession().getAttribute("DocCodeDpk");
        ArrayList DocCodelist=(ArrayList)request.getSession().getAttribute("DocCodelist");
        ArrayList DocDesclist=(ArrayList)request.getSession().getAttribute("DocDesclist");
        request.setAttribute("DocCodeDpk",DocDpklist);
        request.setAttribute("DocCodelist",DocCodelist);
        request.setAttribute("DocDesclist",DocDesclist);
        
          String loadclear=(String)request.getSession().getAttribute("loadclear");
        
  %>
  <body onload="onClaimLoad();"><html:errors/>
  
   
                     
                        <table width="100%" border="0" cellspacing="0"
                               cellpadding="1">
                          <tr>
                            <td valign="top" class="head_bgcolor">
                              <bean:message key="CCDtl.title"/>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" class="padding5px">
                              <table width="100%"
                                     border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td valign="top">
                                    <table width="100%" border="0"
                                           cellspacing="0" cellpadding="0">
                                     <tr>
                                        <td valign="top">
                                          <table border="0"
                                                 class="details_table"
                                                 cellspacing="0"
                                                 cellpadding="0">
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
                                    <%@ include file="/claims/ClmRegCommon.jsp" %>
                                    </td>
                                    </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td valign="top">
                                 <div id="first" style="display:block;">
                                 <html:form action="/CaptureClaimTpDtl.do?methodToCall=getTraining" method="post" >
                                  <html:javascript formName="CaptureClaimTpDtl"/>
                                      <table width="100%" border="0"
                                             cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td valign="top">
                                            <table border="0" cellspacing="0"
                                                   cellpadding="0">
                                              <tr>
                                                <td>
                                                  <table border="0"
                                                         class="selected_table"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td>
                                                        <bean:message key="CCDtl.TrainPart"/>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                  <table border="0"
                                                         class="details_table"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td>
                                                        <a href="javascript:sec_enable();assiontab('2','sec');"
                                                           id="sec">
                                                          <bean:message key="CCDtl.CostDetails"/>
                                                        </a>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                  <table border="0"
                                                         class="details_table"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td>
                                                        <a href="javascript:third_enable();assiontab('3','thr');"
                                                           id="thir">
                                                          <bean:message key="CCDtl.Documents"/>
                                                        </a>
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
                                                               cellspacing="2"
                                                               cellpadding="2">
                                                          <tr>
                                                            <td >
                               <bean:message key="CCDtl.TrainingHeld"/>
                               <bean:message key="prompt.Common.LabelSuffix"/>
                              </td>
                                                            <td width="280">
                               <html:select property="cboTrngHeldLocn"
                                            name="CaptureClaimTpDtl" style="width:275px;">
                                <html:option value="I" key="I">
                                 Botswana
                                </html:option>
                                <html:option value="O" key="O">
                                 Outside Botswana
                                </html:option>
                               </html:select>
                              </td>
                                                            <td >&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                          </tr>
                                                           <tr>
                                                            <td>
                                                              <bean:message key="CCDtl.InstAccUnder"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                            </td>
                                                            <td>
                                                                <html:select property="cboInstAccUnder" name="CaptureClaimTpDtl"  style="width:275px;">
                                                                    <html:option value="Vocational Training - BOTA" key="Vocational Training - BOTA"  />
                                                                    <html:option value="Tertiary education council" key="Tertiary education council"  />
                                                                    <html:option value="Others" key="Others"  />
                                                                </html:select>
                                                            </td>
                                                            <td>
                                                              <bean:message key="CCDtl.PriorAppr"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                            </td>
                                                            <td>
                                                                <html:checkbox  property="chkPriorAppr" name="CaptureClaimTpDtl" />
                                                                <input type="hidden" name="chkPriorAppr" value="false">

                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td>
                                                              <bean:message key="CCDtl.InstAccNo"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                              <span class="red12">*</span>
                                                            </td>
                                                            <td >
                                                                 <html:text property="txtInstAccNo"  name="CaptureClaimTpDtl" style="width:110px;"/> 
                                                                </td>
                                                                <td>
                                                                 Institution name:<span class="red12">*</span>
                                                                 
                                                                 
                                                            </td>
                                                            <td><html:text property="txtTrngInstName"  name="CaptureClaimTpDtl" style="width:150px;"/> </td>
                                                          </tr>
                                                          <tr>
                                                            <td>
                                                              <bean:message key="CCDtl.CourseStDt"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                              <span class="red12">*</span>
                                                            </td>
                                                            <td>
                                                                <html:text property="txtTrngCourseStDt" readonly="true" name="CaptureClaimTpDtl" style="width:110px;"/><img alt="calender" align="Center" src="images/cal.JPG"  onclick="return showCalendar('txtTrngCourseStDt','1','%d-%b-%Y',false,false);" class="cursorHand">
                                                            </td>
                                                            <td>
                                                              <bean:message key="CCDtl.EndDt"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                              <span class="red12">*</span>
                                                            </td>
                                                            <td>
                                                                <html:text property="txtTrngCourseEndDt" readonly="true" name="CaptureClaimTpDtl" style="width:100px;" /><img alt="calender" align="Center" src="images/cal.JPG"  onclick="return showCalendar('txtTrngCourseEndDt','1','%d-%b-%Y',false,false);" class="cursorHand">
                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td>
                                                              <bean:message key="CCDtl.NumOfHrs"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                              <span class="red12">*</span>
                                                            </td>
                                                            <td>
                                                                <html:text property="txtTrngNumOfHrs"  name="CaptureClaimTpDtl" style="width:110px;"/> 
                                                            </td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                          </tr>
                                                        </table>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td valign="top">&nbsp;</td>
                                              </tr>
                                            </table>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td valign="top" class="paddingtop10">
                                          <table width="100%" border="0" cellpadding="2" cellspacing="1" class="field_table"  >
                                          <tr>
                                           <td  valign="top" bgcolor="#2187b1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            <td  valign="top" bgcolor="#2187b1" class="white_normal">Session No</td>
                                            <td  valign="top" bgcolor="#2187b1" class="white_normal">Program</td>
                                            <td  valign="top" bgcolor="#2187b1" class="white_normal">Name</td>
                                            <td  valign="top" bgcolor="#2187b1" class="white_normal">Trainer Id</td>
                                            <td  valign="top" bgcolor="#2187b1" class="white_normal">Trainer Name</td>
                                            <td width="200" valign="top" bgcolor="#2187b1">
                                            <html:submit property="addpgm" disabled="true" style="width:85px;" onclick="vFindControl('1',this)"> Add Program </html:submit>
                                          <html:submit property="delpgm" disabled="true" style="width:100px;" onclick="vFindControl('1',this)" > Delete Program </html:submit></td>
                                         </tr>
                                         <tr>
                                         <td width="25px"> &nbsp;</td>
                                         <td >  <html:hidden property="pgmdpk"  name="CaptureClaimTpDtl" /><html:text property="sessionno" readonly="true"  name="CaptureClaimTpDtl" style="width:65px" /></td>
                                            <td>  <html:text property="program"
                                                             maxlength="60" name="CaptureClaimTpDtl" style="width:55px"    /></td>
                                            <td>  <html:text property="pgmname"  maxlength="100" name="CaptureClaimTpDtl"  style="width:100px" /></td>
                                            <td>  <html:text property="tranierid" maxlength="10"  name="CaptureClaimTpDtl" style="width:80px" /></td>
                                            <td>  <html:text property="trainername" maxlength="30"  name="CaptureClaimTpDtl" style="width:100px" /></td>
                                            <td colspan="2"> 
                                            </td>
                                         </tr>
                                        <tr>
                                        <td colspan="7" align="left" valign="top">
                                         <% int cntidx=0;
                                            int indx=0;
                                         %> 
                                            <display:table name="Pgmlist"
                                                           requestURI="#"
                                                           export="false"
                                                           id="row"
                                                           class="dataTable"
                                                           defaultsort="1"
                                                           defaultorder="ascending"
                                                           cellspacing="0" 
                                                           decorator="org.displaytag.decorator.TotalTableDecorator"  >
                                              <display:column title="" style="width:15px" >
                                              <input class="input_check" type="checkbox"  
                                                     onClick="updateStatus(this,'<%=cntidx %>')" <bean:write name="row" property="delpgm"/> id="chRowid" name="chRowid"/>
                                                 
                                              </display:column>   
                                             
                                              <display:column property="sessionno"
                                                              title="Sesson No" 
                                                              autolink="true"
                                                              href="CaptureClaimTpDtl.do?methodToCall=getSelPgmDetails"
                                                              paramId="sessionNo"
                                                              sortable="false"
                                                              style="width:80px"/>
                                              <display:column property="program"
                                                              title="Description"
                                                              sortable="false"
                                                              style="width:65px"
                                                              />
                                              <display:column property="pgmname"
                                                              title="Name"
                                                              sortable="false"
                                                              style="width:110px"/>
                                              <display:column property="tranierid"
                                                              title="Trainer Id"
                                                              sortable="false"
                                                               style="width:90px"/>
                                              <display:column property="trainername"
                                                              title="Trainer Name"
                                                              sortable="false"
                                                             />
                                               <% cntidx++; %>
                                                <display:setProperty name="basic.show.header" value="false" />  
                                            </display:table>
                                             <html:hidden property="delindexpgm"  name="CaptureClaimTpDtl" />
                                             </tr>
                                              </table>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td valign="top" class="paddingtop10">
                                            <table width="100%" border="0"
                                                   cellspacing="0"
                                                   cellpadding="0">
                                              <tr>
                                                <td valign="top">
                                                  <table border="0"
                                                         class="details_table"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td>
                                                        <bean:message key="CCDtl.TraineePart"/>
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
                                                          style="padding:5px;">
                                                        <table width="100%"
                                                               border="0"
                                                               cellspacing="0"
                                                               cellpadding="0">
                                                          <tr>
                                                            <td valign="top">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                          <tr>
                                                            <td valign="top">
                                                            <table width="100%" class="field_table"   border="0" cellpadding="2" cellspacing="1">
                                                                <tr>
                                                                  <td width="20" valign="top" bgcolor="#2187b1" class="white_normal">Sl No</td>
                                                                  <td  valign="top" bgcolor="#2187b1" class="white_normal">BOTA Learner No</td>
                                                                  <td  valign="top" bgcolor="#2187b1" class="white_normal">Omang ID/Passport No</td>
                                                                  <td width="25" valign="top" bgcolor="#2187b1" class="white_normal">PA</td>
                                                                  <td  valign="top" bgcolor="#2187b1" class="white_normal">Surname</td>
                                                                  <td  valign="top" bgcolor="#2187b1" class="white_normal">First Name</td>
                                                                  <td  valign="top" bgcolor="#2187b1" class="white_normal">Sex</td>
                                                                  <td  valign="top" bgcolor="#2187b1" class="white_normal">Telephone(s)</td>
                                                                  <td width="200" valign="top" bgcolor="#2187b1">
                                                                  <html:submit  property="addtrn" disabled="true" style="width:65px;" onclick="vFindControl('2',this)" > Add Trainee </html:submit>
                                                                  <html:submit  property="bdeltrn" disabled="true" style="width:95px;"  onclick="vFindControl('2',this)" > Del Trainee </html:submit></td>
                                                                </tr>
                                                                 <tr>
                                                                  <td  valign="top" ><html:hidden property="trndpk"  name="CaptureClaimTpDtl" style="width:25px" /></td>
                                                                 <td  valign="top" ><html:text property="botalearnerno"  name="CaptureClaimTpDtl" style="width:75px" /></td>
                                                                  <td  valign="top" ><html:text property="omangid"  name="CaptureClaimTpDtl" style="width:75px" onblur="getOmangDet(this);" /></td>
                                                                  <td  valign="top" ><html:checkbox property="pa"   name="CaptureClaimTpDtl"  /></td>
                                                                  <td  valign="top"><html:text property="surname"  name="CaptureClaimTpDtl" style="width:75px"/></td>
                                                                  <td  valign="top" ><html:text property="firstname"  name="CaptureClaimTpDtl" style="width:75px" /></td>
                                                                  <td  valign="top" ><html:text property="sex" maxlength="1" onblur="checkSex();"  name="CaptureClaimTpDtl" style="width:35px" /></td>
                                                                  <td  valign="top" ><html:text property="telephone"  name="CaptureClaimTpDtl" style="width:75px" onkeypress="return isNumeric();"/></td>
                                                                </tr>
                                                                <tr> <td colspan="8" >
                                                                  <% String flags[]=new String[1000];
                                                                
                                                                
                                                               java.util.ArrayList list=(java.util.ArrayList)request.getAttribute("TrnlistPA");
                                                               
                                                                                                                              
                                                               if(list!=null)
                                                               {
                                                                    VTFSLogger.logDebug("list not null");
                                                                   // flags=new String[list.size()] ;
                                                                   for(int i=0;i<list.size();i++){
                                                                    flags[i]=(String)list.get(i);
                                                                    
                                                                    }
                                                                
                                                               }
                                                               
                                                               int cnt=0;
                                                               
                                                               VTFSLogger.logDebug("flags[0]=="+flags[0]);
                                                                
                                                                %>
                                                                 <% int cntTrnidx=0;
                                                                   
                                                                   %> 
                                                            <display:table name="Trnlist"
                                                                                             requestURI="#"
                                                                                             export="false"
                                                                                             id="row"
                                                                                             class="dataTable"
                                                                                             defaultsort="1"
                                                                                             defaultorder="ascending"
                                                                                             cellspacing="0"
                                                                                             decorator="org.displaytag.decorator.TotalTableDecorator">
                                                                                <display:column title="" style="width:20px" >
                                                                                             <input class="input_check" type="checkbox"  
                                                                                                 onClick="updateStatusTrn(this,'<%=cntTrnidx %>')"  id="chRowid" name="chRowid"/>
                                                 
                                              </display:column>  
                                                                                <display:column property="rowNum"
                                                                                                title="Sl No"
                                                                                                autolink="true"
                                                                                                href="CaptureClaimTpDtl.do?methodToCall=getSelTrnDetails"
                                                                                                paramId="SNo"
                                                                                                sortable="false"
                                                                                                style="width:10px"/>
                                                                                  <display:column property="botalearnerno"
                                                                                                title="BOTA Learner No"
                                                                                                sortable="false"
                                                                                                style="width:95px"/>                
                                                                                <display:column property="omangid"
                                                                                                title="Omang ID/Passport No"
                                                                                                sortable="false"
                                                                                                style="width:95px"/>
                                                                                <display:column title="PA"
                                                                                                sortable="false" style="width:15px">
                                                                                                
                                                                                                <input type="checkbox" name="pa" disabled="true" id="pa"  <%=flags[cnt] %> /></display:column>
                                                                                                <%cnt++; %>
                                                                                <display:column property="surname"  
                                                                                                title="Surname"
                                                                                                sortable="false"
                                                                                                style="width:95px"/>
                                                                                <display:column property="firstname"
                                                                                                title="First Name"
                                                                                                sortable="false"
                                                                                                style="width:95px"/>
                                                                                <display:column property="sex"
                                                                                                title="Sex"
                                                                                                
                                                                                                sortable="false"
                                                                                                style="width:15px"/>
                                                                                <display:column property="telephone"
                                                                                                title="Telephone(s)"
                                                                                                sortable="false" />
                                                                                                <% cntTrnidx++; %>
                                                                                <display:setProperty name="basic.show.header" value="false" />                                                                                                   
                                                                              </display:table>
                                                                               <html:hidden property="delindextrn"  name="CaptureClaimTpDtl" />
                                                                
                                                                </td></tr>
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
                                         <tr>
                                    <td valign="top" class="paddingtop10">
                                    <table class="field_table" width="100%"
                                           border="0" cellspacing="0"
                                           cellpadding="3">                              
                                      <tr>
                                        <td class="mandatory"><bean:message key="prompt.Comman.Mandatory" /></td>
                                     <td>
                                          <div align="right">
                                         <input type="hidden"  name="curTabNew" value="<%=curTabIndex %>">
                                         <input type="hidden"  name="loadclear" value="<%=loadclear %>">
                                         
                                         <html:hidden property="txtinstdpk" name="CaptureClaimTpDtl" />
                                         <html:hidden property="curtab" name="CaptureClaimTpDtl" />
                                         <html:hidden property="comcat" name="CaptureClaimTpDtl" value="<%=comcat %>" />
                                
                                         <html:hidden property="txtClaimRefNum"  name="CaptureClaimTpDtl" />
                                          <input type="hidden"  name="clmrefno" id="clmrefno" >                                      
                                        <html:hidden property="htxtPage"  name="CaptureClaimTpDtl" /> 
                                         <html:hidden property="captureoperation"  name="CaptureClaimTpDtl"  value="add"/>
                                         <html:hidden property="htxtoperMode"  name="CaptureClaimTpDtl" /> 
                                         <html:hidden property="htxtMode"  name="CaptureClaimTpDtl" />                                        
                                         <html:submit  property="trnsearch" disabled="false"  onclick="vFindControl('0',this);" > Search </html:submit>
                                         <html:submit  property="trnsave" disabled="false"  onclick="vFindControl('0',this); return validate();" > Save </html:submit>
                                         <html:submit  property="trndelete" disabled="false"  onclick="vFindControl('0',this); return validateDelete();" > Delete </html:submit>
                                         <html:submit  property="trnclear" disabled="false"  onclick="vFindControl('0',this)"  > Clear </html:submit>
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
                                    
                                    </html:form>
                                    </div>
                                    <div id="second" style="display:none;">
                                    <html:form action="/CaptureClaimCostDtl.do?methodToCall=getCost" method="post">
                                    <html:javascript formName="CaptureClaimCostDtl"/>
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
                                                        <a href="javascript:first_enable();assiontab('1','fir');"
                                                           id="fir"><bean:message key="CCDtl.TrainPart" /> </a>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                  <table border="0"
                                                         class="selected_table"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td><bean:message key="CCDtl.CostDetails" /></td>
                                                    </tr>
                                                  </table>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                  <table border="0"
                                                         class="details_table"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td>
                                                        <a href="javascript:third_enable();assiontab('3','thr');"
                                                           id="thir"><bean:message key="CCDtl.Documents" /></a>
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
                                                                  <td>
                                                                  </td>
                                                                  <td></td>
                                                                  <td>
                                  <input type="radio" id="rd1" name="rd1" value="I" onclick="radiochange(this);"/><bean:message key="CCDtl.InhouTran" /> 
                                  
                                  <input type="radio" id="rd2" name="rd2"  value="O" onclick="radiochange(this);"/><bean:message key="CCDtl.InstTra" />
                                                                                      </td>
                                                                  <td></td>
                                                                </tr>
                                                              </table>
                                                            </td>
                                                          </tr>
                                                           <tr>
                                                            <td valign="top"  >
                                                             <table class="field_table"
                                                                     width="100%"
                                                                     border="0"
                                                                     cellpadding="3"
                                                                     cellspacing="2"
                                                                     id="tblInhouse" 
                                                                     style="display:block;">
                                                                <tr>
                                                                  <td width="30%"
                                                                      valign="top">
                                                                    <bean:message key="CCDtl.TuitCost/partic" /><bean:message key="prompt.Common.LabelSuffix" />
                                                                 
                                                                  </td>
                                                                  <td width="70%"
                                                                      valign="top">
                                                                      <html:text property="txtTrngCostAndPart" readonly="false" onblur="addCost(this);" onkeypress="return isNumeric();" name="CaptureClaimCostDtl" /> 
                                                                  </td>
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top">
                                                                    <bean:message key="CCDtl.TotTuitionCost" /><bean:message key="prompt.Common.LabelSuffix" />
                                                                    <span class="red12">*</span>
                                                                  </td>
                                                                  <td valign="top">
                                                                    <html:text property="txtTrngTotTuitionCost"  readonly="true"  onkeypress="return isNumeric();"  name="CaptureClaimCostDtl" /> 
                                                                  </td>
                                                                </tr>
                                                              </table>
                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td valign="top" >
                                                              <table width="100%"
                                                                     border="0"
                                                                     cellpadding="2"
                                                                     cellspacing="1"
                                                                     bgcolor="#63a4bb"
                                                                     id="tblInsi" 
                                                                     style="display:none;">
                                                                <tr>
                                                                  <td width="30%"
                                                                      valign="top"
                                                                      bgcolor="#1e83ac" style="color:#ffffff;"><bean:message key="CCDtl.CostBreakDown" /> </td>
                                                                  <td width="70%"
                                                                      valign="top"
                                                                      bgcolor="#1e83ac" style="color:#ffffff;"><bean:message key="CCDtl.Amount" /> </td>
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe"><bean:message key="CCDtl.TrainerFees" /><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe">
                                                                    <html:text property="txtCostTrainerFees" readonly="false"  onchange="addCost(this);" onkeypress="return isNumeric();"  name="CaptureClaimCostDtl" />
                                                                  </td>
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#b2e0ef"><bean:message key="CCDtl.Trn/LrnMatrl" /><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                                  <td valign="top"
                                                                      bgcolor="#b2e0ef"><html:text property="txtCostTrnAndLrnMatrl"  onchange="addCost(this);" onkeypress="return isNumeric();"  name="CaptureClaimCostDtl" />     </td>
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe"><bean:message key="CCDtl.Advertisement" /></td>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe"><html:text property="txtCostAdvertis"  onchange="addCost(this);" onkeypress="return isNumeric();"  name="CaptureClaimCostDtl" /> </td>
                                                                </tr>
                                                                 <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe"><bean:message key="CCDtl.MealAndRef" /><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe"><html:text property="txtCostMealAndRef"  onchange="addCost(this);" onkeypress="return isNumeric();"  name="CaptureClaimCostDtl" /> </td>
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#b2e0ef"><bean:message key="CCDtl.Stationery" /><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                                  <td valign="top"
                                                                      bgcolor="#b2e0ef"><html:text property="txtCostStationery"  onchange="addCost(this);" onkeypress="return isNumeric();"  name="CaptureClaimCostDtl" /> </td>
                                                                </tr>
                                                               
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#b2e0ef"><bean:message key="CCDtl.AdminExp" /><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                                  <td valign="top"
                                                                      bgcolor="#b2e0ef"><html:text property="txtCostAdminExp"  onchange="addCost(this);" onkeypress="return isNumeric();"  name="CaptureClaimCostDtl" /> </td>
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe"><bean:message key="CCDtl.Others" /><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe"><html:text property="txtCostOthers"  onchange="addCost(this);" onkeypress="return isNumeric();"  name="CaptureClaimCostDtl" /> </td>
                                                                </tr>
                                                                
                                                                 <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe"><bean:message key="CCDtl.Others1" /><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe"><html:text property="txtCostOthers1"  onchange="addCost(this);" onkeypress="return isNumeric();"  name="CaptureClaimCostDtl" /> </td>
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#b2e0ef"><bean:message key="CCDtl.CostPerPartc2" /><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                                  <td valign="top"
                                                                      bgcolor="#b2e0ef"><html:text property="txtCostPerPartc" onchange="(this);" onkeypress="return isNumeric();" name="CaptureClaimCostDtl" /> </td>
                                                                </tr>
                                                                <tr>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe"><bean:message key="CCDtl.TotCost" /><bean:message key="prompt.Common.LabelSuffix"/></td>
                                                                  <td valign="top"
                                                                      bgcolor="#e5f8fe">
                                                                      <html:text property="txtCostTotCost" readonly="true" onkeypress="return isNumeric();"  name="CaptureClaimCostDtl" 
                                                                       style="background-color:#c0c0c0;border:1px solid #8f8e8e; "
                                                                      /> 
                                                                  </td>
                                                                </tr>
                                                              </table>
                                                            </td>
                                                          </tr>
                                                          <tr>
                                    <td valign="top" class="padding5px">
                                    <table class="field_table" width="100%"
                                           border="0" cellspacing="0"
                                           cellpadding="3">
                                      <tr>
                                        <td class="mandatory"><bean:message key="prompt.Comman.Mandatory" /></td>
                                        <td>
                                          <div align="right">
                                           <html:hidden property="curtab" name="CaptureClaimCostDtl" />
                                          
                                           <html:hidden property="clmrefno"  name="CaptureClaimCostDtl" />
                                           <html:hidden property="htxtCostPage"  name="CaptureClaimCostDtl"  /> 
                                           <html:hidden property="costtype"  name="CaptureClaimCostDtl" /> 
                                             <html:hidden property="captureCostoperation"  name="CaptureClaimCostDtl" /> 
                                           <html:hidden property="htxtCostMode"  name="CaptureClaimCostDtl" /> 
                                            <html:submit property="btnSearch" value="Search" onclick="vFindControlCost(this);" >Search</html:submit>
                                           <html:submit property="cstsave" disabled="true" value="Save" onclick="vFindControlCost(this);return validateCost(CaptureClaimCostDtl);" />
                                            <html:submit property="cstdelete" disabled="true" value="Delete" onclick="vFindControlCost(this);"/>
                                            <html:submit property="btnClear" value="Clear" onclick="vFindControlCost(this);" />
                                           </div>
                                        </td>
                                      </tr>
                                    </table>
                                  </td></tr>
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
                                    <div id="third" style="display:none;">
                                     <html:form action="/CaptureClaimDocDtl.do?methodToCall=getDocuments" method="post">
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
                                                        <a href="javascript:first_enable();assiontab('1','fir');"
                                                           id="first"><bean:message key="CCDtl.TrainPart" /></a>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                  <table border="0"
                                                         class="details_table"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td>
                                                        <a href="javascript:sec_enable();assiontab('2','sec');"
                                                           id="sec"><bean:message key="CCDtl.CostDetails" /> </a>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                  <table border="0"
                                                         class="selected_table"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td><bean:message key="CCDtl.Documents" /></td>
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
                                                <td valign="top">
                                                  <table width="100%" border="0"
                                                         cellspacing="0"
                                                         cellpadding="0">
                                                    <tr>
                                                      <td class="padding5px">
                                                        <table width="100%"
                                                               border="0"
                                                               cellpadding="2"
                                                               cellspacing="1"
                                                               bgcolor="#2a90ba">
                                                          <tr>
                                                            <td valign="top"
                                                                bgcolor="#2187b1" style="color:#ffffff;">Document
                                                                                  Name</td>
                                                            <td width="175"
                                                                valign="top"
                                                                bgcolor="#2187b1" style="color:#ffffff;">Code</td>
                                                            <td valign="top"
                                                                bgcolor="#2187b1" style="color:#ffffff;">Submitted Date</td>
                                                            <td bgcolor="#2187b1" align="right">
                                                             <html:submit  property="adddoc" disabled="true"  onclick="vFindControlDoc('1',this); return validateDoc();" > Add Document </html:submit>
                                                             <html:submit  property="bdeldoc" disabled="true"  onclick="vFindControlDoc('1',this)" > Delete </html:submit>
                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td valign="top"
                                                                bgcolor="#e5f8fe">
                                                              <html:hidden property="txtdocdpk"  name="CaptureClaimDocDtl"  />   
                                                              <html:select property="cboDocDesc"
                                                                         name="CaptureClaimDocDtl" onchange="fillDocCode(this);">
                                                              <html:option value="">---Select---</html:option>
                                                                <html:options name="DocDesclist" labelName="DocDesclist"/>
                                                            </html:select>
                                                            </td>
                                                            <td valign="top"
                                                                bgcolor="#e5f8fe">
                                                                <html:text property="txtDocCode" readonly="true"  name="CaptureClaimDocDtl"
                                                                style="background-color:#c0c0c0;border:1px solid #8f8e8e; " /> 
                                                                
                                                                <html:hidden property="txtDocPk"   name="CaptureClaimDocDtl"
                                                                style="background-color:#c0c0c0;border:1px solid #8f8e8e; " /> 
                                                                </td>
                                                            <td valign="top"
                                                                bgcolor="#e5f8fe" colspan="2">
                                                             <html:text property="txtSubDate" readonly="true" name="CaptureClaimDocDtl" /><img alt="calender" align="Center" src="images/cal.JPG"  onclick="return showCalendar('txtSubDate','3','%d-%b-%Y',false,false);" class="cursorHand">    
                                                                </td>
                                                          </tr>
                                                       <tr>
                                                       <td bgcolor="#FFFFFF" colspan="4">
                                                       <% int cntdocidx=0;
                                                                   
                                                                   %> 
                                                        <display:table name="Doclist"
                                                                                             requestURI="#"
                                                                                             export="false"
                                                                                             id="row"
                                                                                             class="dataTable"
                                                                                             defaultsort="1"
                                                                                             defaultorder="ascending"
                                                                                             cellspacing="0" 
                                                                                             decorator="org.displaytag.decorator.TotalTableDecorator">
                                                                                <display:column title="">
                                                                                        <input class="input_check" type="checkbox"  
                                                                                                onClick="updateStatusDoc(this,'<%=cntdocidx %>')"  id="chdocid" name="chdocid"/>
                                                 
                                                                                </display:column>              
                                                                                <display:column property="cboDocDesc"
                                                                                                title="Document Name"
                                                                                                autolink="true"
                                                                                                href="CaptureClaimDocDtl.do?methodToCall=getSelDocDetails"
                                                                                                paramId="DocName"
                                                                                                sortable="false"/>
                                                                                <display:column property="txtDocCode"
                                                                                                title="Code"
                                                                                                sortable="false"/>
                                                                                <display:column property="txtSubDate"
                                                                                                title="Submitted On"
                                                                                                sortable="false"/>
                                                                                                 <% cntdocidx++; %>
                                                                              </display:table>
                                                                              <html:hidden property="delindexdoc"  name="CaptureClaimDocDtl" />
                                                       </td>
                                                       </tr>
                                                        </table>
                                                      </td>
                                                    </tr>
                                                    <tr>
                                    <td valign="top" class="padding5px">
                                    <table class="field_table" width="100%"
                                           border="0" cellspacing="0"
                                           cellpadding="3">
                                      <tr>
                                        <td class="mandatory"><bean:message key="prompt.Comman.Mandatory" /></td>
                                        <td>
                                          <div align="right">
                                          
                                           <html:hidden name="CaptureClaimDocDtl"
                                           property="lstdpk"  value='<%=request.getAttribute("DocCodeDpk")%>' />
                                          <html:hidden name="CaptureClaimDocDtl"
                                           property="lstDesc"  value='<%=request.getAttribute("DocCodelist")%>' />
                                          <html:hidden property="curtab" name="CaptureClaimDocDtl"  />
                                           <html:hidden property="clmrefno"  name="CaptureClaimDocDtl" />
                                            <html:hidden property="htxtDocPage"  name="CaptureClaimDocDtl" /> 
                                             <html:hidden property="captureDocoperation"  name="CaptureClaimDocDtl" /> 
                                            <html:hidden property="htxtDocMode"  name="CaptureClaimDocDtl" /> 
                                            <html:submit property="btnSearch" value="Search" onclick="vFindControlDoc('0',this)" />
                                           
                                            <html:submit property="btnClear" value="Clear" onclick="vFindControlDoc('0',this)"/>
                                           </div>
                                        </td>
                                      </tr>
                                    </table>
                                  </td></tr>
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