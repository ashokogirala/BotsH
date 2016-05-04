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
   <title> <bean:message key="prompt.Common.ApplicationTitle"/></title>
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
    var sub=0;
     function onClaimLoad()
     {
     
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
      
      
  if(document.forms[1].txtTrngCourseStDt.value!="")
  {
  document.forms[1].trnprocess.disabled=false;
  }
  
  
    checkClearData();
     if (!(document.forms[0].title.value==""))
     {
       document.forms[1].txtClaimRefNum.value=document.forms[0].claimrefno.value;
    }else{
    document.forms[1].trnprocess.disabled=true;
    }
    
         var res =document.forms[1].txtresult.value;
        //alert(res);
        
         if(res!="")
        {
        alert(res);
        res="";
         document.forms[1].txtresult.value=res;
        
        //alert(document.forms[1].txtresult.value);
        document.forms["ClmRegCommon"].status.value=document.forms[1].txtProcesssta.value;
        document.forms[1].txtProcesssta.value="";
        }
 
}

function getHTTPReq(){

    var xmlHttp;
        try
        {
            // Firefox, Opera 8.0+, Safari
            xmlHttp=new XMLHttpRequest();
        }catch (e) {
            // Internet Explorer
            try
            {
            xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
            }catch (e){
                try
                {
                xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                }catch (e){
                alert("Your browser does not support AJAX!");
                return false;
                }
            }
        }
        
        return xmlHttp;

}

    function checkOmangID()
    {
        
        
        var xmlHttp= getHTTPReq();       
       
        
        xmlHttp.onreadystatechange=function()
        {
            if(xmlHttp.readyState==4)
            {
            var omangCheck=xmlHttp.responseText;
            if(omangCheck.indexOf("FAIL")>0){
                if(confirm("Omang ID could not be found in the system. Do you want to continue?")){
                      document.forms[1].omangIDCheck .value="checked"; 
                      document.forms[1].captureoperation.value="Process";
                      document.forms[1].submit();
                }
            }else{
             document.forms[1].captureoperation.value="Process";
             document.forms[1].submit();
            
            }
          
            }
           
            
        }
        
        xmlHttp.open("GET","claims/validateOmangID.jsp",true);
        xmlHttp.send(null);
    }
    
     function checkLearnerID()
    {
        
        
        var xmlHttp= getHTTPReq();       
       
        
        xmlHttp.onreadystatechange=function()
        {
            if(xmlHttp.readyState==4)
            {
            var learnerIDCheck=xmlHttp.responseText;
            if(learnerIDCheck.indexOf("FAIL")>0){
                if(confirm("Learner ID could not be found in the system. Do you want to continue?")){
                     /*
                      document.forms[1].omangIDCheck .value="checked"; 
                      document.forms[1].captureoperation.value="Process";
                      document.forms[1].submit(); */
                      checkOmangID();
                      
                }
            }else{
                 checkOmangID();
            }
          
            }
           
            
        }
        
        xmlHttp.open("GET","claims/validateLearnerID.jsp",true);
        xmlHttp.send(null);
    }
    
     function checkProgramID()
    {
        
        
        var xmlHttp= getHTTPReq();       
       
        
        xmlHttp.onreadystatechange=function()
        {
            if(xmlHttp.readyState==4)
            {
            var pgmIDCheck=xmlHttp.responseText;
            if(pgmIDCheck.indexOf("FAIL")>0){
                if(confirm("Program ID could not be found in the system. Do you want to continue?")){
                     
                     /* document.forms[1].omangIDCheck .value="checked"; 
                      document.forms[1].captureoperation.value="Process";
                      document.forms[1].submit();
                      */
                      
                      checkLearnerID();
                      
                }
            }else{
                checkLearnerID();
            }
          
            }
           
            
        }
        
        xmlHttp.open("GET","claims/validateProgramID.jsp",true);
        xmlHttp.send(null);
    }
    
function getRowID(){
}

function vFindControl(elementRefa)
{
var curbut;
var str_cntlVal;
curbut= elementRefa.value;
document.forms[1].captureoperation.value=curbut;
 document.forms[1].submit();
}

