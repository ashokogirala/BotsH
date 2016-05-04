<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page import="java.util.*"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
%>
<html xmlns="http://www.w3.org/1999/xhtml">

<%
        java.util.Calendar currentDate =  java.util.Calendar.getInstance();
        java.text.SimpleDateFormat formatter= 
        new java.text.SimpleDateFormat("dd-MMM-yy@HH:mm");
        String dateNow=formatter.format(currentDate.getTime());   
      
        
        String username=(String)request.getSession().getAttribute("CUserID");
       
        if(username==null) username="";
        
        ArrayList levyPayRpt=(ArrayList)request.getAttribute("citylist");
        request.getSession().setAttribute("citylist",levyPayRpt);
        int citylist;
        
        if(levyPayRpt==null){
        citylist=0;
        }else{
        citylist=levyPayRpt.size();
        }
       
     
        
        %>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Companies By Region/Sectors</title>
     <link href="css/displaytagex.css" rel="stylesheet" type="text/css" / >
      <link href="css/boto.css" rel="stylesheet" type="text/css" / >
      <script language="javascript" type="text/javascript" src="js/datetimepicker.js"></script>
      <link rel="stylesheet" type="text/css" media="all" href="js/skins/aqua/theme.css" title="Aqua" />
            <script language="javascript" type="text/javascript" src="js/datetimepicker.js"></script>
            <script language="javascript" type="text/javascript" src="js/menu_home.js"></script>
            <script language="javascript" type="text/javascript" src="js/RegisterCategory.js"></script>
            <script type="text/javascript" src="js/calendar_inc.js"></script>
            <script type="text/javascript" src="js/calendar.js"></script>
            <script type="text/javascript" src="js/lang/calendar-en.js"></script>
            <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
  </head>
<body onload="loading();">
<html:form action="/CompByRegionAction.do?methodToCall=getCompByRegion" method="post" >

<html:javascript formName="CompByRegion" />

    <table width="100%" border="0" cellspacing="0" cellpadding="1">
              <tr>
                <td valign="top" class="head_bgcolor">Claims By Region/Sector</td>
              </tr>
              <tr>
                <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top" class="padding5px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td valign="top"><table border="0" class="details_table" cellspacing="0" cellpadding="0">
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
                                      
                                        <tr>
                                        
                                      <td width="11%">From Date:<span class="red12">*</span>
                                                            
                                                            <html:text property="FDate" name="CompByRegion" style="width:110px;hight:14px"  readonly="true"/>
                                            <a><img alt="pick a date" align="Center" width="20" height="21" src="images/cal.JPG"  onclick="return showCalendar('FDate','0','%d-%b-%Y',false,false);" class="cursorHand"></img></a>
                                          </td>
                                            <td width="11%">To Date:<span class="red12">*</span>
                                            <html:text property="TDate" name="CompByRegion" style="width:110px;hight:14px" readonly="true"/>
                                           <a><img alt="pick a date" align="Center" width="20" height="21" src="images/cal.JPG"  onclick="return showCalendar('TDate','0','%d-%b-%Y',false,false);" class="cursorHand"></img></a>
                                                  </td>  </tr>
                                                  <tr>
                                      <td align="right">Region&nbsp; :<span class="red12">*</span></td>
                                   <td>   <html:select property="regionName"
                                                   name="CompByRegion"  style="width:300px;" >
                                                                <html:option value="">-----------------Select--------------------</html:option>
                                                               <html:options name="citylist" />
                                                                

                                                                 
                                                                </html:select></td></tr>
                 <tr>
                                      <td align="right">
                                          Company Sector&nbsp; :
                                          <span class="red12">
                                            *
                                          </span>
                                      </td><td>    <html:select property="sectorName"
                                                   name="CompByRegion"  style="width:300px;" >
                                                                <html:option value="">-----------------Select--------------------</html:option>
                                                               <html:options name="sectorlist" />
                                                                

                                                                 
                                                                </html:select></td></tr>        
                      
                                        
                                                  <td>&nbsp;</td>                                             
                                         <!--    <td><a href="#"><img src="images/list_img.jpg" border="0" /></a></td> -->
                                         <!--    NewCal([textbox id],[date format],[show time in calendar?],[time mode (12,24)?])-->
                                               
                                            </table></td>
                                          </tr>
                                      </table>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="bordertop">
                                      <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                          <tr>
                                            <td class="mandatory">* Mandatory Field</td>
                                            <td>
                                                <html:button property="sss" value="Generate" onclick="generateClicked();"  />
                                                 
                                                  <html:button property="btnClear"
                                                                           value="Clear" onclick="clearClicked();" />
                                             <html:hidden name="CompByRegion" property="hidMode"/>
                                                 <input type="hidden" name="mess1" id="mess1" value='<bean:message key="PrintImportLevy.NoRecord"/>' />
                                                   
                                            </td>
                                          </tr>
                                          
                                      </table>
                                      </td>
                                    </tr>
                                </table></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table></td>
                  </tr>
         
                  <tr>
                    <td valign="top"
                        class="padding5px">&nbsp;</td>
                  </tr>
                </table>
            
</html:form>
  </body>
</html>

                                 
<script type="text/javascript">
   
      /* function clearClicked(){
        document.forms[0].elements["hidMode"].value="CLEAR";
        document.forms[0].elements["fileName"].value="";
       document.forms[0].submit();
       
    }*/
    
     function clearClicked(){
      document.forms[0].elements["FDate"].value="";
        document.forms[0].elements["TDate"].value="";
        document.forms[0].action='<%=request.getContextPath()%>'+'/CompByRegionAction.do?methodToCall=clearSelectedRole';
       
       document.forms[0].submit();
       
    }
    
    
    
    
    
     function getSelectFile()
            {
                 document.forms[0].action='<%=request.getContextPath()%>'+'/CompByRegionAction.do?methodToCall=onUserFileSelect';
                 document.forms[0].submit();
            }
            
          
            
    /*function generateClicked(){
    
    if (validateRequired(document.forms[0])){      
      
        var regionName=document.forms[0].elements["regionName"].value;        
        var sectorName=document.forms[0].elements["sectorName"].value;        
        window.open("reportJSP/PrintReconcile.jsp?regionName="+regionName,'classPop', "location=1,status=1,scrollbars=1,width=900,height=750,left=100,top=150"); 
        //document.forms[0].submit();
       }
       }*/
       
       
    function generateClicked()
      {
        if (validateRequired(document.forms[0])){
            var fromdate  = document.forms[0].elements["FDate"].value;
            var todate =document.forms[0].elements["TDate"].value;
             var regionName=document.forms[0].elements["regionName"].value;        
            var sectorName=document.forms[0].elements["sectorName"].value;    
             if((comparWithSysDates(fromdate))&&(comparWithSysDates(todate))){
             if(comparDates(fromdate,todate)){ 
                window.open("reportJSP/PrintClaimByRegion.jsp?fromdate="+fromdate+"&todate="+todate+"&regionName="+regionName+"&sectorName="+sectorName,'classPop', "location=1,status=1,scrollbars=1,width=900,height=750,left=100,top=150"); 
           }
    }
     
         }
      }   
       
       
       
       
       
       
       
       
       
      
      
      
      
   /*   function checkRecord(){
         if(document.forms[0].htxtMode.value=="NoRecord"){
                alert(document.forms[0].mess1.value);
                onload="checkRecord();"
                }
      }*/
    </script>
 