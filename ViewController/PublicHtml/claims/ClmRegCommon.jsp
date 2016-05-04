<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" import="java.util.*,com.vtfs.util.VTFSLogger" %>
<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Register Claim Application</title>
    <link type="text/css" rel="stylesheet" href="styles/boto.css"/>
    
     <link href="styles/menu_home.css" type="text/css" rel="stylesheet"></link>
      <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
      <link rel="stylesheet" type="text/css" media="all" href="js/skins/aqua/theme.css" title="Aqua" />
     <script language="javascript" type="text/javascript" src="js/menu_home.js"></script>
     <script language="javascript" type="text/javascript" src="js/RegisterCategory.js"></script>
      <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
   
     
<script type="text/javascript" language="javascript"> 
function getclmPopDetails(){   
     var vcomcat="<%= request.getAttribute("comcat") %>";
    var URL="claims/ClaimRefNoPopUp.jsp?vcom="+vcomcat;
    
     window.open(URL,'classclmPop','width=600,height=400');
}
</script>    
 <script type="text/javascript" language="javascript"> 
function getclmdetails()
{
// document.forms[0].getVtfdet.value="Getdetails";
//alert("getclmdetails is called");
document.forms[0].submit();

}

function checkClearData(){
var vsubmit="<%= (String)request.getSession().getAttribute("preStatus") %>";

//alert(vsubmit);
        if ((vsubmit==null) || (vsubmit=="")){
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
            document.forms[0].title.focus();
            document.forms[1].txtClaimRefNum.value="";
            document.forms[1].clmrefno.value="";
            
        }
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
    //checkClearData();
 }   
    
  function showModalWindow(){ 
        var ClaimNo;
        var ClaimTitle;
        var VTFNo;
        var VTFCompName;
        
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
        var vcomcat="<%= request.getSession().getAttribute("comcat") %>";
       // alert("vcomcat=="+vcomcat);
        modalWin=showClaimPopUpNew(350,320,ClaimNo,ClaimTitle,VTFNo,VTFCompName,Status,StatusDate,ClaimDate,FinYear,VatRegNo,PoBox,CompReg,City,Classifi,Country,vcomcat);
      //  if(document.forms[0].vtfRegNum.value!="")
      //      getclmdetails();
        
    
  }  

    

</script>
  </head>
  <%
        String comcat=(String)request.getSession().getAttribute("comcat");
        
        if(comcat==null){
        VTFSLogger.logDebug("comcat====null");
       // comcat="1";
        }
        VTFSLogger.logDebug("comcat===="+comcat);
  
  %>
  <body  onfocus="checkFocus();" >
   <html:form action="/clmregcomon.do?methodToCall=getClmDetCommon" method="post" >
  <table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>
    <table border="0" class="field_table" cellspacing="0" cellpadding="0">
     <tr>
        <td valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
           <td valign="top" width="750">
            <table class="" width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top" class="padding5px">
                    <table width="100%" align="left" border="0" cellspacing="0" cellpadding="3">   
                                      
                                      <tr>
                                      <td width="135"><bean:message key="claimrefno"/></td>
                                      <td width="170"><html:text property="claimrefno"  onblur="getclmdetails();"  name="ClmRegCommon"/><a href="#"  onClick="showModalWindow();" ><img src="images/list_img.jpg" border="0" /></a></td>
                                      <td width="125"><bean:message key="title"/></td>
                                      <td ><html:text property="title" 
                                                                       name="ClmRegCommon"
                                                                       style="background-color:#c0c0c0;border:1px solid #8f8e8e; "
                                                                       readonly="true"/></td>
                                      </tr>
                                      
                                      
                                       <tr>
                                      <td><bean:message key="status"/></td>
                                      <td><html:text property="status" name="ClmRegCommon"
                                                     readonly="true"
                                                      style="background-color:#c0c0c0;border:1px solid #8f8e8e; "
                                                     /></td>
                                      <td><bean:message key="statusdate"/></td>
                                      <td><html:text property="statusdate" name="ClmRegCommon"
                                                      readonly="true"
                                                       style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/></td>
                                      </tr>
                                      
                                       <tr>
                                      <td><bean:message key="vtfregno"/></td>
                                      <td >
                                      
                                       <table border="0" cellspacing="0" cellpadding="0">  
                                       <tr>
                                       <td><html:text property="vtfRegNum" name="ClmRegCommon" 
                                                     readonly="true"  style="background-color:#c0c0c0;border:1px solid #8f8e8e;  "/></td>
                                       
                                       </tr>
                                       </table>
                                       <td colspan="2"><html:text property="vtfCompName" name="ClmRegCommon"
                                                                 size="30"
                                                                 readonly="true"
                                                                  style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:270px; "/></td>
                                      </td>
                                     
                                      </tr>
                                      
                                       <tr>
                                      <td><bean:message key="claimdate"/></td>
                                      <td><html:text property="claimdate" name="ClmRegCommon" readonly="true" 
                                                     style="background-color:#c0c0c0;border:1px solid #8f8e8e; " /></td>
                                      <td><bean:message key="financial"/></td>
                                      <td><html:text property="finyear"
                                                                     name="ClmRegCommon"
                                                                     readonly="true"
                                                                      style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/></td>
                                      </tr>
                                      
                                       <tr>
                                      <td></td>
                                      <td></td>
                                      <td><strong>Postal Address</strong></td>
                                      <td></td>
                                      </tr>
                                      
                                       <tr>
                                      <td><bean:message key="vatregno"/></td>
                                      <td><html:text property="vatregno" name="ClmRegCommon"
                                                     readonly="true"
                                                      style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/></td>
                                      <td><bean:message key="PoBoxNo"/></td>
                                      <td><html:text property="poboxno"
                                                                       name="ClmRegCommon"
                                                                       readonly="true"
                                                                        style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/></td>
                                      </tr>
                                      
                                      <tr>
                                      <td><bean:message key="companyregno"/></td>
                                      <td><html:text property="companyregno" name="ClmRegCommon"
                                                     readonly="true"
                                                      style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/></td>
                                      <td><bean:message key="city"/></td>
                                      <td><html:text property="city"
                                                                       name="ClmRegCommon"
                                                                       readonly="true"
                                                                        style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/></td>
                                      </tr>
                                      
                                      <tr>
                                      <td><bean:message key="classification"/></td>
                                      <td><html:text property="classification" name="ClmRegCommon"
                                                     readonly="true"
                                                      style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/></td>
                                      <td><bean:message key="country"/></td>
                                      <td><html:text property="country"
                                                                       name="ClmRegCommon"
                                                                       readonly="true"
                                                                        style="background-color:#c0c0c0;border:1px solid #8f8e8e; "/></td>
                                      </tr>
                                      
                                    <tr>
                                     <td colspan="4">
                                     <html:hidden property="getVtfdet" name="ClmRegCommon" />
                                     <html:hidden name="ClmRegCommon" property="comcat" value="<%=comcat %>"/>
                                    
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
  </body>
</html>