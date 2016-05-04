<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<html>
  <%
        java.util.Calendar currentDate =  java.util.Calendar.getInstance();
        java.text.SimpleDateFormat formatter= 
        new java.text.SimpleDateFormat("dd-MMM-yy@HH:mm");
        String dateNow=formatter.format(currentDate.getTime());   
      
        String fromdate=(String)request.getSession().getAttribute("Fdate");
       
        String todate=(String)request.getSession().getAttribute("Tdate");
        String username=(String)request.getSession().getAttribute("CUserID");
        if(fromdate==null) fromdate="";
       
        if(todate==null) todate="";
        if(dateNow==null) dateNow="";
        if(username==null) username="";
        ArrayList learnRpt=(ArrayList)request.getAttribute("learnerslist");
        request.getSession().setAttribute("learnerslist",learnRpt);
        int learnerslist;
        //Learners
        if(learnRpt==null){
        learnerslist=0;
        }else{
        learnerslist=learnRpt.size();
        }
       
       String checkRecord=(String)request.getAttribute("checkRecordForGivenDate");
         
         if(checkRecord==null)checkRecord="";
        
        %>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>List Of Part paid Claims Report</title>
    <link href="css/displaytagex.css" rel="stylesheet" type="text/css"/>
    <link href="css/boto.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="js/VTFSCommon.js"></script>
    <script language="javascript" type="text/javascript"
            src="js/datetimepicker.js"></script>
    <link rel="stylesheet" type="text/css" media="all"
          href="js/skins/aqua/theme.css" title="Aqua"/>
    <script language="javascript" type="text/javascript"
            src="js/RegisterCategory.js"></script>
    <script type="text/javascript" src="js/calendar_inc.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/lang/calendar-en.js"></script>
    <script type="text/javascript">
   
       function clearClicked(){
      
       // document.forms[0].elements["hidMode"].value="CLEAR";
        
        document.forms[0].elements["FDate"].value="";
        document.forms[0].elements["TDate"].value="";
        //document.forms[0].submit();
      }
      
           
      
      
      function onSubmit()
      {
        if (validateRequired(document.forms[0])){
            var fromdate  = document.forms[0].elements["FDate"].value;
            var todate =document.forms[0].elements["TDate"].value;
             if((comparWithSysDates(fromdate))&&(comparWithSysDates(todate))){
             if(comparDates(fromdate,todate)){ 
                window.open("reportJSP/PrintPpaidClaimsList.jsp?fromdate="+fromdate+"&todate="+todate,'classPop', "location=1,status=1,scrollbars=1,width=900,height=750,left=100,top=150"); 
           }
    }
     
         }
      }
     
      
     </script>
  </head>
  <body ><html:errors/><html:form action="/ListOfPpaidClaimsAction.do?methodToCall=getListOfPpaidClaims"
                                 method="post">
      <html:javascript formName="ListOfPpaidClaims"/>
      
                 <table width="100%" border="0" cellspacing="0"
                               cellpadding="1">
                          <tr>
                            <td valign="top" class="head_bgcolor">Partpaid Claims List </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%"
                                     border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td valign="top" class="padding5px">
                                    <table width="100%" border="0"
                                           cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td valign="top">
                                          <table border="0"
                                                 class="details_table"
                                                 cellspacing="0"
                                                 cellpadding="0">
                                            <tr>
                                              <td>Parameters</td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td valign="top"><table class="field_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td style="height:50px;"><table width="100%" border="0" cellspacing="0" cellpadding="3">
                                           
                                             <td width="11%">From Date:<span class="red12">*</span>
                                                            
                                                            <html:text property="FDate" name="ListOfPpaidClaims" style="width:110px;hight:14px"  readonly="true"/>
                                            <a><img alt="pick a date" align="Center" width="20" height="21" src="images/cal.JPG"  onclick="return showCalendar('FDate','0','%d-%b-%Y',false,false);" class="cursorHand"></img></a>
                                          </td>
                                            <td width="11%">To Date:<span class="red12">*</span>
                                            <html:text property="TDate" name="ListOfPpaidClaims" style="width:110px;hight:14px" readonly="true"/>
                                           <a><img alt="pick a date" align="Center" width="20" height="21" src="images/cal.JPG"  onclick="return showCalendar('TDate','0','%d-%b-%Y',false,false);" class="cursorHand"></img></a>
                                                  </td>
                                               
                                              </table>
                                                </td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td class="bordertop">
                                      <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                          <tr>
                                            <td class="mandatory">* Mandatory Field</td>
                                            <td>
                                            <div align="right">
                                            <html:hidden property="hidMode" 
                                                         value='<%=checkRecord %>'/>
                                             <html:button property="generate"  value="Generate" onclick="onSubmit()" />
                                               
                                              <html:button property="btnClear"
                                                           value="Clear" 
                                                           onclick="clearClicked();" />
                                                       <input type="hidden" name="mess1" id="mess1" value='<bean:message key="PrintImportLevy.NoRecord"/>'/>                                                                  
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
                         <tr>
                            <td valign="top" class="padding5px">
                              <table width="100%" border="0" cellspacing="0"
                                     cellpadding="0">
                              
                  <tr>
                    <td valign="top"
                        class="padding5px">&nbsp;</td>
                  </tr>
                </table>
                </td>
                </tr>
                </table>
              
      
    </html:form>
    </body>
</html>