</script>
 
  </head>
  <body onload="onClaimLoad();">
 
                      <table width="100%" border="0" cellspacing="0"
                             cellpadding="1">
                        <tr>
                          <td valign="top" class="head_bgcolor">
                            <bean:message key="CCDtl.Confirmtitle"/>
                          </td>
                        </tr>
                        <tr>
                          <td valign="top">
                            <table width="100%"
                                   border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td valign="top" class="padding5px">
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
                                <td valign="top" class="padding5px">
                                  <div id="first" style="display:block;">
                                         
                                    <html:form action="/ConfirmEligibility.do?methodToCall=getConfirm"
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
                                                        <bean:message key="CCDtl.TrainPart"/>
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
                                                            <td width="25%">
                                                              <bean:message key="CCDtl.TrainingHeld"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                            </td>
                                                            <td width="25%">
                                                              <html:select property="cboTrngHeldLocn"
                                                                           name="ConfirmEligibility" disabled="true" style="width:250px;">
                                                                <html:option value="I"
                                                                             key="I">Botswana</html:option>
                                                                <html:option value="O"
                                                                             key="O">Outside
                                                                                     Botswana</html:option>
                                                              </html:select>
                                                            </td>
                                                            <td width="15%">&nbsp;</td>
                                                            <td width="15%">&nbsp;</td>
                                                          </tr>
                                                          <tr>
                                                            <td>
                                                              <bean:message key="CCDtl.InstAccUnder"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                            </td>
                                                            <td>
                                                              <html:select property="cboInstAccUnder"
                                                                           name="ConfirmEligibility" disabled="true" style="width:250px;">
                                                                 <html:option value="Vocational Training - BOTA" key="Vocational Training - BOTA"  />
                                                                    <html:option value="Tertiary education council" key="Tertiary education council"  />
                                                                    <html:option value="Others" key="Others"  />
                                                              </html:select>
                                                            </td>
                                                            <td align="right">
                                                              <bean:message key="CCDtl.PriorAppr"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                            </td>
                                                            <td>
                                                              <html:checkbox property="chkPriorAppr"
                                                                             name="ConfirmEligibility" disabled="true"/>
                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td>
                                                              <bean:message key="CCDtl.InstAccNo"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                             
                                                            </td>
                                                            <td colspan="2">
                                                              <html:text property="txtInstAccNo"
                                                                         name="ConfirmEligibility"
                                                                         readonly="true"
                                                                         style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:100px; "/>
                                                              <html:text property="txtTrngInstName"
                                                                         name="ConfirmEligibility"
                                                                         readonly="true"
                                                                         style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:138px; "/>
                                                            </td>
                                                            <td>&nbsp;</td>
                                                          </tr>
                                                          <tr>
                                                            <td>
                                                              <bean:message key="CCDtl.CourseStDt"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                              
                                                            </td>
                                                            <td>
                                                              <html:text property="txtTrngCourseStDt"
                                                                         name="ConfirmEligibility"
                                                                         readonly="true"
                                                                         style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:100px; "/>
                                                              
                                                            </td>
                                                            <td align="right">
                                                              <bean:message key="CCDtl.EndDt"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                             
                                                            </td>
                                                            <td>
                                                              <html:text property="txtTrngCourseEndDt"
                                                                         name="ConfirmEligibility"
                                                                         readonly="true"
                                                                         style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:100px; "/>
                                                              
                                                            </td>
                                                          </tr>
                                                          <tr>
                                                            <td>
                                                              <bean:message key="CCDtl.NumOfHrs"/>
                                                              <bean:message key="prompt.Common.LabelSuffix"/>
                                                              
                                                            </td>
                                                            <td>
                                                              <html:text property="txtTrngNumOfHrs"
                                                                         name="ConfirmEligibility"
                                                                         readonly="true"
                                                                         style="background-color:#c0c0c0;border:1px solid #8f8e8e; width:100px; "/>
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
                                           <display:table name="Pgmlist"
                                                           requestURI="#"
                                                           export="false"
                                                           id="row"
                                                           class="dataTable"
                                                           defaultsort="1"
                                                           defaultorder="ascending"
                                                           cellspacing="0"
                                                           decorator="org.displaytag.decorator.TotalTableDecorator">
                                              <display:column property="sessionno"
                                                              title="Sesson No"
                                                              sortable="true"/>
                                              <display:column property="program"
                                                              title="Description"
                                                              sortable="true"/>
                                              <display:column property="pgmname"
                                                              title="Name"
                                                              sortable="true"/>
                                              <display:column property="tranierid"
                                                              title="Trainer Id"
                                                              sortable="true"/>
                                              <display:column property="trainername"
                                                              title="Trainer Name"
                                                              sortable="true"/>
                                            </display:table>
                                      
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
                                                              <table width="100%"
                                                                     border="0"
                                                                     cellspacing="0"
                                                                     cellpadding="0">
                                                                <tr>
                                                                  <td valign="top">
                                                                   <display:table name="Trnlist"
                                                                                   requestURI="#"
                                                                                   export="false"
                                                                                   id="row"
                                                                                   class="dataTable"
                                                                                   defaultsort="1"
                                                                                   defaultorder="ascending"
                                                                                   cellspacing="0"
                                                                                   decorator="org.displaytag.decorator.TotalTableDecorator">
                                                                      <display:column property="rowNum"
                                                                                      title="Sl No"
                                                                                      sortable="true"/>
                                                                      <display:column property="botalearnerno"
                                                                                                title="BOTA Learner No"
                                                                                                sortable="false"
                                                                                                style="width:95px"/> 
                                                                      <display:column property="omangid"
                                                                                      title="Omang ID/Passport No"
                                                                                      sortable="true"/>
                                                                      <display:column title="PA"
                                                                                      sortable="true">
                                                                        <input type="checkbox"
                                                                               name="pa"
                                                                               id="pa" disabled="true" ></input>
                                                                      </display:column>
                                                             
                                                                      <display:column property="surname"
                                                                                      title="Surname"
                                                                                      sortable="true"/>
                                                                      <display:column property="firstname"
                                                                                      title="First Name"
                                                                                      sortable="true"/>
                                                                      <display:column property="sex"
                                                                                      title="Sex"
                                                                                      sortable="true"/>
                                                                      <display:column property="telephone"
                                                                                      title="Telephone(s)"
                                                                                      sortable="true"/>
                                                                    </display:table>
                                                                 
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
                                                <td valign="top"
                                                    class="paddingtop10">
                                                  <table class="field_table"
                                                         width="100%" border="0"
                                                         cellspacing="0"
                                                         cellpadding="3">
                                                    <tr>
                                                      <td class="mandatory">
                                                        <bean:message key="prompt.Comman.Mandatory"/>
                                                      </td>
                                                      <td>
                                                        <div align="right">
                                                          <input type="hidden"
                                                                 name="curTabNew"></input>
                                                                 
                                                      <input type="hidden" name="omangIDCheck" value="unchecked"></input>
                                                           
                                                          <html:hidden property="curtab"
                                                                     name="ConfirmEligibility"/>
                                                           
                                                          <html:hidden property="comcat"
                                                                       name="ConfirmEligibility"/>
                                                           
                                                          <html:hidden property="txtClaimRefNum"
                                                                       name="ConfirmEligibility"/>
                                                          <input type="hidden"  name="clmrefno" id="clmrefno" >
                                                          <html:hidden property="htxtPage"
                                                                         name="ConfirmEligibility"/>
                                                           
                                                          <html:hidden property="captureoperation"
                                                                     name="ConfirmEligibility"
                                                                     value="add"/>
                                                          <html:hidden property="htxtMode"
                                                                          name="ConfirmEligibility"/>
                                                          <html:hidden property="txtresult"
                                                                          name="ConfirmEligibility"/> 
                                                            <html:hidden property="txtProcesssta"
                                                                          name="ConfirmEligibility"/>                 
                                                          <html:button property="trnsearch"
                                                                       disabled="false"
                                                                       onclick="vFindControl(this);">Search</html:button>
                                                          <html:button property="trnprocess"
                                                                       disabled="true"
                                                                       onclick="checkProgramID();">Process</html:button>
                                                            
                                                          <html:button property="trnclear"
                                                                       disabled="false"
                                                                       onclick="vFindControl(this)">Clear </html:button>
                                                           
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
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                   
    </body>
</html>